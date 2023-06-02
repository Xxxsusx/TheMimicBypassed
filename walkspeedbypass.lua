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

-- Create a TextButton inside the frame
local button = Instance.new("TextButton")
button.Name = "ToggleButton"
button.Size = UDim2.new(1, -10, 1, -50) -- Smaller size with padding
button.Position = UDim2.new(0, 5, 0, 5) -- Padding
button.BackgroundTransparency = 1 -- Transparent background
button.TextColor3 = Color3.new(1, 1, 1) -- White text color
button.Font = Enum.Font.GothamBold -- Set font to GothamBold
button.TextSize = 18 -- Adjust the font size
button.Text = "ENABLE"
button.Parent = frame

-- Create a slider to adjust the speed
local slider = Instance.new("TextLabel")
slider.Name = "SpeedSlider"
slider.Size = UDim2.new(1, -10, 0, 30)
slider.Position = UDim2.new(0, 5, 1, -35)
slider.BackgroundTransparency = 1 -- Transparent background
slider.TextColor3 = Color3.new(1, 1, 1) -- White text color
slider.Font = Enum.Font.Gotham
slider.TextSize = 16
slider.Text = "Walkspeed: 13"
slider.Parent = frame

local speedBar = Instance.new("Frame")
speedBar.Name = "SpeedBar"
speedBar.Size = UDim2.new(0, 0, 1, -4)
speedBar.Position = UDim2.new(0, 2, 0, 2)
speedBar.BackgroundColor3 = Color3.new(0, 0.5, 1) -- Blue color
speedBar.Parent = slider

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
    button.Text = walkspeedEnabled and "DISABLE" or "ENABLE" -- Update button text

    -- Enable or disable the walkspeed script based on the state
    if walkspeedEnabled then
        -- Enable the script
        while walkspeedEnabled do
            for _, player in ipairs(game.Players:GetPlayers()) do
                setWalkspeed(player, sliderValue)
            end
            wait(0.03) -- Loop interval of 0.03 seconds
        end
    else
        -- Disable the script
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                setWalkspeed(player, MIN_SPEED) -- Set to minimum walkspeed
            end
        end
    end
end

-- Function to update the slider value and walkspeed text
local function updateSliderValue(value)
    local speed = math.floor(MIN_SPEED + (MAX_SPEED - MIN_SPEED) * value)
    slider.Text = "Walkspeed: " .. speed
    if walkspeedEnabled then
        for _, player in ipairs(game.Players:GetPlayers()) do
            setWalkspeed(player, speed)
        end
    end
end

-- Slider functionality
local sliderValue = 0 -- Current slider value

local function updateSliderPosition(input)
    local position = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
    sliderValue = position
    speedBar.Size = UDim2.new(position, -4, 1, -4)
    updateSliderValue(position)
end

slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        updateSliderPosition(input)
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                updateSliderValue(sliderValue)
            end
        end)
    end
end)

slider.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if input.UserInputState == Enum.UserInputState.Begin then
            updateSliderPosition(input)
        end
    end
end)

slider:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
    updateSliderPosition({
        Position = Vector2.new(slider.AbsolutePosition.X, slider.AbsolutePosition.Y),
        UserInputType = Enum.UserInputType.MouseMovement
    })
end)

-- Connect the function to the button's MouseButton1Click event
button.MouseButton1Click:Connect(toggleWalkspeedScript)

-- Dragging functionality (unchanged)
local dragging
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    frame.Position = newPosition
    button.Position = UDim2.new(0, 5, 0, 5) -- Reset button position relative to the frame
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

button.InputBegan:Connect(function(input)
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

button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragging then
            updateDrag(input)
        end
    end
end)
