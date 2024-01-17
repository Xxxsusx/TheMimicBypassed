local TheMimicUI = Instance.new("ScreenGui")
local ButtonFrame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local ToggleClosebutton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local UIGradient = Instance.new("UIGradient")
local Title = Instance.new("TextLabel")
local ToggleButtons = Instance.new("Folder")
local FOVToggleButton = Instance.new("TextButton")
local XRayToggleButton = Instance.new("TextButton")
local ESPToggleButton = Instance.new("TextButton")
local Unsupported = Instance.new("BoolValue")
local ConfirmationValue = Instance.new("BoolValue")
local ProximityToggleButton = Instance.new("TextButton")
local SpeedToggleButton = Instance.new("TextButton")
local NoclipToggleButton = Instance.new("TextButton")
local LabelTexts = Instance.new("Folder")
local FOVLabel = Instance.new("TextLabel")
local ESPLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local XRayLabel = Instance.new("TextLabel")
local ProximityLabel = Instance.new("TextLabel")
local SpeedhackLabel = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local TextBoxes = Instance.new("Folder")
local FOVTextBox = Instance.new("TextBox")
local SpeedTextBox = Instance.new("TextBox")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local WarningFrame = Instance.new("Frame")
local UIGradient_2 = Instance.new("UIGradient")
local YES = Instance.new("TextButton")
local WarningLabel = Instance.new("TextLabel")
local NO = Instance.new("TextButton")
local UnsupportedFrame = Instance.new("Frame")
local UIGradient3 = Instance.new("UIGradient")
local OK = Instance.new("TextButton")
local ErrorCodeLabel = Instance.new("TextLabel")
local LogsLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")
local SolutionLabel = Instance.new("TextLabel")

TheMimicUI.Name = "TheMimicUI"
TheMimicUI.Parent = game.Players.LocalPlayer.PlayerGui
TheMimicUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ButtonFrame.Name = "ButtonFrame"
ButtonFrame.Parent = TheMimicUI
ButtonFrame.Active = true
ButtonFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
ButtonFrame.BackgroundTransparency = 0.250
ButtonFrame.Position = UDim2.new(0.214367136, 0, 0.114239849, 0)
ButtonFrame.Size = UDim2.new(0.570125401, 0, 0.770712912, 0)

UIStroke.Name = "UIStroke"
UIStroke.Parent = ButtonFrame
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(35, 35, 35)
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Transparency = 0
UIStroke.Enabled = true

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = ButtonFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.Position = UDim2.new(0.949999988, 0, 0.0125000011, 0)
MinimizeButton.Size = UDim2.new(0.0400000028, 0, 0.0500000045, 0)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "X"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14.000

ToggleClosebutton.Name = "ToggleButton"
ToggleClosebutton.Size = UDim2.new(0, 100,0, 70) -- Smaller size with padding
ToggleClosebutton.Position = UDim2.new(0, 5, 0, 5) -- Padding
ToggleClosebutton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
ToggleClosebutton.TextColor3 = Color3.new(1, 1, 1) -- White text color
ToggleClosebutton.Font = Enum.Font.GothamBold -- Set font to GothamBold
ToggleClosebutton.TextSize = 18 -- Adjust the font size
ToggleClosebutton.Text = "REOPEN GUI"
ToggleClosebutton.Visible = false
ToggleClosebutton.Parent = TheMimicUI

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(65, 65, 65))}
UIGradient.Parent = ButtonFrame

