local ScriptTesting = {}

local function log_error(err)
  local traceback = debug.traceback~=nil and debug.traceback() or "nil"
  local fullerr = tostring(err)..", traceback:\n"..traceback
  system.log("ERROR : "..fullerr)
  return fullerr
end

local function LoadFunction()
    -- Insert Script executed at savegame loading to test here: 
    -- START
    print("load")
    print(_VERSION)
    
    -- END
end

local function UnloadFunction()
    -- Insert Script executed at savegame unloading to test here: 
    -- START
    print("unload")

    -- END
end

local function TickFunction()
    -- Insert Script executed at gametick to test here: 
    -- START
    --print(Selection.Object.ID)

    -- END
end

local function MainFunction()
    -- Insert Script executed by pressing SHIFT + F11 to test here: 
    -- START
    print("main")
    
    -- END
end

function ScriptTesting.Load()
    local status,err = xpcall(LoadFunction, log_error)
    if status==false then
        error(err)
    end
end

function ScriptTesting.Unload()
    local status,err = xpcall(UnloadFunction, log_error)
    if status==false then
        error(err)
    end
end

function ScriptTesting.Tick()
    local status,err = xpcall(TickFunction, log_error)
    if status==false then
        error(err)
    end
end

function ScriptTesting.Main()
    local status,err = xpcall(MainFunction, log_error)
    if status==false then
        error(err)
    end
end

return ScriptTesting;


