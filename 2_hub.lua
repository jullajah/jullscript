-- HUB MINI TERPISAH BY JULL
-- Panel draggable + tombol panggil script lain

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

-- PANEL UTAMA
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0,180,0,30)
panel.Position = UDim2.new(0,10,0,10)
panel.BackgroundColor3 = Color3.fromRGB(20,20,20)
panel.BackgroundTransparency = 0.3
panel.Active = true
panel.Draggable = true
panel.Parent = gui

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "Hub Tech Menu"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = panel

-- FUNGSI TAMBAH TOMBOL
local function addTechButton(name, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,160,0,24)
    btn.Position = UDim2.new(0,10,0,yPos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSans
    btn.Parent = gui

    btn.MouseButton1Click:Connect(callback)
end

-- CONTOH TOMBOL (Ganti link dengan script kamu sendiri)
addTechButton("Tech 1", 50, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jullajah/jullscript/main/optimizer.lua"))()
end)

addTechButton("Tech 2", 80, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jullajah/jullhub/main/floattech.lua"))()
end)

addTechButton("Tech 3", 110, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jullajah/jullhub/main/supatech.lua"))()
end)
