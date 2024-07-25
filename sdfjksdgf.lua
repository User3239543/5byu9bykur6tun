local groupId = 11872496

local function onGroupPlayerJoin(player)
    print(player.Name .. " from group " .. groupId .. " has joined the game!")
    OrionLib:MakeNotification({
	Name = "Staff Detection:",
	Content = "We have Detected Staff in your game!",
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

-- Automatically call the function to detect group players
detectGroupPlayers()
