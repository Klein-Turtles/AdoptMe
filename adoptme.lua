local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Adopt Me Pet Shop Tool",
   LoadingTitle = "Added Spaniel.",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "PetBuyConfig",
      FileName = "Selection"
   }
})

local Tab = Window:CreateTab("Auto Buy Pets", 4483362458)

-- Section untuk memisahkan daftar pet
local Section = Tab:CreateSection("Available Pets")

-- Fungsi utama untuk nembak remote purchase (Sudah diperbaiki)
local function PurchasePet(petID, petName)
    local args = { petID }
    local api = game:GetService("ReplicatedStorage"):WaitForChild("API", 5)
    
    if api then
        local productAPI = api:WaitForChild("ProductsAPI/PromptProductPurchase", 5)
        if productAPI then
            productAPI:FireServer(unpack(args))
            -- Bagian Image dihapus supaya tidak error "Icon is not a valid member"
            Rayfield:Notify({
                Title = "Purchase Sent",
                Content = "Mencoba membeli: " .. petName,
                Duration = 3,
            })
        else
            Rayfield:Notify({Title = "Error", Content = "ProductsAPI tidak ditemukan!", Duration = 5})
        end
    else
        Rayfield:Notify({Title = "Error", Content = "Folder API tidak ditemukan!", Duration = 5})
    end
end

-- Tombol untuk Balloon Unicorn
Tab:CreateButton({
   Name = "Buy Balloon Unicorn (Summerfest 2024)",
   Callback = function()
       PurchasePet("summerfest_2024_balloon_unicorn", "Balloon Unicorn")
   end,
})

-- Tombol untuk Cuddly Candle
Tab:CreateButton({
   Name = "Buy Cuddly Candle (Sky UX)",
   Callback = function()
       PurchasePet("sky_ux_2023_cuddly_candle", "Cuddly Candle")
   end,
})

-- Tombol untuk Frost Dragon
Tab:CreateButton({
   Name = "Buy Frost Dragon",
   Callback = function()
       PurchasePet("frost_dragon", "Frost Dragon")
   end,
})


Tab:CreateButton({
   Name = "Buy Spaniel",
   Callback = function()
       PurchasePet("royal_palace_2022_spaniel", "Spaniel")
   end,
})
-- Kategori Extra
Tab:CreateSection("Extra")
Tab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
       Rayfield:Destroy()
   end,
})

Rayfield:Notify({
   Title = "Script Loaded",
   Content = "Daftar pet sudah siap, Gar!",
   Duration = 5,
})
