-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame as the background
local frame = Instance.new("Frame")
frame.Name = "ButtonFrame"
frame.Size = UDim2.new(0, 200, 0, 80) -- Updated size
frame.Position = UDim2.new(0, 20, 1, -100) -- Updated position
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
frame.Parent = screenGui

-- Create rounded corners for the frame
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10) -- Adjust the corner radius as needed
frameCorner.Parent = frame

-- Create the toggle button (ENABLE/DISABLE)
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0.4, 0, 0.3, 0) -- Adjust the size
toggleButton.Position = UDim2.new(0.05, 0, 0.3, 0) -- Adjust the position
toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
toggleButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14 -- Adjust the font size
toggleButton.Text = "ENABLE"
toggleButton.Parent = frame

-- Create the minimize button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) -- Adjust the size
minimizeButton.Position = UDim2.new(0.85, 0, 0.05, 0) -- Adjust the position
minimizeButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
minimizeButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 14 -- Adjust the font size
minimizeButton.Text = "-"
minimizeButton.Parent = frame

-- Create the close button (for PC users only)
local closeButtonText = "CLOSE"
local closeButtonVisible = not game:GetService("UserInputService").TouchEnabled -- Only visible for non-touch devices
if closeButtonVisible then
    closeButtonText = "X"
end

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0) -- Adjust the size
closeButton.Position = UDim2.new(0.95, 0, 0.05, 0) -- Adjust the position
closeButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
closeButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14 -- Adjust the font size
closeButton.Text = closeButtonText
closeButton.Visible = closeButtonVisible
closeButton.Parent = frame

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
textBox.Visible = true -- Show the textBox by default
textBox.Parent = frame

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

-- Function to close the interface (for PC users only)
local function closeInterface()
    if closeButtonVisible then
        -- Show a pop-up message
        local popup = Instance.new("ScreenGui")
        popup.Name = "ClosePopup"
        popup.Parent = game.Players.LocalPlayer.PlayerGui

        local popupFrame = Instance.new("Frame")
        popupFrame.Name = "PopupFrame"
        popupFrame.Size = UDim2.new(0.3, 0, 0.2, 0)
        popupFrame.Position = UDim2.new(0.5, -popupFrame.Size.X.Offset / 2, 0.5, -popupFrame.Size.Y.Offset / 2)
        popupFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
        popupFrame.Parent = popup

        local popupText = Instance.new("TextLabel")
        popupText.Name = "PopupText"
        popupText.Size = UDim2.new(0.9, 0, 0.7, 0)
        popupText.Position = UDim2.new(0.05, 0, 0.15, 0)
        popupText.BackgroundTransparency = 1 -- Transparent background
        popupText.TextColor3 = Color3.new(1, 1, 1) -- White text color
        popupText.Font = Enum.Font.GothamBold
        popupText.TextSize = 14 -- Adjust the font size
        popupText.Text = "Interface Closed\n\nPress the right shift key to open it again"
        popupText.Parent = popupFrame

        -- Fade in animation
        for i = 0, 1, 0.1 do
            popupFrame.BackgroundTransparency = i
            popupText.TextTransparency = i
            wait(0.1)
        end

        wait(3) -- Display the message for 3 seconds

        -- Fade out animation
        for i = 1, 0, -0.1 do
            popupFrame.BackgroundTransparency = i
            popupText.TextTransparency = i
            wait(0.1)
        end

        popup:Destroy() -- Remove the popup from the GUI
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
            closeButton.Parent = frame

            enableDragging(frame)
            toggleButton.MouseButton1Click:Connect(toggleWalkspeedScript)
            minimizeButton.MouseButton1Click:Connect(toggleMinimize)
            closeButton.MouseButton1Click:Connect(closeInterface)
        end
        wait(1) -- Check the button state every second
    end
end

-- Enable dragging of the frame
enableDragging(frame)

-- Connect the button events
toggleButton.MouseButton1Click:Connect(toggleWalkspeedScript)
minimizeButton.MouseButton1Click:Connect(toggleMinimize)
closeButton.MouseButton1Click:Connect(closeInterface)

-- Start checking the button state
spawn(checkButtonState)
