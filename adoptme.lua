local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Adopt Me Utility",
   LoadingTitle = "Preparing Tools...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AdoptMeConfig",
      FileName = "PetTool"
   }
})

local Tab = Window:CreateTab("Main Features", 4483362458)

local Section = Tab:CreateSection("Balloon Unicorn")

-- Tombol untuk ID Balloon Unicorn yang baru kamu temukan
Tab:CreateButton({
   Name = "Get/Download Balloon Unicorn",
   Callback = function()
      local args = {
         "Pets",
         "summerfest_2024_balloon_unicorn"
      }
      
      local success, result = pcall(function()
         return game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DownloadsAPI/Download"):InvokeServer(unpack(args))
      end)

      if success then
          Rayfield:Notify({
             Title = "Invoke Success",
             Content = "Data Balloon Unicorn berhasil dipanggil!",
             Duration = 3,
             Image = 4483362458,
          })
      else
          Rayfield:Notify({Title = "Error", Content = "Gagal memanggil Remote.", Duration = 5})
      end
   end,
})

-- Tombol untuk Cuddly Candle (sebagai cadangan)
Tab:CreateButton({
   Name = "Buy Cuddly Candle",
   Callback = function()
      local args = {"sky_ux_2023_cuddly_candle"}
      game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("ProductsAPI/PromptProductPurchase"):FireServer(unpack(args))
      
      Rayfield:Notify({
         Title = "Purchase Executed",
         Content = "Remote fired for Cuddly Candle!",
         Duration = 3,
      })
   end,
})

Rayfield:Notify({
   Title = "Script Loaded",
   Content = "ID Balloon Unicorn sudah siap, Gar!",
   Duration = 5,
})
