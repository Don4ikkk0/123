local Rice = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")
local Activate = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local OpenClose = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

Rice.Name = "Rice"
Rice.Parent = game.CoreGui
Rice.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Rice
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.321207851, 0, 0.409807354, 0)
Main.Size = UDim2.new(0, 295, 0, 116)
Main.Visible = false
Main.Active = true
Main.Draggable = true

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 295, 0, 16)
Title.Font = Enum.Font.GothamBold
Title.Text = "Rice Anti-Afk"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 12.000
Title.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0, 0, 0.861901641, 0)
Credits.Size = UDim2.new(0, 295, 0, 16)
Credits.Font = Enum.Font.GothamBold
Credits.Text = "Made by jamess#0007"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 12.000
Credits.TextWrapped = true

Activate.Name = "Activate"
Activate.Parent = Main
Activate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Activate.BorderColor3 = Color3.fromRGB(27, 42, 53)
Activate.BorderSizePixel = 0
Activate.Position = UDim2.new(0.0330629945, 0, 0.243326917, 0)
Activate.Size = UDim2.new(0, 274, 0, 59)
Activate.Font = Enum.Font.GothamBold
Activate.Text = "Activate"
Activate.TextColor3 = Color3.fromRGB(0, 255, 127)
Activate.TextSize = 43.000
Activate.TextStrokeColor3 = Color3.fromRGB(102, 255, 115)

UICorner.Parent = Activate

OpenClose.Name = "Open/Close"
OpenClose.Parent = Rice
OpenClose.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
OpenClose.Position = UDim2.new(0.353924811, 0, 0.921739101, 0)
OpenClose.Size = UDim2.new(0, 247, 0, 35)
OpenClose.Font = Enum.Font.GothamBold
OpenClose.Text = "Open/Close"
OpenClose.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenClose.TextSize = 14.000

UICorner_2.Parent = OpenClose

-- Anti-AFK Functionality
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

local function NERMBF_fake_script() -- OpenClose.LocalScript 
    local script = Instance.new('LocalScript', OpenClose)

    local frame = script.Parent.Parent.Main
    
    script.Parent.MouseButton1Click:Connect(function()
        frame.Visible = not frame.Visible
    end)
end
coroutine.wrap(NERMBF_fake_script)()

-- Chat and Notification Functions
function chatmsg(text, color) 
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = text;
        Color = color;
    })
end

function notif(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration;
    })
end
-- Snowflake AutoFarm
local path = workspace:WaitForChild("Particles"):WaitForChild("Snowflakes")
local lplr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local collecttick = tick()

chatmsg("SNOWFLAKES ACTIVATED! Waiting for snowflakes TG: @DKdon4ik.", Color3.fromRGB(107, 170, 253))
notif("ALPHA FARM", "AUTOFARM SNOWFLAKE TG: @DKdon4ik", 5)

function getsnowflake()
    local snowflakes = path:GetChildren()
    for _, snowflake in ipairs(snowflakes) do
        local ray = Ray.new(snowflake.Position, Vector3.new(0, -10, 0))
        local hit, position = workspace:FindPartOnRay(ray)

        if hit then
            return snowflake
        end
    end
    return nil
end

while true do
    lplr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    
    local selectedsnowflake = getsnowflake()
    if selectedsnowflake then
        collecttick = tick()
        game:GetService("TweenService"):Create(
            lplr.HumanoidRootPart,
            TweenInfo.new(0.5), 
            {CFrame = selectedsnowflake.CFrame + Vector3.new(0, 15, 0)}
        ):Play()
        lplr.HumanoidRootPart.Velocity = Vector3.zero

        repeat task.wait(0.05) until (tick() - collecttick > 0.5) 
        task.wait(2.5)
    else
        notif("ALPHA FARM", "FINDING SNOWFLAKE TG @DKdon4ik.", 2)
task.wait(0.5)
    end
end
