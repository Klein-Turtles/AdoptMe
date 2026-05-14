local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Pet Purchaser Tool",
   LoadingTitle = "Loading Utility...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "PetPurchaseConfig",
      FileName = "MainConfig"
   }
})

local Tab = Window:CreateTab("Main Features", 4483362458) -- Icon ID

local Section = Tab:CreateSection("Auto Buy")

Tab:CreateButton({
   Name = "Buy Cuddly Candle Pet",
   Callback = function()
      local args = {
         "sky_ux_2023_cuddly_candle"
      }
      
      -- Menjalankan remote untuk pembelian
      local api = game:GetService("ReplicatedStorage"):WaitForChild("API", 5)
      if api then
          local productAPI = api:WaitForChild("ProductsAPI/PromptProductPurchase", 5)
          if productAPI then
              productAPI:FireServer(unpack(args))
              Rayfield:Notify({
                 Title = "Purchase Executed",
                 Content = "Remote fired for Cuddly Candle!",
                 Duration = 3,
                 Image = 4483362458,
              })
          else
              Rayfield:Notify({Title = "Error", Content = "ProductsAPI not found!", Duration = 5})
          end
      else
          Rayfield:Notify({Title = "Error", Content = "ReplicatedStorage API not found!", Duration = 5})
      end
   end,
})

Rayfield:Notify({
   Title = "Script Loaded",
   Content = "Siap digunakan, Gar!",
   Duration = 5,
})