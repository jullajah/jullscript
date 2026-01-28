-- OptimizerLiteFPSPingDrag_By_Jull

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local LP = Players.LocalPlayer

pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level1
end)

Lighting.GlobalShadows = false
Lighting.FogEnd = math.huge
Lighting.Brightness = 0.8
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0
Lighting.Ambient = Color3.fromRGB(120,120,120)
Lighting.OutdoorAmbient = Lighting.Ambient

local function optimize(o)
    if o:IsA("BasePart") then
        o.Material = Enum.Material.Plastic
        o.Reflectance = 0
        o.CastShadow = false
    elseif o:IsA("ParticleEmitter") then
        o.Rate = 5
        o.Lifetime = NumberRange.new(0.1)
        o.Size = NumberSequence.new(0.2)
        o.Transparency = NumberSequence.new(0.7)
    elseif o:IsA("Trail") or o:IsA("Beam") then
        o.Enabled = false
    end
end

for _,v in ipairs(workspace:GetDescendants()) do
    optimize(v)
end
workspace.DescendantAdded:Connect(optimize)

-- MINI UI FPS & PING (COLOR + DRAG TOGGLE)

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

-- FPS TEXT
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Parent = gui
fpsLabel.Size = UDim2.new(0,90,0,20)
fpsLabel.Position = UDim2.new(0,10,0,10)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(0,255,0)
fpsLabel.TextScaled = true
fpsLabel.Font = Enum.Font.SourceSansBold

-- PING TEXT
local pingLabel = Instance.new("TextLabel")
pingLabel.Parent = gui
pingLabel.Size = UDim2.new(0,110,0,20)
pingLabel.Position = UDim2.new(0,10,0,30)
pingLabel.BackgroundTransparency = 1
pingLabel.TextColor3 = Color3.fromRGB(0,200,255)
pingLabel.TextScaled = true
pingLabel.Font = Enum.Font.SourceSansBold

-- TOGGLE BUTTON (DRAGGABLE)
local toggle = Instance.new("TextButton")
toggle.Parent = gui
toggle.Size = UDim2.new(0,70,0,22)
toggle.Position = UDim2.new(0,10,0,55)
toggle.Text = "HIDE"
toggle.BackgroundColor3 = Color3.fromRGB(40,40,40)
toggle.TextColor3 = Color3.fromRGB(255,255,255)
toggle.TextScaled = true
toggle.Active = true
toggle.Draggable = true

-- TOGGLE SYSTEM
local show = true
toggle.MouseButton1Click:Connect(function()
	show = not show
	fpsLabel.Visible = show
	pingLabel.Visible = show
	toggle.Text = show and "HIDE" or "SHOW"
end)

-- FPS & PING COUNTER
local frames = 0
local last = tick()

RunService.RenderStepped:Connect(function()
	frames += 1
	if tick() - last >= 1 then
		fpsLabel.Text = "FPS: "..frames
		pingLabel.Text = "Ping: "..math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()).." ms"

		-- FPS COLOR
		if frames >= 60 then
			fpsLabel.TextColor3 = Color3.fromRGB(0,255,0)
		elseif frames >= 40 then
			fpsLabel.TextColor3 = Color3.fromRGB(255,255,0)
		else
			fpsLabel.TextColor3 = Color3.fromRGB(255,0,0)
		end

		frames = 0
		last = tick()
	end
end)

