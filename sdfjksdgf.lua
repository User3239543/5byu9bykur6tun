local groupId = 11872496

local function onGroupPlayerJoin(player)
    print(player.Name .. " from group " .. groupId .. " has joined the game!")
    OrionLib:MakeNotification({
	Name = "Staff Detected",
	Content = "A Staff Member is Detected to be in-game",
	Image = "rbxassetid://4483345998",
	Time = 5
})
end

local function isPlayerInGroup(player)
    local userId = player.UserId
    local isInGroup = player:IsInGroup(groupId)
    return isInGroup
end

local function detectGroupPlayers()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if isPlayerInGroup(player) then
            onGroupPlayerJoin(player)
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        if isPlayerInGroup(player) then
            onGroupPlayerJoin(player)
        end
    end)
end

Tab:AddButton({
    Name = "Staff Detection",
    Callback = function()
        detectGroupPlayers()
    end    
})
