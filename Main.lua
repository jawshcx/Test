local webhook = "https://discord.com/api/webhooks/1392626763753980096/0h6oh110aNMABPc86YI1YfVhEGT5HNsimjCy836iyLci0RTAHu0YFzFaoArTm-xHdNFT"

local function SendWebhook()
    -- 1. First try standard RequestAsync
    local success, response = pcall(function()
        return game:GetService("HttpService"):RequestAsync({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({
                content = "hello from " .. game.Players.LocalPlayer.Name,
                username = "Roblox Player"
            })
        })
    end)
    
    -- 2. If failed, try executor-specific methods
    if not success then
        -- Synapse X
        if syn and syn.request then
            syn.request({
                Url = webhook,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = '{"content":"hello"}'
            })
        -- Krnl/Other executors
        elseif request then
            request({
                url = webhook,
                method = "POST",
                headers = {["Content-Type"] = "application/json"},
                data = '{"content":"hello"}'
            })
        end
    end
end

-- Run with delay to avoid detection
task.delay(math.random(3, 7), SendWebhook)
print("Script loaded successfully")
