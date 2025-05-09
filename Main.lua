-- Credit UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CreditsGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local creditFrame = Instance.new("Frame")
creditFrame.Size = UDim2.new(0, 300, 0, 80)
creditFrame.Position = UDim2.new(0.5, -150, 0.5, -40)
creditFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
creditFrame.BorderSizePixel = 0
creditFrame.Parent = screenGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local hotbar = playerGui:WaitForChild("Hotbar"):WaitForChild("Backpack"):WaitForChild("Hotbar")

local button4 = hotbar:FindFirstChild("4")
if not button4 then
    warn("Button 4 not found!")
    return
end

local cooldown = false

-- Clone button 4 to button 5
local button5 = button4:Clone()
button5.Name = "5"
button5.Parent = hotbar
button5.Position = button4.Position + UDim2.new(0, button4.Size.X.Offset + 5, 0, 0)
button5.Base.ToolName.Text = "SpeedBurst"

local function setCooldownVisual(active)
    if active then
        button5.Base.BackgroundColor3 = Color3.fromRGB(150, 150, 150) -- gray out
        button5.Base.ToolName.Text = "Cooldown"
    else
        button5.Base.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        button5.Base.ToolName.Text = "SpeedBurst"
    end
end

button5.Base.MouseButton1Click:Connect(function()
    if cooldown then
        warn("Move on cooldown!")
        return
    end

    cooldown = true
    setCooldownVisual(true)

    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        local originalSpeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = originalSpeed * 10  -- 10x speed

        -- Aura effect
        local aura = Instance.new("ParticleEmitter")
        aura.Texture = "rbxassetid://248625108" -- Example aura texture
        aura.Rate = 200
        aura.Lifetime = NumberRange.new(0.5)
        aura.Speed = NumberRange.new(1, 3)
        aura.Size = NumberSequence.new(1.5)
        aura.Parent = character:FindFirstChild("HumanoidRootPart")

        -- Play custom run animation
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://913376220" -- Replace with your preferred running animation ID
        local track = humanoid:LoadAnimation(anim)
        track:Play()

        -- Clean aura after 10 seconds
        game:GetService("Debris"):AddItem(aura, 10)

        -- Wait for 10 seconds duration
        task.wait(10)

        -- Reset speed and stop animation
        humanoid.WalkSpeed = originalSpeed
        track:Stop()

        -- Start cooldown for 1 second
        task.wait(1)
        cooldown = false
        setCooldownVisual(false)
        print("SpeedBurst ready again!")
    else
        warn("Humanoid not found!")
    end
end)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = creditFrame

local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.5
shadow.Parent = creditFrame

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, -20, 1, -20)
creditLabel.Position = UDim2.new(0, 10, 0, 10)
creditLabel.BackgroundTransparency = 1
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.Font = Enum.Font.GothamBold
creditLabel.TextScaled = true
creditLabel.Text = "Credits: Mohammad Khan on YouTube"
creditLabel.Parent = creditFrame

task.wait(5)
screenGui:Destroy()

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
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local hotbar = playerGui:WaitForChild("Hotbar"):WaitForChild("Backpack"):WaitForChild("Hotbar")

local button4 = hotbar:FindFirstChild("4")
if not button4 then
    warn("Button 4 not found!")
    return
end

local cooldown = false

-- Clone button 4 to button 5
local button5 = button4:Clone()
button5.Name = "5"
button5.Parent = hotbar
button5.Position = button4.Position + UDim2.new(0, button4.Size.X.Offset + 5, 0, 0)
button5.Base.ToolName.Text = "SpeedBurst"

local function setCooldownVisual(active)
    if active then
        button5.Base.BackgroundColor3 = Color3.fromRGB(150, 150, 150) -- gray out
        button5.Base.ToolName.Text = "Cooldown"
    else
        button5.Base.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        button5.Base.ToolName.Text = "SpeedBurst"
    end
end

button5.Base.MouseButton1Click:Connect(function()
    if cooldown then
        warn("Move on cooldown!")
        return
    end

    cooldown = true
    setCooldownVisual(true)

    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        local originalSpeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = originalSpeed * 10  -- 10x speed

        -- Aura effect
        local aura = Instance.new("ParticleEmitter")
        aura.Texture = "rbxassetid://248625108" -- Example aura texture
        aura.Rate = 200
        aura.Lifetime = NumberRange.new(0.5)
        aura.Speed = NumberRange.new(1, 3)
        aura.Size = NumberSequence.new(1.5)
        aura.Parent = character:FindFirstChild("HumanoidRootPart")

        -- Play custom run animation
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://913376220" -- Replace with your preferred running animation ID
        local track = humanoid:LoadAnimation(anim)
        track:Play()

        -- Clean aura after 10 seconds
        game:GetService("Debris"):AddItem(aura, 10)

        -- Wait for 10 seconds duration
        task.wait(10)

        -- Reset speed and stop animation
        humanoid.WalkSpeed = originalSpeed
        track:Stop()

        -- Start cooldown for 1 second
        task.wait(1)
        cooldown = false
        setCooldownVisual(false)
        print("SpeedBurst ready again!")
    else
        warn("Humanoid not found!")
    end
end)
