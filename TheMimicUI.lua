-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WalkspeedGUI" -- Give a unique name to the ScreenGui
screenGui.Parent = game:GetService("CoreGui") -- Parent under CoreGui instead of PlayerGui

-- TopFrame


-- Create a TopFrame for the top of the ScreenGui
local TopperFrame = Instance.new("Frame")
TopperFrame.Name = "TopFrame"
TopperFrame.Size = UDim2.new(0.411565125, 0, 0.0671853721, 0)
TopperFrame.Position = UDim2.new(0.311559141, 0, 0.31534484, 0)
TopperFrame.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
TopperFrame.BackgroundTransparency = 0.300
TopperFrame.ZIndex = 2
TopperFrame.Active = true
TopperFrame.Parent = screenGui

-- Create a UICorner as the child of the TopFrame
local TopUiCorner = Instance.new("UICorner")
TopUiCorner.CornerRadius = UDim.new(0.100000001, 0)
TopUiCorner.Parent = TopperFrame

-- Create a UIGradient as the child of the TopFrame
local TopUiGradient = Instance.new("UIGradient")
TopUiGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(58, 58, 58))}
TopUiGradient.Parent = TopperFrame

-- Create a UIPadding as the child of the TopFrame
local TopUiPadding = Instance.new("UIPadding")
TopUiPadding.PaddingLeft = UDim.new(0.200000003, 0)
TopUiPadding.PaddingRight = UDim.new(0.0500000007, 0)
TopUiPadding.Parent = TopperFrame

-- Create a UIStroke as the child of the TopFrame
local TopUiStroke = Instance.new("UIStroke")
TopUiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
TopUiStroke.Thickness = 3
TopUiStroke.Color = Color3.fromRGB(115, 0, 0) 
TopUiStroke.Parent = TopperFrame

-- Create a UIGradient as the child of the UIStroke inside TopFrame
local uiStrokeGradient1 = Instance.new("UIGradient")
uiStrokeGradient1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(115, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
uiStrokeGradient1.Parent = TopUiStroke

-- Create a CloseButton as the child of the TopFrame
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0.125078097, 0, 0.927024722, 0)
closeButton.Position = UDim2.new(0.918252349, 0, -0.0200182255, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
closeButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
closeButton.BorderSizePixel = 1 -- Border width
closeButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text color
closeButton.Font = Enum.Font.GothamBold
closeButton.TextScaled = true
closeButton.TextSize = 14
closeButton.Text = "X"
closeButton.Parent = TopperFrame -- Set the parent of the button

-- Create a UICorner as the child of the CloseButton
local closeButtonUICorner = Instance.new("UICorner")
closeButtonUICorner.CornerRadius = UDim.new(0.100000001, 0)
closeButtonUICorner.Parent = closeButton

-- Create a UIGradient as the child of the CloseButton
local closeUiGradient = Instance.new("UIGradient")
closeUiGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(58, 58, 58))}
closeUiGradient.Parent = closeButton

-- Create a UIPadding as the child of the CloseButton
local closeUiPadding = Instance.new("UIPadding")
closeUiPadding.PaddingLeft = UDim.new(0.200000003, 0)
closeUiPadding.PaddingRight = UDim.new(0.0500000007, 0)
closeUiPadding.Parent = closeButton

-- Create a UIStroke as the child of the CloseButton
local closeUiStroke = Instance.new("UIStroke")
closeUiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
closeUiStroke.Thickness = 3
closeUiStroke.Color = Color3.fromRGB(115, 0, 0)
closeUiStroke.Parent = closeButton

-- Create a UIGradient as the child of the CloseButton inside TopFrame
local uiStrokeGradient2 = Instance.new("UIGradient")
uiStrokeGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(115, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
uiStrokeGradient2.Parent = closeUiStroke

-- Create a Minimize Button as the child of the TopFrame
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0.137166411, 0, 0.927024603, 0)
minimizeButton.Position = UDim2.new(0.769358814, 0, -0.0168436226, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
minimizeButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
minimizeButton.BorderSizePixel = 1 -- Border width
minimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text color
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextScaled = true
minimizeButton.TextSize = 14
minimizeButton.Text = "-"
minimizeButton.Parent = TopperFrame -- Set the parent of the button

-- Create a UICorner as the child of the MinimizeButton
local minimizeButtonUICorner = Instance.new("UICorner")
minimizeButtonUICorner.CornerRadius = UDim.new(0.100000001, 0)
minimizeButtonUICorner.Parent = minimizeButton

-- Create a UIGradient as the child of the MinimizeButton
local minimizeUiGradient = Instance.new("UIGradient")
minimizeUiGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(58, 58, 58))}
minimizeUiGradient.Parent = minimizeButton

-- Create a UIPadding as the child of the MinimizeButton
local minimizeUiPadding = Instance.new("UIPadding")
minimizeUiPadding.PaddingLeft = UDim.new(0.200000003, 0)
minimizeUiPadding.PaddingRight = UDim.new(0.0500000007, 0)
minimizeUiPadding.Parent = minimizeButton

