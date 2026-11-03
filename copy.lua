--[[
    AVATAR CHANGER
    Client-side Roblox LocalScript
    Features:
    - Username lookup and avatar application
    - Display name override
    - Animation copying
    - Emote selection and playback
    - R15 viewport preview
    - Reapply on respawn
    - Exportable standalone mini-script
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

--// SETTINGS
local SETTINGS = {
    Username = "",
    DisplayName = "",
    UseAnimations = true,
    ReapplyOnRespawn = true,
    Emote = "wave"
}

local DEFAULT_EMOTES = {
    "wave",
    "point",
    "cheer",
    "laugh",
    "dance",
    "dance2",
    "dance3"
}

local DEFAULT_EMOTE_IDS = {
    wave = 507770239,
    point = 507770453,
    cheer = 507770677,
    laugh = 507770818,
    dance = 507771019,
    dance2 = 507776043,
    dance3 = 507777268
}

local ANIMATION_PROPERTIES = {
    "IdleAnimation",
    "WalkAnimation",
    "RunAnimation",
    "JumpAnimation",
    "FallAnimation",
    "ClimbAnimation",
    "SwimAnimation"
}

local currentDescription
local currentUsername
local currentDisplayName
local currentEmotes = {}
local currentEmoteIndex = 1
local previewModel
local previewTrack
local currentCharacter
local applying = false

--// HELPERS

local function safeCall(callback, ...)
    local args = table.pack(...)
    local ok, result = pcall(function()
        return callback(table.unpack(args, 1, args.n))
    end)

    if not ok then
        warn("[Avatar Changer]", result)
        return false, result
    end

    return true, result
end

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getHumanoid(character)
    return character:FindFirstChildOfClass("Humanoid")
        or character:WaitForChild("Humanoid", 10)
end

local function getAnimator(humanoid)
    local animator = humanoid:FindFirstChildOfClass("Animator")

    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end

    return animator
end

--// GUI

local gui = Instance.new("ScreenGui")
gui.Name = "AvatarChanger"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local function create(class, properties, parent)
    local object = Instance.new(class)

    for property, value in pairs(properties) do
        object[property] = value
    end

    object.Parent = parent
    return object
end

local function round(object, radius)
    create("UICorner", {
        CornerRadius = UDim.new(0, radius or 10)
    }, object)
end

local function stroke(object, color)
    create("UIStroke", {
        Color = color or Color3.fromRGB(55, 55, 68),
        Thickness = 1
    }, object)
end

local COLORS = {
    Background = Color3.fromRGB(17, 17, 23),
    Panel = Color3.fromRGB(25, 25, 34),
    Input = Color3.fromRGB(34, 34, 45),
    Accent = Color3.fromRGB(125, 95, 255),
    Text = Color3.fromRGB(240, 240, 245),
    Muted = Color3.fromRGB(150, 150, 165),
    Green = Color3.fromRGB(90, 205, 135),
    Red = Color3.fromRGB(235, 95, 95)
}

-- Main window
local main = create("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(650, 440),
    Position = UDim2.new(0.5, -325, 0.5, -220),
    BackgroundColor3 = COLORS.Background,
    BorderSizePixel = 0,
    Active = true,
    Draggable = true
}, gui)

round(main, 14)
stroke(main)

-- Top bar
local topbar = create("Frame", {
    Size = UDim2.new(1, 0, 0, 48),
    BackgroundColor3 = COLORS.Panel,
    BorderSizePixel = 0
}, main)

round(topbar, 14)

create("TextLabel", {
    Size = UDim2.new(1, -100, 1, 0),
    Position = UDim2.fromOffset(17, 0),
    BackgroundTransparency = 1,
    Text = "AVATAR CHANGER",
    TextColor3 = COLORS.Text,
    TextSize = 17,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, topbar)

local close = create("TextButton", {
    Size = UDim2.fromOffset(35, 30),
    Position = UDim2.new(1, -45, 0, 9),
    BackgroundColor3 = Color3.fromRGB(65, 40, 50),
    Text = "X",
    TextColor3 = COLORS.Text,
    TextSize = 14,
    Font = Enum.Font.GothamBold
}, topbar)

round(close, 8)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Left side
local left = create("Frame", {
    Position = UDim2.fromOffset(15, 65),
    Size = UDim2.fromOffset(300, 360),
    BackgroundTransparency = 1
}, main)

local function label(parent, text, position, size)
    return create("TextLabel", {
        Position = position,
        Size = size,
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = COLORS.Text,
        TextSize = 12,
        Font = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left
    }, parent)
end

local function textbox(parent, placeholder, position, size)
    local box = create("TextBox", {
        Position = position,
        Size = size,
        BackgroundColor3 = COLORS.Input,
        TextColor3 = COLORS.Text,
        PlaceholderColor3 = COLORS.Muted,
        PlaceholderText = placeholder,
        Text = "",
        TextSize = 13,
        Font = Enum.Font.Gotham,
        ClearTextOnFocus = false
    }, parent)

    round(box, 8)
    return box
end

local function button(parent, text, position, size, callback)
    local btn = create("TextButton", {
        Position = position,
        Size = size,
        BackgroundColor3 = COLORS.Accent,
        Text = text,
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = true
    }, parent)

    round(btn, 8)

    btn.MouseButton1Click:Connect(callback)
    return btn
end

label(left, "TARGET USERNAME", UDim2.fromOffset(0, 0), UDim2.fromOffset(280, 20))

local usernameBox = textbox(
    left,
    "Enter Roblox username...",
    UDim2.fromOffset(0, 24),
    UDim2.fromOffset(285, 37)
)

label(left, "DISPLAY NAME OVERRIDE (OPTIONAL)",
    UDim2.fromOffset(0, 72), UDim2.fromOffset(285, 20))

local displayBox = textbox(
    left,
    "Custom display name...",
    UDim2.fromOffset(0, 96),
    UDim2.fromOffset(285, 37)
)

local applyButton = button(
    left,
    "APPLY AVATAR",
    UDim2.fromOffset(0, 147),
    UDim2.fromOffset(285, 39),
    function() end
)

-- Toggle helper
local function makeToggle(text, position, default)
    local enabled = default

    local btn = button(
        left,
        text .. ": " .. (enabled and "ON" or "OFF"),
        position,
        UDim2.fromOffset(285, 32),
        function()
            enabled = not enabled
            btn.Text = text .. ": " .. (enabled and "ON" or "OFF")
            btn.BackgroundColor3 = enabled and COLORS.Accent or COLORS.Input
        end
    )

    return function()
        return enabled
    end, btn
end

local getAnimationsEnabled = makeToggle(
    "Use their animations/pose",
    UDim2.fromOffset(0, 198),
    true
)

local getRespawnEnabled = makeToggle(
    "Reapply on respawn",
    UDim2.fromOffset(0, 238),
    true
)

local status = label(
    left,
    "Status: Waiting for username...",
    UDim2.fromOffset(0, 281),
    UDim2.fromOffset(285, 35)
)

status.TextWrapped = true
status.TextColor3 = COLORS.Muted

-- Emotes
label(left, "EMOTES", UDim2.fromOffset(0, 322), UDim2.fromOffset(285, 20))

local cycleButton = button(
    left,
    "Selected: wave",
    UDim2.fromOffset(0, 343),
    UDim2.fromOffset(135, 32),
    function() end
)

local playButton = button(
    left,
    "PLAY EMOTE",
    UDim2.fromOffset(145, 343),
    UDim2.fromOffset(140, 32),
    function() end
)

-- Right side / Preview
local right = create("Frame", {
    Position = UDim2.fromOffset(330, 65),
    Size = UDim2.fromOffset(305, 360),
    BackgroundColor3 = COLORS.Panel,
    BorderSizePixel = 0
}, main)

round(right, 12)
stroke(right)

label(right, "AVATAR PREVIEW",
    UDim2.fromOffset(15, 10),
    UDim2.fromOffset(275, 24))

local viewport = create("ViewportFrame", {
    Position = UDim2.fromOffset(10, 40),
    Size = UDim2.new(1, -20, 1, -120),
    BackgroundColor3 = Color3.fromRGB(31, 31, 42),
    BorderSizePixel = 0,
    Ambient = Color3.fromRGB(180, 180, 180),
    LightColor = Color3.fromRGB(255, 255, 255),
    LightDirection = Vector3.new(-1, -1, -1)
}, right)

round(viewport, 10)

local world = Instance.new("WorldModel")
world.Parent = viewport

local camera = Instance.new("Camera")
camera.Parent = viewport
viewport.CurrentCamera = camera

local previewName = label(
    right,
    "Player Name",
    UDim2.fromOffset(15, 284),
    UDim2.fromOffset(275, 23)
)

previewName.TextSize = 15
previewName.Font = Enum.Font.GothamBold

local previewUsername = label(
    right,
    "@username",
    UDim2.fromOffset(15, 307),
    UDim2.fromOffset(275, 20)
)

previewUsername.TextColor3 = COLORS.Muted

button(
    main,
    "EXPORT MINI SCRIPT",
    UDim2.new(1, -175, 1, -42),
    UDim2.fromOffset(160, 30),
    function() end
)

--// PREVIEW ANIMATIONS

local function stopPreviewTrack()
    if previewTrack then
        pcall(function()
            previewTrack:Stop()
            previewTrack:Destroy()
        end)

        previewTrack = nil
    end
end

local function playPreviewAnimation(animationId, looped)
    if not previewModel or not animationId then
        return
    end

    stopPreviewTrack()

    local humanoid = previewModel:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local animator = getAnimator(humanoid)

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. tostring(animationId)

    local ok, track = safeCall(function()
        return animator:LoadAnimation(animation)
    end)

    if ok and track then
        previewTrack = track
        track.Looped = looped

        safeCall(function()
            track:Play()
        end)
    end

    animation:Destroy()
end

local function getAnimationId(description, property)
    local ok, value = safeCall(function()
        return description[property]
    end)

    if ok and tonumber(value) and tonumber(value) > 0 then
        return tonumber(value)
    end

    return nil
end

local function playPreviewIdle()
    if not currentDescription then return end

    local idleId = getAnimationId(currentDescription, "IdleAnimation")

    if idleId then
        playPreviewAnimation(idleId, true)
    else
        stopPreviewTrack()
    end
end

local function updatePreview(description, username, displayName)
    if previewModel then
        previewModel:Destroy()
        previewModel = nil
    end

    world:ClearAllChildren()

    local ok, model = safeCall(function()
        return Players:CreateHumanoidModelFromDescription(
            description,
            Enum.HumanoidRigType.R15
        )
    end)

    if not ok or not model then
        status.Text = "Status: Preview creation failed."
        return
    end

    previewModel = model
    model.Parent = world

    model:PivotTo(CFrame.new(0, 0, 0))

    local root = model:FindFirstChild("HumanoidRootPart")

    if root then
        camera.CFrame = CFrame.lookAt(
            root.Position + Vector3.new(0, 1.5, 8),
            root.Position + Vector3.new(0, 1.5, 0)
        )
    end

    previewName.Text = displayName
    previewUsername.Text = "@" .. username

    task.wait(0.2)
    playPreviewIdle()
end

--// EMOTE COLLECTION

local function buildEmotes(description)
    local found = {}
    local list = {}

    local function add(name, animationId)
        if not name or found[name] then return end

        found[name] = true
        table.insert(list, {
            Name = name,
            Id = animationId
        })
    end

    for _, name in ipairs(DEFAULT_EMOTES) do
        add(name, DEFAULT_EMOTE_IDS[name])
    end

    local ok, emotes = safeCall(function()
        return description:GetEmotes()
    end)

    if ok and type(emotes) == "table" then
        for name, ids in pairs(emotes) do
            local id = type(ids) == "table" and ids[1] or ids
            add(name, id)
        end
    end

    local equippedOK, equipped = safeCall(function()
        return description:GetEquippedEmotes()
    end)

    if equippedOK and type(equipped) == "table" then
        for name, ids in pairs(equipped) do
            local id = type(ids) == "table" and ids[1] or ids
            add(name, id)
        end
    end

    return list
end

local function getSelectedEmote()
    return currentEmotes[currentEmoteIndex]
end

local function updateEmoteButton()
    local emote = getSelectedEmote()

    cycleButton.Text = "Selected: " .. (emote and emote.Name or "None")
end

local function playEmote()
    local emote = getSelectedEmote()
    if not emote then return end

    local character = getCharacter()
    local humanoid = getHumanoid(character)

    if not humanoid then return end

    -- First try Roblox's built-in emote system.
    local ok, played = safeCall(function()
        return humanoid:PlayEmote(emote.Name)
    end)

    -- Preview uses the corresponding animation asset where available.
    if emote.Id then
        playPreviewAnimation(emote.Id, false)
    end

    if not ok or not played then
        status.Text = "Status: Emote may not be supported by this avatar."
    end

    if emote.Id then
        local animationLength = 3

        task.delay(animationLength, function()
            if previewModel and currentDescription then
                playPreviewIdle()
            end
        end)
    end
end

cycleButton.MouseButton1Click:Connect(function()
    if #currentEmotes == 0 then return end

    currentEmoteIndex += 1

    if currentEmoteIndex > #currentEmotes then
        currentEmoteIndex = 1
    end

    updateEmoteButton()
end)

playButton.MouseButton1Click:Connect(playEmote)

--// APPLY AVATAR

local function applyAvatar()
    if applying then return end
    applying = true

    local username = usernameBox.Text:gsub("^%s+", ""):gsub("%s+$", "")

    if username == "" then
        status.Text = "Status: Enter a username first."
        applying = false
        return
    end

    status.Text = "Status: Looking up username..."

    local idOK, userId = safeCall(function()
        return Players:GetUserIdFromNameAsync(username)
    end)

    if not idOK or not userId then
        status.Text = "Status: Could not find that username."
        applying = false
        return
    end

    status.Text = "Status: Downloading avatar..."

    local descOK, description = safeCall(function()
        return Players:GetHumanoidDescriptionFromUserId(userId)
    end)

    if not descOK or not description then
        status.Text = "Status: Could not retrieve avatar."
        applying = false
        return
    end

    currentDescription = description
    currentUsername = username

    currentDisplayName = displayBox.Text:gsub("^%s+", ""):gsub("%s+$", "")

    if currentDisplayName == "" then
        currentDisplayName = username
    end

    currentEmotes = buildEmotes(description)
    currentEmoteIndex = 1

    for index, emote in ipairs(currentEmotes) do
        if emote.Name == SETTINGS.Emote then
            currentEmoteIndex = index
            break
        end
    end

    updateEmoteButton()

    status.Text = "Status: Applying avatar..."

    local character = getCharacter()
    local humanoid = getHumanoid(character)

    if not humanoid then
        status.Text = "Status: Character humanoid missing."
        applying = false
        return
    end

    -- Apply the full avatar description.
    local applyOK = safeCall(function()
        humanoid:ApplyDescription(description)
    end)

    if not applyOK then
        status.Text = "Status: Avatar application failed."
        applying = false
        return
    end

    -- Display name is local to this client.
    humanoid.DisplayName = currentDisplayName

    -- Copy animation settings into the character's Animate script.
    if getAnimationsEnabled() then
        local animate = character:FindFirstChild("Animate")

        if animate then
            for _, property in ipairs(ANIMATION_PROPERTIES) do
                local id = getAnimationId(description, property)

                if id then
                    local animationName = property:gsub("Animation$", ""):lower()
                    local animationObject = animate:FindFirstChild(animationName, true)

                    if animationObject and animationObject:IsA("Animation") then
                        animationObject.AnimationId = "rbxassetid://" .. id
                    end
                end
            end
        end
    end

    updatePreview(description, username, currentDisplayName)

    status.Text = "Status: Avatar applied successfully!"
    applying = false

    -- Automatically play selected emote.
    task.delay(1, function()
        if currentDescription and currentUsername then
            playEmote()
        end
    end)
end

applyButton.MouseButton1Click:Connect(applyAvatar)

--// RESPAWN SUPPORT

local function reapplyCurrentAvatar(character)
    if not currentDescription or not getRespawnEnabled() then
        return
    end

    task.wait(1)

    if not character or not character.Parent then
        return
    end

    local humanoid = getHumanoid(character)
    if not humanoid then return end

    safeCall(function()
        humanoid:ApplyDescription(currentDescription)
    end)

    humanoid.DisplayName = currentDisplayName or currentUsername or ""

    if getAnimationsEnabled() then
        local animate = character:FindFirstChild("Animate")

        if animate then
            for _, property in ipairs(ANIMATION_PROPERTIES) do
                local id = getAnimationId(currentDescription, property)

                if id then
                    local name = property:gsub("Animation$", ""):lower()
                    local object = animate:FindFirstChild(name, true)

                    if object and object:IsA("Animation") then
                        object.AnimationId = "rbxassetid://" .. id
                    end
                end
            end
        end
    end

    task.wait(1)
    playEmote()
end

LocalPlayer.CharacterAdded:Connect(function(character)
    currentCharacter = character
    reapplyCurrentAvatar(character)
end)

--// EXPORT WINDOW

local exportWindow
local exportBox

local function generateMiniScript()
    local username = currentUsername or usernameBox.Text
    local displayName = currentDisplayName or displayBox.Text
    local emote = getSelectedEmote()
    local emoteName = emote and emote.Name or "wave"

    local useAnimations = getAnimationsEnabled()
    local respawn = getRespawnEnabled()

    -- Standalone client-side script.
    local lines = {
        "-- Avatar Changer Mini Export",
        "-- Client-side LocalScript",
        "",
        "local Players = game:GetService('Players')",
        "local player = Players.LocalPlayer",
        "",
        "local CONFIG = {",
        "    Username = " .. string.format("%q", username),
        "    DisplayName = " .. string.format("%q", displayName),
        "    Emote = " .. string.format("%q", emoteName),
        "    UseAnimations = " .. tostring(useAnimations),
        "    ReapplyOnRespawn = " .. tostring(respawn),
        "}",
        "",
        "local ANIMATIONS = {",
        "    'IdleAnimation', 'WalkAnimation', 'RunAnimation',",
        "    'JumpAnimation', 'FallAnimation', 'ClimbAnimation',",
        "    'SwimAnimation'",
        "}",
        "",
        "local function apply()",
        "    local ok, result = pcall(function()",
        "        local userId = Players:GetUserIdFromNameAsync(CONFIG.Username)",
        "        local description = Players:GetHumanoidDescriptionFromUserId(userId)",
        "        local character = player.Character or player.CharacterAdded:Wait()",
        "        local humanoid = character:WaitForChild('Humanoid')",
        "        humanoid:ApplyDescription(description)",
        "        humanoid.DisplayName = CONFIG.DisplayName",
        "",
        "        if CONFIG.UseAnimations then",
        "            local animate = character:FindFirstChild('Animate')",
        "            if animate then",
        "                for _, property in ipairs(ANIMATIONS) do",
        "                    local id = description[property]",
        "                    if id and id ~= 0 then",
        "                        local name = property:gsub('Animation$', ''):lower()",
        "                        local object = animate:FindFirstChild(name, true)",
        "                        if object and object:IsA('Animation') then",
        "                            object.AnimationId = 'rbxassetid://' .. id",
        "                        end",
        "                    end",
        "                end",
        "            end",
        "        end",
        "",
        "        task.wait(1)",
        "        pcall(function() humanoid:PlayEmote(CONFIG.Emote) end)",
        "    end)",
        "    if not ok then warn('[Avatar Changer]', result) end",
        "end",
        "",
        "apply()",
        "",
        "if CONFIG.ReapplyOnRespawn then",
        "    player.CharacterAdded:Connect(function()",
        "        task.wait(1)",
        "        apply()",
        "    end)",
        "end"
    }

    return table.concat(lines, "\n")
end

local exportButton = main:FindFirstChild("TextButton")

-- Create export button separately for reliable reference.
local export = create("TextButton", {
    Position = UDim2.new(1, -175, 1, -42),
    Size = UDim2.fromOffset(160, 30),
    BackgroundColor3 = COLORS.Accent,
    Text = "EXPORT MINI SCRIPT",
    TextColor3 = COLORS.Text,
    TextSize = 11,
    Font = Enum.Font.GothamBold
}, main)

round(export, 8)

export.MouseButton1Click:Connect(function()
    if exportWindow then
        exportWindow:Destroy()
    end

    exportWindow = create("Frame", {
        Size = UDim2.fromOffset(480, 340),
        Position = UDim2.new(0.5, -240, 0.5, -170),
        BackgroundColor3 = COLORS.Background,
        BorderSizePixel = 0,
        Active = true,
        Draggable = true,
        ZIndex = 5
    }, gui)

    round(exportWindow, 12)
    stroke(exportWindow)

    local exportTitle = create("TextLabel", {
        Size = UDim2.new(1, -50, 0, 40),
        Position = UDim2.fromOffset(15, 0),
        BackgroundTransparency = 1,
        Text = "EXPORT MINI SCRIPT",
        TextColor3 = COLORS.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 6
    }, exportWindow)

    local exportClose = create("TextButton", {
        Size = UDim2.fromOffset(30, 28),
        Position = UDim2.new(1, -40, 0, 6),
        BackgroundColor3 = COLORS.Input,
        Text = "X",
        TextColor3 = COLORS.Text,
        ZIndex = 6
    }, exportWindow)

    round(exportClose, 6)

    exportClose.MouseButton1Click:Connect(function()
        exportWindow:Destroy()
        exportWindow = nil
    end)

    exportBox = create("TextBox", {
        Position = UDim2.fromOffset(12, 45),
        Size = UDim2.new(1, -24, 1, -95),
        BackgroundColor3 = COLORS.Input,
        TextColor3 = COLORS.Text,
        TextSize = 11,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = false,
        MultiLine = true,
        ClearTextOnFocus = false,
        TextEditable = true,
        Text = generateMiniScript(),
        ZIndex = 6
    }, exportWindow)

    round(exportBox, 8)

    local copyButton = create("TextButton", {
        Position = UDim2.new(0, 12, 1, -40),
        Size = UDim2.new(1, -24, 0, 29),
        BackgroundColor3 = COLORS.Accent,
        Text = "SELECT ALL / COPY",
        TextColor3 = COLORS.Text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        ZIndex = 6
    }, exportWindow)

    round(copyButton, 8)

    copyButton.MouseButton1Click:Connect(function()
        exportBox:CaptureFocus()
        exportBox.CursorPosition = 1
        exportBox.SelectionStart = #exportBox.Text + 1
    end)
end)

print("[Avatar Changer] Loaded successfully.")
