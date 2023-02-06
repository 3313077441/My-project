--by耿魇
function onEvent(name,value1,value2)
if name == 'hidehud' then
    doTweenAlpha('hud', 'camHUD', value1, value2, 'linear')
  end		
end