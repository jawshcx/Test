local webhook = "https://discord.com/api/webhooks/1392626763753980096/0h6oh110aNMABPc86YI1YfVhEGT5HNsimjCy836iyLci0RTAHu0YFzFaoArTm-xHdNFT" -- Replace with your webhook URL

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
