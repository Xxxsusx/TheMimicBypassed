-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame as the background
local frame = Instance.new("Frame")
frame.Name = "ButtonFrame"
frame.Size = UDim2.new(0, 100, 0, 50)
frame.Position = UDim2.new(0.5, -50, 0.5, -25)
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
frame.Parent = screenGui

-- Create a TextButton inside the frame
local button = Instance.new("TextButton")
button.Name = "ToggleButton"
button.Size = UDim2.new(1, -10, 1, -10) -- Smaller size with padding
button.Position = UDim2.new(0, 5, 0, 5) -- Padding
button.BackgroundTransparency = 1 -- Transparent background
button.TextColor3 = Color3.new(1, 1, 1) -- White text color
button.Font = Enum.Font.GothamBold -- Set font to GothamBold
button.TextSize = 18 -- Adjust the font size
button.Text = "ENABLE"
button.Parent = frame

-- Walkspeed configuration
local DEFAULT_SPEED = 13 -- Default walkspeed value
local STORED_SPEED = 81 -- Stored walkspeed value
local walkspeedEnabled = false -- Variable to track the state of walkspeed script

-- Function to set the walkspeed
local function setWalkspeed(player)
    if player.Character then
        player.Character.Humanoid.WalkSpeed = walkspeedEnabled and STORED_SPEED or DEFAULT_SPEED
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
                setWalkspeed(player)
            end
            wait(0.03) -- Loop interval of 0.03 seconds
        end
    else
        -- Disable the script
        for _, player in ipairs(game.Players:GetPlayers()) do
            player.Character.Humanoid.WalkSpeed = DEFAULT_SPEED -- Set to default walkspeed
        end
    end
end

-- Connect the function to the button's MouseButton1Click event
button.MouseButton1Click:Connect(toggleWalkspeedScript)

-- Dragging functionality
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
