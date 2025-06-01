-- GUI Oluştur
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ItemGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Başlık (üst bar)
local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
titleBar.BackgroundTransparency = 0.2
titleBar.Text = "Item Spawner"
titleBar.Font = Enum.Font.GothamBold
titleBar.TextColor3 = Color3.new(1, 1, 1)
titleBar.TextSize = 18
titleBar.Parent = frame

-- Kapatma butonu
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextSize = 14
closeBtn.Parent = frame

closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- Spawn butonu
local spawnBtn = Instance.new("TextButton")
spawnBtn.Size = UDim2.new(0.8, 0, 0, 50)
spawnBtn.Position = UDim2.new(0.1, 0, 0.5, -25)
spawnBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
spawnBtn.BackgroundTransparency = 0.1
spawnBtn.Text = "Get All Items"
spawnBtn.Font = Enum.Font.GothamBold
spawnBtn.TextColor3 = Color3.new(1, 1, 1)
spawnBtn.TextSize = 20
spawnBtn.Parent = frame

-- RemoteEvent'e eriş
local remoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("SpawnDiamondBlock")

-- Butona tıklandığında 80 kez çalıştır
spawnBtn.MouseButton1Click:Connect(function()
	for i = 1, 80 do
		remoteEvent:FireServer()
		wait(0.05) -- küçük bir bekleme koymak iyi olur
	end
end)
