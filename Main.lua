-- HOTBAR BUTTON NAMES
local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")

local names = {"Smash", "Blast", "Charge", "Destroy"}
for i, name in ipairs(names) do
    local baseButton = hotbarFrame:FindFirstChild(tostring(i)).Base
    baseButton.ToolName.Text = name
end

-- CHANGE ULT TEXT
local function findGuiAndSetText()
    local screenGui = playerGui:FindFirstChild("ScreenGui")
    if screenGui then
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
        if magicHealthFrame then
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
            if textLabel then
                textLabel.Text = "Mohammad Khan Power"
            end
        end
    end
end
playerGui.DescendantAdded:Connect(findGuiAndSetText)
findGuiAndSetText()

-- ULT BAR COLOR
game.Players.LocalPlayer.PlayerGui.ScreenGui.MagicHealth.Health.Bar.Bar.ImageColor3 = Color3.fromRGB(255, 0, 0)

-- ULTIMATE MOVE LISTENERS
local function setupMove(animationId, replacementId, effects)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local function onAnimationPlayed(track)
        if track.Animation.AnimationId == "rbxassetid://" .. animationId then
            for _, playing in pairs(humanoid:GetPlayingAnimationTracks()) do playing:Stop() end
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. replacementId
            local newTrack = humanoid:LoadAnimation(anim)
            newTrack:Play()
            for _, effect in ipairs(effects) do
                local vfx = effect:Clone()
                vfx.Parent = character[effect.ParentName or "Torso"]
                for _, emitter in ipairs(vfx:GetChildren()) do if emitter:IsA("ParticleEmitter") then emitter:Emit(effect.Amount or 10) end end
                task.delay(3, function() vfx:Destroy() end)
            end
        end
    end
    humanoid.AnimationPlayed:Connect(onAnimationPlayed)
end

setupMove(10468665991, 100558589307006, {game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].EyeEmit})
setupMove(10466974800, 17799224866, {game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmBurst.a})
setupMove(10471336737, 12463072679, {game.ReplicatedStorage.Resources.DownSlam["Impact"].Part.Attachment})
setupMove(12510170988, 18179181663, {game.ReplicatedStorage.Resources.Fissure['DragonExplode'].Part.L})

print("Script loaded with Mohammad Khan Power!")
