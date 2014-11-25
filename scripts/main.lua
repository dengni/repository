
function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

require("config")
require("framework.init")
--require("framework.audio")
require("app.myClass.ClassManager")
require("app.MyApp").new():run()

