local function translateText(text)
    if type(text) ~= "string" or text == "" then return text end
    local dict = {
        ["Synergy Hub"] = "fw汉化我的翻译有点不准尽量",
        ["Join our discord server now!"] = "加了dc。。",
        ["Aimbot"] = "自动瞄准",
        ["Enable Aimbot"] = "打开",
        ["FOV Mode"] = "FOV 模式",
        ["Screen"] = "屏幕",
        ["FOV"] = "视场角（FOV）",
        ["Target Team"] = "目标团队",
        ["Criminals"] = "逃出者",
        ["Guards"] = "警察",
        ["Inmates"] = "囚犯",
        ["Targets"] = "目标",
        ["First"] = "首先",
        ["Last"] = "最后",
        ["Target Part"] = "目标部件",
        ["Head"] = "头部",
        ["HumanoidRootPart"] = "移动目标?",
        ["UpperTorso"] = "上躯干",
        ["Hit Chance"] = "命中率",
        ["Miss Spread"] = "Miss Spread(不知道啥意思)",
        ["Max Distance"] = "最大距离",
        ["Wall Check"] = "墙检查",
        ["ForceField Check"] = "力场检查",
        ["Auto Reload"] = "自动装填",
        ["Show FOV"] = "显示视野范围",
        ["Show Target Indicator"] = "显示目标指示器",
        ["Show Target Line"] = "显示目标线",
        ["Dynamic FOV"] = "动态视野（Dynamic FOV）",
        ["Highlight Target"] = "高亮目标",
        ["Rainbow Highlight"] = "彩虹高光",
        ["Highlight Color"] = "自定义高光",
        ["FOV Radius"] = "视场半径",
        ["All"] = "全部",
        ["Aim Mode"] = "瞄准模式",
        ["Smoothness"] = "平滑性",
        ["Enable Silent Aim"] = "开启",
        ["Silent Aim"] = "静态瞄准",
        ["Torso"] = "躯干",
        ["LeftArm"] = "左臂",
        ["RightArm"] = "右臂",
        ["LeftLeg"] = "左腿",
        ["RightLeg"] = "右腿",
        ["Random"] = "随机",
        ["Auto Shoot"] = "自动射击",
        ["Enable Auto Shoot"] = "开启",
        ["Target Teams"] = "目标团队",
        ["Hitboxes"] = "碰撞箱",
        ["Expanded Hitbox"] = "开启",
        ["Size"] = "大小",
        ["Shape"] = "形状",
        ["Square"] = "方形",
        ["Circle"] = "圆",
        ["Color"] = "颜色",
        ["Transparency"] = "透明度",
        ["ESP"] = "透视",
        ["Teleport"] = "传送",
        ["Select Player"] = "选择玩家",
        ["Teleport To Player"] = "传送到玩家",
        ["Select Location"] = "选择位置",
        ["Select Gun"] = "选择武器",
        ["Get Guns"] = "给予武器",
        ["LAUNCH"] = "打开",
        ["Prison Life"] = "监狱人生",
        ["RUN SCRIPT"] = "执行脚本",
        ["Anti-Tase"] = "反Tase",
        ["No Recoil"] = "无后坐力",
        ["Rapid Fire"] = "连发",
        ["Give Key Card"] = "给门卡(实体)",
        ["Miscellaneous"] = "杂项",
        ["Player"] = "玩家(本地)",
        ["Constant Speed Hack"] = "速度黑客不稳定打架的时候别人也会被踢",
        ["Infinite Jump"] = "无限跳跃",
        ["Noclip"] = "穿墙",
        ["Fly"] = "飞行",
        ["Fly Speed"] = "飞行速度",
        ["Speed"] = "不稳定有中等概率被踢",
        ["Jump Power"] = "跳跃力量",
        ["Time Multiplier"] = "时间倍增器",
        ["To Location"] = "地方",
        ["Armory"] = "军械库",
        ["Inside Prison"] = "监狱内",
        ["Secret Room"] = "秘密房间",
        ["Prison Yard"] = "监狱庭院",
        ["Criminal Base"] = "逃出者出生点",
        ["Prisonar Car Spawner"] = "警车生成点",
        ["Prison Kitchen"] = "监狱厨房",
        ["Information"] = "关于",
        ["Team"] = "团队",
        ["Discord Server"] = "加入我们DC服务器",
        ["Website"] = "网站",
        ["None"] = "无",
        ["Interface Language"] = "界面语言",
        ["Interface Theme"] = "界面主题",
        ["Rose Gray"] = "界面3",
        ["Deep Blue"] = "界面2",
        ["Graphite"] = "界面1",
        ["Visual"] = "视觉",
        ["Change My Username"] = "改变我的用户名",
        ["Change Other Player Names"] = "改变全部人的用户名",
        ["Choose Skybox"] = "选择Skybox(没空剩下的不翻译了)",
        ["Original"] = "原本",
        ["Alya"] = "阿利亚",
        ["Alya 2"] = "阿利亚2",
        ["Restore Original Sky"] = "恢复原始天空",
        [""] = "",
        ["Lighting Preset"] = "灯光预设",
        ["Restore"] = "恢复",
        ["Visuals"] = "视觉",
        [""] = "",
        ["Brightness"] = "亮度",
        ["Exposure"] = "暴露",
        ["Fog Distance"] = "雾距",
        ["Ambient"] = "环境",
        ["Cinematic"] = "电影般的",
        ["Performance"] = "性能",
        ["Keybinds"] = "快捷键",
        ["Toggle UI"] = "切换用户界面",
        ["Hitbox Expander"] = "碰撞箱",
        ["Time of Day"] = "一天中的时间",
        ["Prison Car Spawner"] = "监狱车辆生成点",
        ["Follows Mouse"] = "跟随鼠标",
        ["Message"] = "留言信息",
        ["Send Report"] = "发送报告",
        [""] = "",
        [""] = "",
        [""] = "",
        [""] = "",
            }
    local keys = {}
    for k, _ in pairs(dict) do table.insert(keys, k) end
    table.sort(keys, function(a, b) return #a > #b end)
    for _, eng in ipairs(keys) do
        local chn = dict[eng]
        local pattern = "%f[%a]" .. eng:gsub("(%W)", "%%%1") .. "%f[%A]"
        text = text:gsub(pattern, chn)
    end
    return text
end

local function translateContainer(container)
    if not container then return end
    for _, obj in ipairs(container:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            local original = obj.Text
            if original and original ~= "" then
                local translated = translateText(original)
                if translated ~= original then
                    pcall(function() obj.Text = translated end)
                end
            end
            obj:GetPropertyChangedSignal("Text"):Connect(function()
                local currentText = obj.Text
                if currentText and currentText ~= "" then
                    local translated = translateText(currentText)
                    if translated ~= currentText then
                        pcall(function() obj.Text = translated end)
                    end
                end
            end)
        end
    end
end

local function onDescendantAdded(obj)
    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
        task.spawn(function()
            task.wait(0.05)
            local original = obj.Text
            if original and original ~= "" then
                local translated = translateText(original)
                if translated ~= original then
                    pcall(function() obj.Text = translated end)
                end
            end
            obj:GetPropertyChangedSignal("Text"):Connect(function()
                local currentText = obj.Text
                if currentText and currentText ~= "" then
                    local translated = translateText(currentText)
                    if translated ~= currentText then
                        pcall(function() obj.Text = translated end)
                    end
                end
            end)
        end)
    end
end

local function startTranslation()
    local containers = {
        game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
        game:GetService("CoreGui")
    }
    for _, container in ipairs(containers) do
        translateContainer(container)
        container.DescendantAdded:Connect(onDescendantAdded)
    end
end

startTranslation()
loadstring(game:HttpGet("https://synergy-team-official.vercel.app/api/script/launcher"))()
