-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local FirstButtonFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local SecondButtonFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local toggleButton = Instance.new("TextButton")
local textBox = Instance.new("TextBox")
local minimizeButton = Instance.new("TextButton")

-- Properties:

ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

FirstButtonFrame.Name = "FirstButtonFrame"
FirstButtonFrame.Parent = ScreenGui
FirstButtonFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FirstButtonFrame.Position = UDim2.new(0.322062045, 0, 0.33561644, 0)
FirstButtonFrame.Size = UDim2.new(0.348247588, 0, 0.273972601, 0)
FirstButtonFrame.Active = true
FirstButtonFrame.Draggable = true

UICorner.Parent = FirstButtonFrame

SecondButtonFrame.Name = "SecondButtonFrame"
SecondButtonFrame.Parent = FirstButtonFrame
SecondButtonFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SecondButtonFrame.Position = UDim2.new(0.0192719493, 0, 0.0500000007, 0)
SecondButtonFrame.Size = UDim2.new(0.963597417, 0, 0.904999971, 0)

UICorner_2.Parent = SecondButtonFrame

toggleButton.Name = "ToggleButton"
toggleButton.Parent = SecondButtonFrame
toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
toggleButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
toggleButton.Font = Enum.Font.GothamBold -- Set font to GothamBold
toggleButton.TextSize = 18 -- Adjust the font size
toggleButton.Size = UDim2.new(0.5, -10, 1, -10) -- Smaller size with padding
toggleButton.Position = UDim2.new(0, 5, 0, 5) -- Padding
toggleButton.Text = "ENABLE"

textBox.Name = "SpeedTextBox"
textBox.Parent = SecondButtonFrame
textBox.BackgroundColor3 = Color3.new(1, 1, 1) -- White background
textBox.TextColor3 = Color3.new(0, 0, 0) -- Black text color
textBox.Font = Enum.Font.GothamBold -- Set font to GothamBold
textBox.TextSize = 14 -- Adjust the font size
textBox.Size = UDim2.new(0, 150, 0, 25)
textBox.Position = UDim2.new(0.5, 5, 0, 35) -- Below the toggle button
textBox.PlaceholderText = "Set speed (13-200)"

minimizeButton.Name = "MinimizeButton"
minimizeButton.Parent = SecondButtonFrame
minimizeButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
minimizeButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
minimizeButton.Font = Enum.Font.GothamBold -- Set font to GothamBold
minimizeButton.TextSize = 18 -- Adjust the font size
minimizeButton.Size = UDim2.new(0, 30, 0, 30) -- Square size
minimizeButton.Position = UDim2.new(1, -35, 0, 5) -- Top right corner
minimizeButton.Text = "-"

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
    if SecondButtonFrame.Size == UDim2.new(0.963597417, 0, 0.904999971, 0) then
        SecondButtonFrame.Size = UDim2.new(0.963597417, 0, 0, 40)
        minimizeButton.Text = "+"
        minimizeButton.Position = UDim2.new(1, -35, 1, -35) -- Bottom right corner
    else
        SecondButtonFrame.Size = UDim2.new(0.963597417, 0, 0.904999971, 0)
        minimizeButton.Text = "-"
        minimizeButton.Position = UDim2.new(1, -35, 0, 5) -- Top right corner
    end
end

-- Connect the function to the toggle button's MouseButton1Click event
toggleButton.MouseButton1Click:Connect(toggleWalkspeedScript)

-- Connect the function to the minimize button's MouseButton1Click event
minimizeButton.MouseButton1Click:Connect(toggleMinimize)
