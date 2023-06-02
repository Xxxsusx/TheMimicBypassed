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
textBox.Position = UDim2.new(0.5, 5, 0, 35) -- Below the toggle button
textBox.BackgroundColor3 = Color3.new(1, 1, 1) -- White background
textBox.TextColor3 = Color3.new(0, 0, 0) -- Black text color
textBox.Font = Enum.Font.GothamBold -- Set font to GothamBold
textBox.TextSize = 14 -- Adjust the font size
textBox.PlaceholderText = "Set speed (13-200)"
textBox.Parent = frame

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
minimizeButton.Parent = frame

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
    if frame.Size == UDim2.new(0, 200, 0, 80) then
        frame.Size = UDim2.new(0, 100, 0, 40)
        minimizeButton.Text = "+"
        minimizeButton.Position = UDim2.new(1, -25, 1, -25) -- Bottom right corner
    else
        frame.Size = UDim2.new(0, 200, 0, 80)
        minimizeButton.Text = "-"
        minimizeButton.Position = UDim2.new(1, -25, 0, 15) -- Top right corner
    end
end

-- Connect the function to the toggle button's MouseButton1Click event
toggleButton.MouseButton1Click:Connect(toggleWalkspeedScript)

-- Connect the function to the minimize button's MouseButton1Click event
minimizeButton.MouseButton1Click:Connect(toggleMinimize)