Title.Name = "Title"
Title.Parent = ButtonFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.289999992, 0, 0.0125000002, 0)
Title.Size = UDim2.new(0.422000021, 0, 0.107500009, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "The Mimic UI"
Title.TextColor3 = Color3.fromRGB(249, 249, 249)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

ToggleButtons.Name = "ToggleButtons"
ToggleButtons.Parent = ButtonFrame

FOVToggleButton.Name = "FOVToggleButton"
FOVToggleButton.Parent = ToggleButtons
FOVToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
FOVToggleButton.Position = UDim2.new(0.398000002, 9, 0.157499999, 90)
FOVToggleButton.Size = UDim2.new(0.160000011, 0, 0.100000009, 0)
FOVToggleButton.Font = Enum.Font.GothamBold
FOVToggleButton.Text = "ENABLE"
FOVToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FOVToggleButton.TextSize = 18.000

XRayToggleButton.Name = "XRayToggleButton"
XRayToggleButton.Parent = ToggleButtons
XRayToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
XRayToggleButton.Position = UDim2.new(0.666000009, 9, 0.402500004, 90)
XRayToggleButton.Size = UDim2.new(0.160000011, 0, 0.100000009, 0)
XRayToggleButton.Font = Enum.Font.GothamBold
XRayToggleButton.Text = "ENABLE"
XRayToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
XRayToggleButton.TextSize = 18.000

ESPToggleButton.Name = "ESPToggleButton"
ESPToggleButton.Parent = ToggleButtons
ESPToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ESPToggleButton.Position = UDim2.new(0.398000002, 9, 0.402500004, 90)
ESPToggleButton.Size = UDim2.new(0.160000011, 0, 0.100000009, 0)
ESPToggleButton.Font = Enum.Font.GothamBold
ESPToggleButton.Text = "ON/OFF"
ESPToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPToggleButton.TextSize = 18.000

Unsupported.Name = "Unsupported"
Unsupported.Parent = ESPToggleButton


ProximityToggleButton.Name = "ProximityToggleButton"
ProximityToggleButton.Parent = ToggleButtons
ProximityToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ProximityToggleButton.Position = UDim2.new(0.666000009, 9, 0.157499999, 90)
ProximityToggleButton.Size = UDim2.new(0.160000011, 0, 0.100000009, 0)
ProximityToggleButton.Font = Enum.Font.GothamBold
ProximityToggleButton.Text = "TURN ON"
ProximityToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ProximityToggleButton.TextSize = 18.000

ConfirmationValue.Name = "ConfirmationValue"
ConfirmationValue.Parent = ProximityToggleButton

SpeedToggleButton.Name = "SpeedToggleButton"
SpeedToggleButton.Parent = ToggleButtons
SpeedToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
SpeedToggleButton.Position = UDim2.new(0.119999997, 9, 0.157499999, 90)
SpeedToggleButton.Size = UDim2.new(0.160000011, 0, 0.100000009, 0)
SpeedToggleButton.Font = Enum.Font.GothamBold
SpeedToggleButton.Text = "ENABLE"
SpeedToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedToggleButton.TextSize = 18.000

NoclipToggleButton.Name = "NoclipToggleButton"
NoclipToggleButton.Parent = ToggleButtons
NoclipToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
NoclipToggleButton.Position = UDim2.new(0.119999997, 9, 0.402500004, 90)
NoclipToggleButton.Size = UDim2.new(0.160000011, 0, 0.100000009, 0)
NoclipToggleButton.Font = Enum.Font.GothamBold
NoclipToggleButton.Text = "ENABLE"
NoclipToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipToggleButton.TextSize = 18.000

LabelTexts.Name = "LabelTexts"
LabelTexts.Parent = ButtonFrame

FOVLabel.Name = "FOVLabel"
FOVLabel.Parent = LabelTexts
FOVLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FOVLabel.BackgroundTransparency = 1.000
FOVLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
FOVLabel.BorderSizePixel = 0
FOVLabel.Position = UDim2.new(0.39199999, 0, 0.204999998, 0)
FOVLabel.Size = UDim2.new(0.206000015, 0, 0.0950000063, 0)
FOVLabel.Font = Enum.Font.Gotham
FOVLabel.Text = "Field Of View (BETA)"
FOVLabel.TextColor3 = Color3.fromRGB(249, 249, 249)
FOVLabel.TextScaled = true
FOVLabel.TextSize = 14.000
FOVLabel.TextWrapped = true

ESPLabel.Name = "ESPLabel"
ESPLabel.Parent = LabelTexts
ESPLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESPLabel.BackgroundTransparency = 1.000
ESPLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ESPLabel.BorderSizePixel = 0
ESPLabel.Position = UDim2.new(0.39199999, 0, 0.514999986, 0)
ESPLabel.Size = UDim2.new(0.206000015, 0, 0.0950000063, 0)
ESPLabel.Font = Enum.Font.Gotham
ESPLabel.Text = "ESP (BETA)"
ESPLabel.TextColor3 = Color3.fromRGB(249, 249, 249)
ESPLabel.TextScaled = true
ESPLabel.TextSize = 14.000
ESPLabel.TextWrapped = true

UITextSizeConstraint.Parent = ESPLabel
UITextSizeConstraint.MaxTextSize = 38

XRayLabel.Name = "XRayLabel"
XRayLabel.Parent = LabelTexts
XRayLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
XRayLabel.BackgroundTransparency = 1.000
XRayLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
XRayLabel.BorderSizePixel = 0
XRayLabel.Position = UDim2.new(0.660000026, 0, 0.514999986, 0)
XRayLabel.Size = UDim2.new(0.206000015, 0, 0.0950000063, 0)
XRayLabel.Font = Enum.Font.Gotham
XRayLabel.Text = "XRay (BETA)"
XRayLabel.TextColor3 = Color3.fromRGB(249, 249, 249)
XRayLabel.TextScaled = true
XRayLabel.TextSize = 14.000
XRayLabel.TextWrapped = true

ProximityLabel.Name = "ProximityLabel"
ProximityLabel.Parent = LabelTexts
ProximityLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProximityLabel.BackgroundTransparency = 1.000
ProximityLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ProximityLabel.BorderSizePixel = 0
ProximityLabel.Position = UDim2.new(0.639999986, 0, 0.189999998, 0)
ProximityLabel.Size = UDim2.new(0.246000022, 0, 0.172500014, 0)
ProximityLabel.Font = Enum.Font.Gotham
ProximityLabel.Text = "Instant Proximity Prompt (BETA)"
ProximityLabel.TextColor3 = Color3.fromRGB(249, 249, 249)
ProximityLabel.TextScaled = true
ProximityLabel.TextSize = 14.000
ProximityLabel.TextWrapped = true

SpeedhackLabel.Name = "SpeedhackLabel"
SpeedhackLabel.Parent = LabelTexts
SpeedhackLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedhackLabel.BackgroundTransparency = 1.000
SpeedhackLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpeedhackLabel.BorderSizePixel = 0
SpeedhackLabel.Position = UDim2.new(0.114000037, 0, 0.204999983, 0)
SpeedhackLabel.Size = UDim2.new(0.206000015, 0, 0.0950000063, 0)
SpeedhackLabel.Font = Enum.Font.Gotham
SpeedhackLabel.Text = "Bypass Speedhack"
SpeedhackLabel.TextColor3 = Color3.fromRGB(249, 249, 249)
SpeedhackLabel.TextScaled = true
SpeedhackLabel.TextSize = 14.000
SpeedhackLabel.TextWrapped = true

TextLabel.Parent = LabelTexts
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.132000044, 0, 0.519999981, 0)
TextLabel.Size = UDim2.new(0.172000006, 0, 0.0900000036, 0)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Noclip (BETA)"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextBoxes.Name = "TextBoxes"
TextBoxes.Parent = ButtonFrame

