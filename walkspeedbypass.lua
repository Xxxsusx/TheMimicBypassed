-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame as the background
local frame = Instance.new("Frame")
frame.Name = "ButtonFrame"
frame.Size = UDim2.new(0.348247588, 0, 0.273972601, 0)
frame.Position = UDim2.new(0.322062045, 0, 0.33561644, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
frame.Parent = screenGui

local UICorner = Instance.new("UICorner")
UICorner.Parent = frame

local secondFrame = Instance.new("Frame")
secondFrame.Name = "SecondButtonFrame"
secondFrame.Size = UDim2.new(0.963597417, 0, 0.904999971, 0)
secondFrame.Position = UDim2.new(0.0192719493, 0, 0.0500000007, 0)
secondFrame.BackgroundColor3 = Color3.new(30, 30, 30)
secondFrame.Parent = frame

local UICorner_2 = Instance.new("UICorner")
UICorner_2.Parent = secondFrame

-- Create a TextButton inside the frame for enable/disable
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0.5, -10, 1, -10) -- Smaller size with padding
toggleButton.Position = UDim2.new(0, 5, 0, 5) -- Padding
toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
toggleButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
toggleButton.Font = Enum.Font.GothamBold -- Set font to GothamBold
toggleButton.TextSize = 18 -- Adjust the font size
toggleButton.Text = "ENABLE"
toggleButton.Parent = secondFrame

-- Create a TextBox for setting the speed
local textBox = Instance.new("TextBox")
textBox.Name = "SpeedTextBox"
textBox.Size = UDim2.new(0, 150, 0, 25)
textBox.Position = UDim2.new(0.5, 5, 0, 35) -- Below the toggle button
textBox.BackgroundColor3 = Color3.new(1, 1, 1) -- White background
textBox.TextColor3 = Color3.new(0, 0, 0) -- Black text color
textBox.Font = Enum.Font.GothamBold -- Set font to GothamBold
textBox.TextSize = 14 -- Adjust the font size
textBox.PlaceholderText = "Set speed (13-200)"
textBox.Parent = secondFrame

-- Create a Minimize button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -25, 1, -25) -- Bottom right corner
minimizeButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
minimizeButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
minimizeButton.Font = Enum.Font.GothamBold -- Set font to GothamBold
minimizeButton.TextSize = 14 -- Adjust the font size
minimizeButton.Text = "-"
minimizeButton.Parent = secondFrame

-- Walkspeed configuration
local MIN_SPEED = 13 -- Minimum walkspeed value
local MAX_SPEED = 200 -- Maximum walkspeed value
local walkspeedEnabled = false -- Variable to track the state of walkspeed script

-- Function to set the walkspeed
local function setWalkspeed(player, speed)
    if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
        player.Character.Humanoid.WalkSpeed = speed
    end
end

-- Function to toggle the walkspeed script
local function toggleWalkspeedScript()
    walkspeedEnabled = not walkspeedEnabled -- Toggle the state
    local speed = tonumber(textBox.Text)

    if walkspeedEnabled then
        -- Enable the script
        if speed and speed >= MIN_SPEED and speed <= MAX_SPEED then
            toggleButton.Text = "DISABLED"
            toggleButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
            while walkspeedEnabled do
                for _, player in ipairs(game.Players:GetPlayers()) do
                    setWalkspeed(player, speed)
                end
                wait(0.03) -- Loop interval of 0.03 seconds
            end
        else
            walkspeedEnabled = false -- Invalid speed, revert back to disabled state
            textBox.Text = ""
        end
    else
        -- Disable the script
        toggleButton.Text = "ENABLE"
        toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                player.Character.Humanoid.WalkSpeed = MIN_SPEED -- Set to minimum walkspeed
            end
        end
    end
end

-- Function to minimize or restore the frame
local function toggleMinimize()
    if secondFrame.Size == UDim2.new(0.963597417, 0, 0.904999971, 0) then
        secondFrame.Size = UDim2.new(0.963597417, 0, 0, 40)
        minimizeButton.Text = "+"
        minimizeButton.Position = UDim2.new(1, -25, 1, -25) -- Bottom right corner
    else
        secondFrame.Size = UDim2.new(0.963597417, 0, 0.904999971, 0)
        minimizeButton.Text = "-"
        minimizeButton.Position = UDim2.new(1, -25, 1, -25) -- Bottom right corner
    end
end

-- Function for draggable functionality
local function enableDragging(frame)
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

enableDragging(frame)

-- Connect the button's click event to toggle the walkspeed script
toggleButton.MouseButton1Click:Connect(toggleWalkspeedScript)

-- Connect the minimize button's click event to toggle minimize/restore
minimizeButton.MouseButton1Click:Connect(toggleMinimize)
