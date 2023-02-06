--by bilibili gengyan
local able = false
function onStartCountdown()
makeAnimatedLuaSprite('static', 'static', 0, 0)
addAnimationByPrefix('static', 'pror', 'static', 24, true)
setObjectCamera('static', 'other'); 
scaleObject('static', 4, 3)
addLuaSprite('static', true)

   if able == false then 
	doTweenAlpha('static', 'static',1,0.00000000001,'linear');  
	able = true
    end
end

function onBeatHit()
	if curBeat % 2 == 0 then
elseif able == true then
able = false
doTweenAlpha('static', 'static',0.2,7,'linear'); 
end
end


function onPause()  
makeLuaSprite('blackBG', nil);
makeGraphic('blackBG', screenWidth, screenHeight, '000000');
setObjectCamera('blackBG', 'Other');
setProperty('blackBG.alpha', 1);
addLuaSprite('blackBG');
 end
function onResume()
makeLuaSprite('blackBG', nil);
makeGraphic('blackBG', screenWidth, screenHeight, '000000');
setObjectCamera('blackBG', 'Other');
setProperty('blackBG.alpha', 0);
addLuaSprite('blackBG');
end