-- Create a UIStroke as the child of the MinimizeButton
local minimizeUiStroke = Instance.new("UIStroke")
minimizeUiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
minimizeUiStroke.Thickness = 3
minimizeUiStroke.Color = Color3.fromRGB(115, 0, 0)
minimizeUiStroke.Parent = minimizeButton

-- Create a UIGradient as the child of the MinimizeButton inside TopFrame
local uiStrokeGradient3 = Instance.new("UIGradient")
uiStrokeGradient3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(115, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
uiStrokeGradient3.Parent = minimizeUiStroke

-- Create a TextLabel as the child of the TopFrame
local topTextLabel = Instance.new("TextLabel")
topTextLabel.Name = "UIName"
topTextLabel.Size = UDim2.new(0.496373653, 0, 0.921402335, 0)
topTextLabel.Position = UDim2.new(-0.268933326, 0, 0, 0)
topTextLabel.BackgroundTransparency = 1
topTextLabel.Text = "The Mimic UI"
topTextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
topTextLabel.Font = Enum.Font.GothamBold
topTextLabel.TextSize = 24
topTextLabel.TextWrapped = true
topTextLabel.Parent = TopperFrame

-- ButtonFrame



-- Create a Frame as the background
local buttonFrame = Instance.new("Frame")
buttonFrame.Name = "ButtonFrame"
buttonFrame.Size = UDim2.new(1.33627844, 0, 5.61083031, 0)
buttonFrame.Position = UDim2.new(-0.271808118, 0, -0.0440851375, 0)
buttonFrame.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
buttonFrame.BackgroundTransparency = 0.300
buttonFrame.ZIndex = 0
buttonFrame.Active = true
buttonFrame.Parent = TopperFrame

-- Create a UICorner as the child of the ButtonFrame
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.100000001, 0)
uiCorner.Parent = buttonFrame

-- Create a UIGradient as the child of the ButtonFrame
local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(58, 58, 58))}
uiGradient.Parent = buttonFrame

-- Create a UIPadding as the child of the ButtonFrame
local uiPadding = Instance.new("UIPadding")
uiPadding.PaddingLeft = UDim.new(0.200000003, 0)
uiPadding.PaddingRight = UDim.new(0.0500000007, 0)
uiPadding.Parent = buttonFrame

-- Create a UIStroke as the child of the ButtonFrame
local uiStroke = Instance.new("UIStroke")
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Thickness = 3
uiStroke.Color = Color3.fromRGB(115, 0, 0)
uiStroke.Parent = buttonFrame

-- Create a UIGradient as the child of the UIStroke inside ButtonFrame
local uiStrokeGradient4 = Instance.new("UIGradient")
uiStrokeGradient4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(115, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(34, 34, 34))}
uiStrokeGradient4.Parent = uiStroke


-- Create a TextButton inside the frame for enable/disable
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0.266863972, 0, 0.305229217, 0) -- Smaller size with padding
toggleButton.Position = UDim2.new(-0.0175504088, 0, 0.581080973, 0) -- Padding
toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
toggleButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
toggleButton.Font = Enum.Font.GothamBold -- Set font to GothamBold
toggleButton.TextSize = 18 -- Adjust the font size
toggleButton.Text = "ENABLE"
toggleButton.Parent = buttonFrame

-- Create a TextBox for setting the speed
local textBox = Instance.new("TextBox")
textBox.Name = "SpeedTextBox"
textBox.Size = UDim2.new(0.386318177, 0, 0.105268292, 0)
textBox.Position = UDim2.new(0.322033197, 0, 0.778985381, 0) -- Adjusted position
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Cyan background
textBox.TextColor3 = Color3.new(0, 0, 0) -- Black text color
textBox.Font = Enum.Font.GothamBold -- Set font to GothamBold
textBox.TextSize = 14 -- Adjust the font size
textBox.PlaceholderText = "Set speed (13-500)"
textBox.Parent = buttonFrame


-- Walkspeed configuration
local MIN_SPEED = 13 -- Minimum walkspeed value
local MAX_SPEED = 500 -- Maximum walkspeed value
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
            toggleButton.Text = "DISABLE"
            toggleButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background

            while walkspeedEnabled do
                setWalkspeed(game.Players.LocalPlayer, speed)
            end
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
        minimizeButton.Text = "+"
        buttonFrame.Visible = false -- Hide the buttonFrame when frame is minimized
    else
        minimizeButton.Text = "-"
        buttonFrame.Visible = true -- Show the buttonFrame when frame is restored
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
        if not toggleButton:IsDescendantOf(frame) or not frame:IsDescendantOf(screenGui) then
            -- Recreate the GUI if the button or frame is not in the correct parent
            frame:Destroy()
            frame = Instance.new("Frame")
            frame.Name = "ButtonFrame"
            frame.Size = UDim2.new(0, 200, 0, 80)
            frame.Position = UDim2.new(0, 20, 1, -100) -- Bottom left corner
            frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
            frame.Active = true -- Allow user input
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
