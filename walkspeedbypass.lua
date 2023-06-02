-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame as the background
local frame = Instance.new("Frame")
frame.Name = "ButtonFrame"
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0, 20, 1, -100) -- Bottom left corner
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
frame.Parent = screenGui

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
toggleButton.Parent = frame

-- Create a TextBox for setting the speed
local textBox = Instance.new("TextBox")
textBox.Name = "SpeedTextBox"
textBox.Size = UDim2.new(0, 150, 0, 25)
textBox.Position = UDim2.new(0.5, 5, 0, 45) -- Adjusted position
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Cyan background
textBox.TextColor3 = Color3.new(0, 0, 0) -- Black text color
textBox.Font = Enum.Font.GothamBold -- Set font to GothamBold
textBox.TextSize = 14 -- Adjust the font size
textBox.PlaceholderText = "Set speed (13-200)"
textBox.Parent = frame

-- Create a Minimize button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -25, 0, 5) -- Top right corner
minimizeButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
minimizeButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
minimizeButton.Font = Enum.Font.GothamBold -- Set font to GothamBold
minimizeButton.TextSize = 14 -- Adjust the font size
minimizeButton.Text = "-"
minimizeButton.Parent = frame

-- Walkspeed configuration
local MIN_SPEED = 13 -- Minimum walkspeed value
local MAX_SPEED = 200 -- Maximum walkspeed value
local walkspeedEnabled = false -- Variable to track the state of walkspeed script

-- Function to set the walkspeed
local function setWalkspeed(player, speed)
    if player.Character and player.Character:FindFirstChild("Humanoid") and speed >= MIN_SPEED and speed <= MAX_SPEED then
        player.Character.Humanoid.WalkSpeed = speed
    end
end

-- Function to toggle the walkspeed script
local function toggleWalkspeedScript()
    walkspeedEnabled = not walkspeedEnabled

    if walkspeedEnabled then
        local speed = tonumber(textBox.Text)
        if speed then
            while walkspeedEnabled do
                setWalkspeed(game.Players.LocalPlayer, speed)
                wait(0.03) -- Delay to limit the walkspeed update frequency
            end
            toggleButton.Text = "DISABLE"
            toggleButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
        end
    else
        setWalkspeed(game.Players.LocalPlayer, MIN_SPEED)
        toggleButton.Text = "ENABLE"
        toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
    end
end

-- Function to toggle the minimize/restore
local function toggleMinimize()
    if minimizeButton.Text == "-" then
        frame.Size = UDim2.new(0, 20, 0, 20) -- Minimize the frame size
        minimizeButton.Text = "+"
        textBox.Visible = false -- Hide the textBox when frame is minimized
    else
        frame.Size = UDim2.new(0, 200, 0, 80) -- Restore the frame size
        minimizeButton.Text = "-"
        textBox.Visible = true -- Show the textBox when frame is restored
    end
end

-- Function to enable dragging of the frame
local function enableDragging(gui)
    local dragInput, dragStart, startPos
    local dragging = false

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
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
