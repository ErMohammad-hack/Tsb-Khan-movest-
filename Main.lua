-- Change Hotbar Button Names
local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")

-- Button 1
local baseButton1 = hotbarFrame:FindFirstChild("1").Base
baseButton1.ToolName.Text = "FireStrike"

-- Button 2
local baseButton2 = hotbarFrame:FindFirstChild("2").Base
baseButton2.ToolName.Text = "WindSlash"

-- Button 3
local baseButton3 = hotbarFrame:FindFirstChild("3").Base
baseButton3.ToolName.Text = "EarthSmash"

-- Button 4
local baseButton4 = hotbarFrame:FindFirstChild("4").Base
baseButton4.ToolName.Text = "WaterBurst"

-- MagicHealth UI Text Change
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

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

-- Move 1
local animationId1 = 10468665991
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function onAnimationPlayed1(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId1 then
        local Humanoid = player.Character:WaitForChild("Humanoid")
        for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
            animTrack:Stop()
        end
        local AnimAnim = Instance.new("Animation")
        AnimAnim.AnimationId = "rbxassetid://100558589307006"
        local Anim = Humanoid:LoadAnimation(AnimAnim)
        local startTime = 0
        Anim:Play(0)

        local eye1 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].EyeEmit:Clone()
        eye1.Parent = player.Character["Head"]
        for _, child3 in ipairs(eye1:GetChildren()) do
            if child3:IsA("ParticleEmitter") then child3:Emit(200) end
        end

        local vfx1 = game.ReplicatedStorage.Resources.Fissure["smoke"].smoke.Attachment:Clone()
        vfx1.Parent = player.Character["Left Leg"]
        for _, child1 in ipairs(vfx1:GetChildren()) do
            if child1:IsA("ParticleEmitter") then child1:Emit(200) end
        end

        task.wait(0.6)
        humanoid.HipHeight = 0
        local vfx = game.ReplicatedStorage.Resources.Fissure["jump"].jump.Attachment:Clone()
        vfx.Parent = player.Character["Right Leg"]
        for _, child in ipairs(vfx:GetChildren()) do
            if child:IsA("ParticleEmitter") then child:Emit(200) end
        end

        task.wait(3)
        vfx:Destroy()
        eye1:Destroy()
        vfx1:Destroy()

        Anim:AdjustSpeed(0)
        Anim.TimePosition = startTime
        Anim:AdjustSpeed(1)
    end
end

humanoid.AnimationPlayed:Connect(onAnimationPlayed1)

-- Move 2
local animationId2 = 10466974800

local function onAnimationPlayed2(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId2 then
        local Humanoid = player.Character:WaitForChild("Humanoid")
        for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
            animTrack:Stop()
        end
        local AnimAnim = Instance.new("Animation")
        AnimAnim.AnimationId = "rbxassetid://17799224866"
        local Anim = Humanoid:LoadAnimation(AnimAnim)
        local startTime = 0
        Anim:Play()
        Anim:AdjustSpeed(0)
        Anim.TimePosition = startTime
        Anim:AdjustSpeed(1)

        local vfx = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmBurst.a:Clone()
        vfx.Parent = player.Character["Right Leg"]
        for _, child in ipairs(vfx:GetChildren()) do
            if child:IsA("ParticleEmitter") then child:Emit(5) end
        end

        local vfx1 = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmFX:Clone()
        vfx1.Parent = player.Character["Left Leg"]
        for _, child2 in ipairs(vfx1:GetChildren()) do
            if child2:IsA("ParticleEmitter") then child2:Emit(5) end
        end

        local eye = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].EyeEmit:Clone()
        eye.Parent = player.Character["Head"]
        for _, child2 in ipairs(eye:GetChildren()) do
            if child2:IsA("ParticleEmitter") then child2:Emit(200) end
        end

        task.wait(1.25)
        vfx:Destroy()
        vfx1:Destroy()
        eye:Destroy()
    end
end

humanoid.AnimationPlayed:Connect(onAnimationPlayed2)

-- Move 3
local animationId3 = 10471336737

local function onAnimationPlayed3(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId3 then
        local Humanoid = player.Character:WaitForChild("Humanoid")
        for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
            animTrack:Stop()
        end
        local AnimAnim = Instance.new("Animation")
        AnimAnim.AnimationId = "rbxassetid://12463072679"
        local Anim = Humanoid:LoadAnimation(AnimAnim)
        local startTime = 0
        Anim:Play()

        local vfx = game.ReplicatedStorage.Resources.DownSlam["Impact"].Part.Attachment:Clone()
        vfx.Parent = player.Character["Left Leg"]
        for _, child in ipairs(vfx:GetChildren()) do
            if child:IsA("ParticleEmitter") then child:Emit(5) end
        end

        local vfx2 = game.ReplicatedStorage.Resources.Fissure["WallExplode"].Smoke.Attachment:Clone()
        vfx2.Parent = player.Character["Torso"]
        for _, child2 in ipairs(vfx2:GetChildren()) do
            if child2:IsA("ParticleEmitter") then child2:Emit(20) end
        end

        task.wait(0.5)
        local vfx1 = game.ReplicatedStorage.Resources.Fissure["jump"].jump.Attachment:Clone()
        vfx1.Parent = player.Character["Torso"]
        for _, child1 in ipairs(vfx1:GetChildren()) do
            if child1:IsA("ParticleEmitter") then child1:Emit(20) end
        end

        task.wait(2.3)
        vfx:Destroy()
        vfx1:Destroy()
        vfx2:Destroy()
        Anim:Stop()
        Anim:AdjustSpeed(0)
        Anim.TimePosition = startTime
        Anim:AdjustSpeed(1)

        delay(1.8, function()
            Anim:Stop()
        end)
    end
end

humanoid.AnimationPlayed:Connect(onAnimationPlayed3)

-- Move 4
local animationId4 = 12510170988

local function onAnimationPlayed4(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. animationId4 then
        local Humanoid = player.Character:WaitForChild("Humanoid")
        for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
            animTrack:Stop()
        end
        local AnimAnim = Instance.new("Animation")
        AnimAnim.AnimationId = "rbxassetid://13294790250"
        local Anim = Humanoid:LoadAnimation(AnimAnim)
        local startTime = 0
        Anim:Play()
        Anim:AdjustSpeed(0)
        Anim.TimePosition = startTime
        Anim:AdjustSpeed(1)
    end
end

humanoid.AnimationPlayed:Connect(onAnimationPlayed4)

-- Ult bar color
game.Players.LocalPlayer.PlayerGui.ScreenGui.MagicHealth.Health.Bar.Bar.ImageColor3 = Color3.fromRGB(255, 0, 0) -- red
