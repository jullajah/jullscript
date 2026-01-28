-- HubGUI Final By Jull

local CoreGui = game:GetService("CoreGui")

-- PANEL UTAMA
local gui = Instance.new("ScreenGui")
gui.Parent = CoreGui
gui.Name = "HubGUI"

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0,220,0,220)
panel.Position = UDim2.new(0.05,0,0.3,0)
panel.BackgroundColor3 = Color3.fromRGB(30,30,30)
panel.BackgroundTransparency = 0.3
panel.Active = true
panel.Draggable = true
panel.Parent = gui

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Hub Tech Menu"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = panel

-- FUNGSI TAMBAH TOMBOL
local function addTechButton(name, yPos, url)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,200,0,30)
    btn.Position = UDim2.new(0,10,0,yPos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSans
    btn.Parent = panel -- tombol jadi anak panel

    btn.MouseButton1Click:Connect(function()
        -- Jika URL valid akan load script
        -- Untuk sekarang pakai dummy print agar bisa test tombol
        if url then
            local success, err = pcall(function()
                loadstring(game:HttpGet(url))()
            end)
            if not success then
                warn("Gagal load tech:", err)
            end
        end
    end)
end

-- ===== ISI TOMBOL TECH (Bisa diganti link RAW asli nanti) =====
addTechButton("Supa Tech", 40, "https://raw.githubusercontent.com/jullajah/jullsc/main/supa.lua")
addTechButton("Float Tech", 80, "https://raw.githubusercontent.com/jullajah/jullsc/main/floattech.lua")
addTechButton("Other Tech", 120, "https://raw.githubusercontent.com/jullajah/jullsc/main/other.lua")
-- ===== SELESAI =====

-- TOMBOL CLOSE
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextScaled = true
closeBtn.Parent = panel

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