FOVTextBox.Name = "FOVTextBox"
FOVTextBox.Parent = TextBoxes
FOVTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FOVTextBox.Position = UDim2.new(0.40200001, 5, 0.1875, 45)
FOVTextBox.Size = UDim2.new(0.168000013, 0, 0.0625000075, 0)
FOVTextBox.Font = Enum.Font.GothamBold
FOVTextBox.PlaceholderText = "Set FOV (70-120)"
FOVTextBox.Text = ""
FOVTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
FOVTextBox.TextSize = 14.000

SpeedTextBox.Name = "SpeedTextBox"
SpeedTextBox.Parent = TextBoxes
SpeedTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpeedTextBox.Position = UDim2.new(0.124000035, 5, 0.18749997, 45)
SpeedTextBox.Size = UDim2.new(0.168000013, 0, 0.0625000075, 0)
SpeedTextBox.Font = Enum.Font.GothamBold
SpeedTextBox.PlaceholderText = "Set speed (13-500)"
SpeedTextBox.Text = ""
SpeedTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
SpeedTextBox.TextSize = 14.000

UIAspectRatioConstraint.Parent = ButtonFrame
UIAspectRatioConstraint.AspectRatio = 1.250

WarningFrame.Name = "WarningFrame"
WarningFrame.Parent = TheMimicUI
WarningFrame.Active = true
WarningFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WarningFrame.Position = UDim2.new(0.304446965, 0, 0.291100174, 0)
WarningFrame.Size = UDim2.new(0.389965802, 0, 0.414258182, 0)
WarningFrame.Visible = false

