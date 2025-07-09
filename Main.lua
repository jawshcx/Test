local webhook = "https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE" -- Replace with your webhook URL

-- Silent request (no error messages)
pcall(function()
    local data = {
        content = "hello",
        username = "Roblox Player"
    }
    game:GetService("HttpService"):RequestAsync({
        Url = webhook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(data)
    })
end)

-- Optional: Fake "print" to avoid suspicion
print("Script executed") -- Shows in console but doesn't confirm webhook success
