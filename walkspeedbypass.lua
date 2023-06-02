-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame as the background
local frame = Instance.new("Frame")
frame.Name = "ButtonFrame"
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0.5, -100, 0.5, -40)
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
frame.Parent = screenGui

-- Create a TextBox to set the walkspeed
local textBox = Instance.new("TextBox")
textBox.Name = "SpeedTextBox"
textBox.Size = UDim2.new(1, -10, 0, 30)
textBox.Position = UDim2.new(0, 5, 0, 5) -- Padding
textBox.BackgroundTransparency = 0.8 -- Semi-transparent background
textBox.TextColor3 = Color3.new(1, 1, 1) -- White text color
textBox.PlaceholderText = "Enter walkspeed (13-200)"
textBox.Parent = frame

-- Create an Enable button
local enableButton = Instance.new("TextButton")
enableButton.Name = "EnableButton"
enableButton.Size = UDim2.new(0.5, -10, 0, 30)
enableButton.Position = UDim2.new(0, 5, 1, -35) -- Padding
enableButton.BackgroundColor3 = Color3.new(0, 0.5, 0) -- Green background
enableButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
enableButton.Font = Enum.Font.GothamBold
enableButton.TextSize = 18
enableButton.Text = "ENABLE"
enableButton.Parent = frame

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

-- Function to enable/disable the walkspeed script
local function toggleWalkspeedScript()
    walkspeedEnabled = not walkspeedEnabled -- Toggle the state

    -- Enable or disable the walkspeed script based on the state
    if walkspeedEnabled then
        -- Enable the script
        local speed = tonumber(textBox.Text)
        if not speed or speed < MIN_SPEED or speed > MAX_SPEED then
            textBox.Text = tostring(MIN_SPEED)
            speed = MIN_SPEED
        end
        enableButton.Text = "DISABLE"

        while walkspeedEnabled do
            for _, player in ipairs(game.Players:GetPlayers()) do
                setWalkspeed(player, speed)
            end
            wait(0.03) -- Loop interval of 0.03 seconds
        end
    else
        -- Disable the script
        enableButton.Text = "ENABLE"

        for _, player in ipairs(game.Players:GetPlayers()) do
            setWalkspeed(player, MIN_SPEED)
        end
    end
end

-- Connect the function to the enable button's MouseButton1Click event
enableButton.MouseButton1Click:Connect(toggleWalkspeedScript)

-- Dragging functionality (unchanged)
local dragging
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    frame.Position = newPosition
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
        if dragging then
            updateDrag(input)
        end
    end
end)

enableButton.InputBegan:Connect(function(input)
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

enableButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragging then
            updateDrag(input)
        end
    end
end)