UnsupportedFrame.Name = "UnsupportedFrame"
UnsupportedFrame.Parent = TheMimicUI
UnsupportedFrame.Active = true
UnsupportedFrame.Visible = false
UnsupportedFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UnsupportedFrame.Position = UDim2.new(0.304446965, 0, 0.291100174, 0)
UnsupportedFrame.Size = UDim2.new(0.389965802, 0, 0.414258182, 0)

UIGradient3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(65, 65, 65))}
UIGradient3.Enabled = true
UIGradient3.Parent = UnsupportedFrame

OK.Name = "OK"
OK.Parent = UnsupportedFrame
OK.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
OK.Position = UDim2.new(0.379054338, 0, 0.734930992, 0)
OK.Size = UDim2.new(0.23391813, 0, 0.186046511, 0)
OK.Font = Enum.Font.GothamBold
OK.Text = "OK"
OK.TextColor3 = Color3.fromRGB(255, 255, 255)
OK.TextSize = 18.000

ErrorCodeLabel.Name = "ErrorCodeLabel"
ErrorCodeLabel.Parent = UnsupportedFrame
ErrorCodeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ErrorCodeLabel.BackgroundTransparency = 1.000
ErrorCodeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ErrorCodeLabel.BorderSizePixel = 0
ErrorCodeLabel.Position = UDim2.new(0.133547634, 0, 0.0841112733, 0)
ErrorCodeLabel.Size = UDim2.new(0.722222269, 0, 0.200249866, 0)
ErrorCodeLabel.Font = Enum.Font.Gotham
ErrorCodeLabel.Text = "ERROR CODE: UNSUPPORTED"
ErrorCodeLabel.TextColor3 = Color3.fromRGB(249, 0, 0)
ErrorCodeLabel.TextScaled = true
ErrorCodeLabel.TextSize = 14.000
ErrorCodeLabel.TextWrapped = true

LogsLabel.Name = "LogsLabel"
LogsLabel.Parent = UnsupportedFrame
LogsLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LogsLabel.BackgroundTransparency = 1.000
LogsLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
LogsLabel.BorderSizePixel = 0
LogsLabel.Position = UDim2.new(0.133547634, 0, 0.284111261, 0)
LogsLabel.Size = UDim2.new(0.722222269, 0, 0.200249866, 0)
LogsLabel.Font = Enum.Font.Gotham
LogsLabel.Text = "Logs: Drawing is not supported. Tracer script will not run"
LogsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogsLabel.TextScaled = true
LogsLabel.TextSize = 14.000
LogsLabel.TextWrapped = true

StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = UnsupportedFrame
StatusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.BackgroundTransparency = 1.000
StatusLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
StatusLabel.BorderSizePixel = 0
StatusLabel.Position = UDim2.new(0.136474952, 0, 0.469649345, 0)
StatusLabel.Size = UDim2.new(0.722222269, 0, 0.0984327123, 0)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Status: Normal"
StatusLabel.TextColor3 = Color3.fromRGB(237, 249, 0)
StatusLabel.TextScaled = true
StatusLabel.TextSize = 14.000
StatusLabel.TextWrapped = true

SolutionLabel.Name = "SolutionLabel"
SolutionLabel.Parent = UnsupportedFrame
SolutionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SolutionLabel.BackgroundTransparency = 1.000
SolutionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
SolutionLabel.BorderSizePixel = 0
SolutionLabel.Position = UDim2.new(0.136474952, 0, 0.567323744, 0)
SolutionLabel.Size = UDim2.new(0.722222269, 0, 0.0984327123, 0)
SolutionLabel.Font = Enum.Font.Gotham
SolutionLabel.Text = "Solution: Try using another executor."
SolutionLabel.TextColor3 = Color3.fromRGB(4, 249, 0)
SolutionLabel.TextScaled = true
SolutionLabel.TextSize = 14.000
SolutionLabel.TextWrapped = true

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(34, 34, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(65, 65, 65))}
UIGradient_2.Parent = WarningFrame

