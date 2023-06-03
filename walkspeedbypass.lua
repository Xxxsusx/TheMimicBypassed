-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame as the background
local frame = Instance.new("Frame")
frame.Name = "ButtonFrame"
frame.Size = UDim2.new(0, 250, 0, 200) -- Updated size
frame.Position = UDim2.new(0, 20, 1, -220) -- Updated position
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
frame.Parent = screenGui

-- Create rounded corners for the frame
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10) -- Adjust the corner radius as needed
frameCorner.Parent = frame

-- Create the vertical tabs
local tabsContainer = Instance.new("Frame")
tabsContainer.Name = "TabsContainer"
tabsContainer.Size = UDim2.new(0, 50, 1, 0) -- Width of the tabs
tabsContainer.Position = UDim2.new(0, 0, 0, 0)
tabsContainer.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
tabsContainer.Parent = frame

-- Create the first tab (BOOK 2)
local bookTab = Instance.new("TextButton")
bookTab.Name = "BookTab"
bookTab.Size = UDim2.new(1, 0, 0.2, 0) -- Adjust the height of each tab
bookTab.Position = UDim2.new(0, 0, 0, 0)
bookTab.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
bookTab.TextColor3 = Color3.new(1, 1, 1) -- White text color
bookTab.Font = Enum.Font.GothamBold
bookTab.TextSize = 14 -- Adjust the font size
bookTab.Text = "BOOK 2"
bookTab.Parent = tabsContainer

-- Create the second tab (TOOLS)
local toolsTab = Instance.new("TextButton")
toolsTab.Name = "ToolsTab"
toolsTab.Size = UDim2.new(1, 0, 0.2, 0) -- Adjust the height of each tab
toolsTab.Position = UDim2.new(0, 0, 0.2, 0)
toolsTab.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
toolsTab.TextColor3 = Color3.new(1, 1, 1) -- White text color
toolsTab.Font = Enum.Font.GothamBold
toolsTab.TextSize = 14 -- Adjust the font size
toolsTab.Text = "TOOLS"
toolsTab.Parent = tabsContainer

-- Create the third tab (VISUAL)
local visualTab = Instance.new("TextButton")
visualTab.Name = "VisualTab"
visualTab.Size = UDim2.new(1, 0, 0.2, 0) -- Adjust the height of each tab
visualTab.Position = UDim2.new(0, 0, 0.4, 0)
visualTab.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
visualTab.TextColor3 = Color3.new(1, 1, 1) -- White text color
visualTab.Font = Enum.Font.GothamBold
visualTab.TextSize = 14 -- Adjust the font size
visualTab.Text = "VISUAL"
visualTab.Parent = tabsContainer

-- Create a container for the content area
local contentContainer = Instance.new("Frame")
contentContainer.Name = "ContentContainer"
contentContainer.Size = UDim2.new(0.8, -60, 1, 0) -- Adjust the size based on the number of tabs
contentContainer.Position = UDim2.new(0.2, 10, 0, 0) -- Leave space for the tabs
contentContainer.BackgroundColor3 = Color3.new(30/255, 30/255, 30/255) -- Cyan background
contentContainer.Parent = frame

-- Create rounded corners for the content container
local contentContainerCorner = Instance.new("UICorner")
contentContainerCorner.CornerRadius = UDim.new(0, 10) -- Adjust the corner radius as needed
contentContainerCorner.Parent = contentContainer

-- Create a TextBox for setting the speed
local textBox = Instance.new("TextBox")
textBox.Name = "SpeedTextBox"
textBox.Size = UDim2.new(0.7, 0, 0.1, 0) -- Adjust the size
textBox.Position = UDim2.new(0.15, 0, 0.4, 0) -- Adjust the position
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Cyan background
textBox.TextColor3 = Color3.new(0, 0, 0) -- Black text color
textBox.Font = Enum.Font.GothamBold -- Set font to GothamBold
textBox.TextSize = 14 -- Adjust the font size
textBox.PlaceholderText = "Set speed (13-200)"
textBox.Parent = contentContainer

-- Create rounded corners for the TextBox
local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 5) -- Adjust the corner radius as needed
textBoxCorner.Parent = textBox

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

local function checkButtonState()
    while true do
        if not toggleButton:IsDescendantOf(frame) or toggleButton.Position ~= UDim2.new(0, 5, 0, 5) then
            -- Recreate the GUI if the button is not in the correct parent or position
            frame:Destroy()
            frame = Instance.new("Frame")
            frame.Name = "ButtonFrame"
            frame.Size = UDim2.new(0, 200, 0, 80)
            frame.Position = UDim2.new(0, 20, 1, -100) -- Bottom left corner
            frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
            frame.Parent = screenGui

            toggleButton.Parent = frame
            textBox.Parent = frame
            minimizeButton.Parent = frame

            enableDragging(frame)
            toggleButton.MouseButton1Click:Connect(toggleWalkspeedScript)
            minimizeButton.MouseButton1Click:Connect(toggleMinimize)
        end
        wait(1)
    end
end

enableDragging(frame)
toggleButton.MouseButton1Click:Connect(toggleWalkspeedScript)
minimizeButton.MouseButton1Click:Connect(toggleMinimize)

-- Start the checkButtonState coroutine
coroutine.wrap(checkButtonState)()

