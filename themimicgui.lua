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

-- Create the vertical tabs container
local tabsContainer = Instance.new("Frame")
tabsContainer.Name = "TabsContainer"
tabsContainer.Size = UDim2.new(0.2, 0, 1, 0) -- Width of the tabs
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

-- Create a button for toggling walkspeed script
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0.5, 0, 0.1, 0)
toggleButton.Position = UDim2.new(0.25, 0, 0.6, 0)
toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
toggleButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14
toggleButton.Text = "ENABLE"
toggleButton.Parent = contentContainer

-- Create a button for minimizing/restoring the frame
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(0, 0, 1, -20)
minimizeButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
minimizeButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 14
minimizeButton.Text = "-"
minimizeButton.Parent = frame

-- Create a button for closing the interface
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -20, 1, -20)
closeButton.BackgroundColor3 = Color3.new(0, 0, 1) -- Blue background
closeButton.TextColor3 = Color3.new(1, 1, 1) -- White text color
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Text = "X"
closeButton.Parent = frame

-- Function to handle the toggle button click
local function handleToggle()
    if toggleButton.Text == "ENABLE" then
        toggleButton.Text = "DISABLE"
        toggleButton.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
    else
        toggleButton.Text = "ENABLE"
        toggleButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Green background
    end
end

-- Function to handle the minimize button click
local function handleMinimize()
    if minimizeButton.Text == "-" then
        minimizeButton.Text = "+"
        frame:TweenSize(UDim2.new(0, 250, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
    else
        minimizeButton.Text = "-"
        frame:TweenSize(UDim2.new(0, 250, 0, 200), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true)
    end
end

-- Function to handle the close button click
local function handleClose()
    screenGui:Destroy()
end

-- Connect the button click events
toggleButton.MouseButton1Click:Connect(handleToggle)
minimizeButton.MouseButton1Click:Connect(handleMinimize)
closeButton.MouseButton1Click:Connect(handleClose)