YES.Name = "YES"
YES.Parent = WarningFrame
YES.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
YES.Position = UDim2.new(0.250252604, 0, 0.716326356, 0)
YES.Size = UDim2.new(0.23391813, 0, 0.186046511, 0)
YES.Font = Enum.Font.GothamBold
YES.Text = "YES!"
YES.TextColor3 = Color3.fromRGB(255, 255, 255)
YES.TextSize = 18.000

WarningLabel.Name = "WarningLabel"
WarningLabel.Parent = WarningFrame
WarningLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WarningLabel.BackgroundTransparency = 1.000
WarningLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
WarningLabel.BorderSizePixel = 0
WarningLabel.Position = UDim2.new(0.136474967, 0, 0.11201825, 0)
WarningLabel.Size = UDim2.new(0.722222209, 0, 0.548837185, 0)
WarningLabel.Font = Enum.Font.Gotham
WarningLabel.Text = "Are you SURE you want to enable this feature? When you enable it you won't be able turn this feature off because it is an BETA feature."
WarningLabel.TextColor3 = Color3.fromRGB(249, 249, 249)
WarningLabel.TextScaled = true
WarningLabel.TextSize = 14.000
WarningLabel.TextWrapped = true

NO.Name = "NO"
NO.Parent = WarningFrame
NO.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
NO.Position = UDim2.new(0.52510643, 0, 0.716326356, 0)
NO.Size = UDim2.new(0.23391813, 0, 0.186046511, 0)
NO.Font = Enum.Font.GothamBold
NO.Text = "NO!"
NO.TextColor3 = Color3.fromRGB(255, 255, 255)
NO.TextSize = 18.000

local framepressed = false

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
		local speed = tonumber(SpeedTextBox.Text)
		if speed then
			SpeedToggleButton.Text = "DISABLE"
			SpeedToggleButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background

			while walkspeedEnabled do
				wait(0.03)
				setWalkspeed(game.Players.LocalPlayer, speed)
			end
		end
	else
		-- Delay before disabling walkspeed to ensure it's not set to MIN_SPEED immediately
		wait(0.1)

		-- Disable walkspeed
		setWalkspeed(game.Players.LocalPlayer, MIN_SPEED)
		SpeedToggleButton.Text = "ENABLE"
		SpeedToggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
	end
end

-- Variables
local camera = game.Workspace.CurrentCamera
local defaultFOV = 70
local minValue = 70
local maxValue = 120
local enabled = false


-- Function to apply field of view
local function applyFOV()
	local fovValue = tonumber(FOVTextBox.Text)

	if fovValue and fovValue >= minValue and fovValue <= maxValue then
		camera.FieldOfView = fovValue
	else
		camera.FieldOfView = defaultFOV
		FOVTextBox.Text = tostring(defaultFOV)
	end
end

-- Enable/Disable Button Click Event
FOVToggleButton.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		applyFOV()
		FOVToggleButton.Text = "Disable"
		FOVToggleButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
	else
		camera.FieldOfView = defaultFOV
		FOVToggleButton.Text = "Enable"
		FOVToggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
	end
end)

-- TextBox Focus Lost Event
FOVTextBox.FocusLost:Connect(function()
	if enabled then
		applyFOV()
	end
end)

-- Script to instantly trigger all proximity prompts in Roblox using RunService

local RunService = game:GetService("RunService")

-- Variable to track the activation state
local isActivated = false

-- Function to handle proximity prompts
local function handleProximityPrompts()
	while isActivated do
		-- Iterate through all descendants in the game
		for _, descendant in pairs(game:GetDescendants()) do
			-- Check if the descendant is a ProximityPrompt
			local proximityPrompt = descendant:FindFirstChildOfClass("ProximityPrompt")
			if proximityPrompt then
				-- Set HoldDuration to 0 for instant triggering
				proximityPrompt.HoldDuration = 0
			end
		end
		RunService.RenderStepped:Wait()
	end
end

-- Connect the function to the TextButton's MouseButton1Click event
ProximityToggleButton.MouseButton1Click:Connect(function()
	if framepressed == true then
		
	else
		WarningFrame.Visible = true
		MinimizeButton.Visible = false
	end
end)


local Clipon = false
local Plr = game.Players.LocalPlayer
local SteppedConnection

