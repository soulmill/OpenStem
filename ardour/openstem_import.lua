ardour {
  ["type"]    = "EditorAction",
  name        = "Import OpenStem ...",
}

function factory (unused_params)
  return function ()
    local dialog_options = {
      {type="heading", title="OpenStem Import"},
      {type="folder", key="openstem_dir", title="OpenStem Directory", path="~/"}
    }
    local kv = LuaDialog.Dialog ("OpenStem Import", dialog_options):run ()
    if not kv then return end -- cancel

    local path = kv["openstem_dir"]
    local i, t = 1, {}
    local pfile = io.popen('ls "'..path..'"')

    for filename in pfile:lines() do
      local ext = filename:sub(-3)
      if ext == "wav" or ext == "WAV" then
        t[i] = filename
        i = i + 1
      end
    end

    pfile:close()

    local playhead = Session:transport_sample ()
    local j = 1

    local routes = Editor:get_selection ().tracks:routelist ()
    for route in routes:iter () do
    -- You can replace the two lines above with the following for selecting channel statically by name prefix.
    -- for j=1,i do
    --   local route = Session:route_by_name("Ch "..j)
      if j < i then
        local files = C.StringVector()
        files:push_back(path.."/"..t[j])
        local track = route:to_track()
        local pos = Temporal.timepos_t(playhead)
        Editor:do_embed (files, Editing.ImportSerializeFiles, Editing.ImportToTrack, pos, ARDOUR.PluginInfo(), track)
      end
      j = j + 1
    end
  end
end
