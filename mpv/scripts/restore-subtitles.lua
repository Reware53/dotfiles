--[[
Saves selected subtitle tracks to `saved-subs.json` file in mpv directory and restores them whenever file is loaded.
Differs from `watch-later`-saved data in that it saves secondary subtitles too (and uses subtitle file paths instead of ids).
It also stores subtitle visibility state for a secondary subtitles too.
]]--

local mp = require "mp"
local utils = require "mp.utils"

local dataFilePath = (mp.command_native({'expand-path', '~~/saved-subs.json'}))
local jsonFile = io.open(dataFilePath, 'a+')
local savedData = utils.parse_json(jsonFile:read("*all"))
if savedData == nil then
    savedData = {}
end
jsonFile:close()


local function getTrackTitle(track)
  if track == nil then
    return "none"
  end

  local title = track.title
  local lang = track.lang
  local codec = track.codec:upper()
  local default = track.default
  local forced = track.forced
  local external = track.external
  local filename = mp.get_property_native("filename/no-ext")

  if title then title = title:gsub(filename, '') end
  if codec:match("PGS") then codec = "PGS"
  elseif codec:match("SUBRIP") then codec = "SRT"
  elseif codec:match("VTT") then codec = "VTT"
  elseif codec:match("DVB_SUB") then codec = "DVB"
  elseif codec:match("DVD_SUB") then codec = "VOB"
  end

  if title and lang then title = title .. ", " .. lang .. "[" .. codec .. "]"
  elseif title then title = title .. "[" .. codec .. "]"
  elseif lang then title = lang .. "[" .. codec .. "]"
  elseif codec then title = "[" .. codec .. "]"
  end

  if forced then  title = title .. ", " .. "Forced" end
  if default then  title = title .. ", " .. "Default" end
  if external then  title = title .. ", " .. "External" end

  return title
end


local function getTrackByTitle(title)
  for _, track in pairs(mp.get_property_native("track-list")) do
    if getTrackTitle(track) == title then
      return track
    end
  end

  return nil
end


local function getFileId()
  -- todo: this path can be relative, we should consider turning it into an absolute path
  return mp.get_property_native("path")
end


local function saveDataFile()
  local file = io.open(dataFilePath, 'w+')
  if file == nil then
    return
  end

  local jsonContent, ret = utils.format_json(savedData)
  if ret ~= error and jsonContent ~= nil then
      file:write(jsonContent)
  end

  file:close()
end


local function restoreSubs()
  local fileData = savedData[getFileId()]
  if fileData == nil then
    return
  end

  if fileData.sub1 ~= nil then
    local subTrack = getTrackByTitle(fileData.sub1)
    if subTrack ~= nil then
      mp.set_property("sid", subTrack.id)
    end

    if fileData.sub1_vis ~= nil then
      mp.set_property_native("sub-visibility", fileData.sub1_vis)
    end
  end

  if fileData.sub2 ~= nil then
    local subTrack = getTrackByTitle(fileData.sub2)
    if subTrack ~= nil then
      mp.set_property("secondary-sid", subTrack.id)
    end

    if fileData.sub2_vis ~= nil then
      mp.set_property_native("secondary-sub-visibility", fileData.sub2_vis)
    end
  end

  fileData.used = os.time()
  saveDataFile()
end


local function saveData(sub1, sub2, sub1_vis, sub2_vis)
  local fileId = getFileId()
  savedData[fileId] = {
    used = os.time(),
    sub1 = sub1,
    sub2 = sub2,
    sub1_vis = sub1_vis,
    sub2_vis = sub2_vis
  }

  saveDataFile()
end


local function onTracksChanged()
  local sub = mp.get_property_native("current-tracks/sub")
  local sub2 = mp.get_property_native("current-tracks/sub2")

  saveData(getTrackTitle(sub), getTrackTitle(sub2), mp.get_property_native("sub-visibility"), mp.get_property_native("secondary-sub-visibility"))
end

mp.register_event("file-loaded", function()
  restoreSubs()

  mp.observe_property("current-tracks/sub", "native", onTracksChanged)
  mp.observe_property("current-tracks/sub2", "native", onTracksChanged)
  mp.observe_property('sub-visibility', "native", onTracksChanged)
  mp.observe_property('secondary-sub-visibility', "native", onTracksChanged)
end)