local function toggleNoclip()
	if NoclipToggleButton.Text == "ENABLE" then
		Clipon = true
		NoclipToggleButton.Text = "DISABLE"
		NoclipToggleButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
		SteppedConnection = game:GetService("RunService").Stepped:Connect(function()
			if not Clipon then
				SteppedConnection:Disconnect() -- Disconnect the Stepped event when Clipon is false
				-- Enable collision back when disabling Noclip
				for _, b in pairs(workspace:GetChildren()) do
					if b.Name == Plr.Name and b:IsA("Model") then
						for _, v in pairs(b:GetDescendants()) do
							if v:IsA("BasePart") then
								v.CanCollide = true
							end
						end
					end
				end
			else
				for _, b in pairs(workspace:GetChildren()) do
					if b.Name == Plr.Name and b:IsA("Model") then
						for _, v in pairs(b:GetDescendants()) do
							if v:IsA("BasePart") then
								v.CanCollide = false
							end
						end
					end
				end
			end
		end)
	elseif NoclipToggleButton.Text == "DISABLE" then
		Clipon = false
		NoclipToggleButton.Text = "ENABLE"
		NoclipToggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
		-- Disconnect the Stepped event when disabling Noclip
		if SteppedConnection then
			SteppedConnection:Disconnect()
			-- Enable collision back when disabling Noclip
			for _, b in pairs(workspace:GetChildren()) do
				if b.Name == Plr.Name and b:IsA("Model") then
					for _, v in pairs(b:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = true
						end
					end
				end
			end
		end
	end
end

NoclipToggleButton.MouseButton1Click:Connect(toggleNoclip)

ESPToggleButton.MouseButton1Click:Connect(function()
	if Unsupported.Value == true then
		-- Open Unsupported Code UI
		UnsupportedFrame.Visible = true
	else
		print("supported")
	end
end)

OK.MouseButton1Click:Connect(function()
	UnsupportedFrame.Visible = false
end)

-- Variables
local xrayEnabled = false
local originalTransparencies = {}

-- Function to store original transparencies
local function storeOriginalTransparencies()
	for _, object in pairs(game:GetDescendants()) do
		if object:IsA("BasePart") then
			originalTransparencies[object] = object.Transparency
		end
	end
end

-- Function to enable XRAY
local function enableXRAY()
	for part, originalTransparency in pairs(originalTransparencies) do
		part.Transparency = 0.5
	end
	xrayEnabled = true
	XRayToggleButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
	XRayToggleButton.Text = "DISABLE"
end

-- Function to disable XRAY
local function disableXRAY()
	for part, originalTransparency in pairs(originalTransparencies) do
		part.Transparency = originalTransparency
	end
	xrayEnabled = false
	XRayToggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
	XRayToggleButton.Text = "ENABLE"
	storeOriginalTransparencies()
end

-- Main Script

-- Store original transparencies when the game starts
storeOriginalTransparencies()

XRayToggleButton.MouseButton1Click:Connect(function()
	if xrayEnabled then
		disableXRAY()
	else
		enableXRAY()
	end
end)


local function ToggleClose()
	ButtonFrame.Visible = false
	ToggleClosebutton.Visible = true
end

ToggleClosebutton.MouseButton1Click:Connect(function()
	ToggleClosebutton.Visible = false
	ButtonFrame.Visible = true
end)

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

YES.MouseButton1Click:Connect(function()
		YES.Parent.Visible = false
		if MinimizeButton.Visible == false then
			MinimizeButton.Visible = true
		end
		ProximityToggleButton.BackgroundColor3 = Color3.new(0.403922, 0.403922, 0.403922)
		ProximityToggleButton.Text = "ENABLED"
		framepressed = true
		-- Check if the script is not already activated
		if not isActivated then
			-- Set the activation state to true
			isActivated = true

			-- Start the handleProximityPrompts function
			handleProximityPrompts()
	end
end)
NO.MouseButton1Click:Connect(function()
	WarningFrame.Visible = false
	if MinimizeButton.Visible == false then
		MinimizeButton.Visible = true
	end
end)
enableDragging(ButtonFrame)
enableDragging(ToggleClosebutton)
SpeedToggleButton.MouseButton1Click:Connect(toggleWalkspeedScript)
MinimizeButton.MouseButton1Click:Connect(ToggleClose)


		
