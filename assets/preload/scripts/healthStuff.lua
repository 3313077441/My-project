--by耿魇
function onCreate()
    makeLuaText('healthText', 'Health: ' .. math.floor(getProperty("health") * 50), 200, 1030, 0)
    addLuaText('healthText')
    setTextSize('healthText', 0)
    setTextFont('healthText', 'Phantom.ttf')
end


function onUpdate(elapsed)
    setTextString('healthText', 'Health: ' .. math.floor(getProperty("health") * 50))
end

