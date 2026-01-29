-- Hitbox TSB Mini By Jull (ON/OFF Only)
local CoreGui = game:GetService("CoreGui")

-- PANEL UTAMA MINI
local gui = Instance.new("ScreenGui")
gui.Name = "HitboxTSB_Only"
gui.Parent = CoreGui

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0,140,0,100) -- kecil & ramping
panel.Position = UDim2.new(0.05,0,0.4,0)
panel.BackgroundColor3 = Color3.fromRGB(25,25,25)
panel.BackgroundTransparency = 0.4
panel.Active = true
panel.Draggable = true
panel.Parent = gui

-- TITLE MINI
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,20)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Hitbox TSB"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = panel

-- FUNGSI TAMBAH HITBOX ON/OFF
local function addHitbox(name, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,120,0,20)
    btn.Position = UDim2.new(0,10,0,yPos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSans
    btn.Parent = panel

    local toggled = false
    btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            btn.BackgroundColor3 = Color3.fromRGB(0,200,0) -- ON warna hijau
        else
            btn.BackgroundColor3 = Color3.fromRGB(50,50,50) -- OFF warna default
        end
        callback(toggled)
    end)
end

-- ===== HITBOX ON/OFF =====
addHitbox("Enable Hitbox", 30, function(state)
    if state then
        print("Hitbox ON")
        -- masukkan fungsi ON di sini
    else
        print("Hitbox OFF")
        -- masukkan fungsi OFF di sini
    end
end)
-- ========================

-- CLOSE BUTTON MINI
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,25,0,25)
closeBtn.Position = UDim2.new(1,-30,0,5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = panel

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
