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

-- UI
local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,110)
frame.Position = UDim2.new(0.05,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,25)
title.Text = "Optimizer Jull"
title.BackgroundColor3 = Color3.fromRGB(40,40,40)
title.TextColor3 = Color3.new(1,1,1)

local fpsLabel = Instance.new("TextLabel", frame)
fpsLabel.Position = UDim2.new(0,0,0,30)
fpsLabel.Size = UDim2.new(1,0,0,25)
fpsLabel.TextColor3 = Color3.new(0,1,0)
fpsLabel.BackgroundTransparency = 1

local pingLabel = Instance.new("TextLabel", frame)
pingLabel.Position = UDim2.new(0,0,0,55)
pingLabel.Size = UDim2.new(1,0,0,25)
pingLabel.TextColor3 = Color3.new(0,1,1)
pingLabel.BackgroundTransparency = 1

local toggle = Instance.new("TextButton", frame)
toggle.Position = UDim2.new(0,20,0,80)
toggle.Size = UDim2.new(0,160,0,25)
toggle.Text = "Hide Panel"
toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
toggle.TextColor3 = Color3.new(1,1,1)

local show = true
toggle.MouseButton1Click:Connect(function()
    show = not show
    fpsLabel.Visible = show
    pingLabel.Visible = show
    toggle.Text = show and "Hide Panel" or "Show Panel"
end)

local frames = 0
local last = tick()

RunService.RenderStepped:Connect(function()
    frames += 1
    if tick()-last >= 1 then
        fpsLabel.Text = "FPS : "..frames
        pingLabel.Text = "Ping : "..math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()).." ms"
        frames = 0
        last = tick()
    end
end)
