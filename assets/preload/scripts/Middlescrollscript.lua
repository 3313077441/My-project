--by耿魇(写的快死了)
local angleshit = 1;
local anglevar = 1;
enabled = false
local angleshit2 = 2;
local anglevar2 = 2;
local intensity = 0
local intensity2 = 5
local function lerp(start, goal, alpha)
	return (start + ((goal - start) * alpha))
end

local window_default_x
local window_default_y
local window_shake_x = 0
local window_shake_y = 0
local window_shake_lerp = 0.05


function onCreate()
	window_default_x = getPropertyFromClass("openfl.Lib", "application.window.x")
	window_default_y = getPropertyFromClass("openfl.Lib", "application.window.y")
end

function onUpdate()
	local window_shake_temp_x = math.random(window_shake_x)
	local window_shake_temp_y = math.random(window_shake_y)

	window_shake_x = lerp(window_shake_x , window_shake_x, window_shake_lerp)
	window_shake_y = lerp(window_shake_y , window_shake_y, window_shake_lerp)
	setPropertyFromClass("openfl.Lib", "application.window.x", window_default_x + window_shake_temp_x)
	setPropertyFromClass("openfl.Lib", "application.window.y", window_default_y + window_shake_temp_y)
end

function onTweenCompleted(tag)
	if tag == 'A' then
		setPropertyFromGroup('opponentStrums', 0, 'angle', 0)
		setPropertyFromGroup('opponentStrums', 1, 'angle', 0)
		setPropertyFromGroup('opponentStrums', 2, 'angle', 0)
		setPropertyFromGroup('opponentStrums', 3, 'angle', 0)
		setPropertyFromGroup('opponentStrums', 4, 'angle', 0)

		setPropertyFromGroup('playerStrums', 0, 'angle', 0)
		setPropertyFromGroup('playerStrums', 1, 'angle', 0)
		setPropertyFromGroup('playerStrums', 2, 'angle', 0)
		setPropertyFromGroup('playerStrums', 3, 'angle', 0)
		setPropertyFromGroup('playerStrums', 4, 'angle', 0)
	end
end
function onBeatHit()
    if curBeat >= 0 then
        if curBeat % 2 == 0 then	
            local keepScroll = false
            ---Note X
            local lx = getRandomInt(0, 296.25);
            local dx = getRandomInt(346.25, 592.5);
            local ux = getRandomInt(642.5, 888.75);
            local rx = getRandomInt(938.75, 1185);
            ---Note Y
            local ly = getRandomInt(100, 630);
            ---Note Angle
            local la = getRandomInt(0, 360);
            local da = getRandomInt(0, 360);
            local ua = getRandomInt(0, 360);
            local ra = getRandomInt(0, 360);
            ---Note moving to X
            noteTweenX('NoteMove1', 4, lx, 0.5, cubeInOut);
            noteTweenX('NoteMove2', 5, dx, 0.5, cubeInOut);
            noteTweenX('NoteMove3', 6, ux, 0.5, cubeInOut);
            noteTweenX('NoteMove4', 7, rx, 0.5, cubeInOut);
            noteTweenX('NoteMove11', 0, lx, 0.5, cubeInOut);
            noteTweenX('NoteMove22', 1, dx, 0.5, cubeInOut);
            noteTweenX('NoteMove33', 2, ux, 0.5, cubeInOut);
            noteTweenX('NoteMove44', 3, rx, 0.5, cubeInOut);
            ---Note moving to Angle
            noteTweenAngle('NoteAngle1', 4, la, 0.5, cubeInOut);
            noteTweenAngle('NoteAngle2', 5, da, 0.5, cubeInOut);
            noteTweenAngle('NoteAngle3', 6, ua, 0.5, cubeInOut);
            noteTweenAngle('NoteAngle4', 7, ra, 0.5, cubeInOut);
            noteTweenAngle('NoteAngle11', 0, la, 0.5, cubeInOut);
            noteTweenAngle('NoteAngle22', 1, da, 0.5, cubeInOut);
            noteTweenAngle('NoteAngle33', 2, ua, 0.5, cubeInOut);
            noteTweenAngle('NoteAngle44', 3, ra, 0.5, cubeInOut);
            ---Note moving to Y
            noteTweenY('NoteMove5', 4, ly, 0.5, cubeInOut);
            noteTweenY('NoteMove55', 0, ly, 0.5, cubeInOut);
            if ly == 315 then
              local dy = getRandomInt(0, 360);
              local uy = getRandomInt(0, 360);
              local ry = getRandomInt(0, 360);
       
              noteTweenY('NoteMove6', 5, (getProperty(defaultPlayerStrumY0) - dy), 0.5, cubeInOut);
              noteTweenY('NoteMove7', 6, (getProperty(defaultPlayerStrumY1) + uy), 0.5, cubeInOut);
              noteTweenY('NoteMove8', 7, (getProperty(defaultPlayerStrumY2) - ry), 0.5, cubeInOut);
              noteTweenY('NoteMove66', 1, (getProperty(defaultPlayerStrumY0) - dy), 0.5, cubeInOut);
              noteTweenY('NoteMove77', 2, (getProperty(defaultPlayerStrumY1) + uy), 0.5, cubeInOut);
              noteTweenY('NoteMove88', 3, (getProperty(defaultPlayerStrumY2) - ry), 0.5, cubeInOut);
            elseif ly > 315 then
              local dyr = getRandomInt(316, 630);
              local uyr = getRandomInt(316, 630);
              local ryr = getRandomInt(316, 630);
       
              noteTweenY('NoteMove9', 5, dyr, 0.5, cubeInOut);
              noteTweenY('NoteMove10', 6, uyr, 0.5, cubeInOut);
              noteTweenY('NoteMove11', 7, ryr, 0.5, cubeInOut);
              noteTweenY('NoteMove99', 1, dyr, 0.5, cubeInOut);
              noteTweenY('NoteMove101', 2, uyr, 0.5, cubeInOut);
              noteTweenY('NoteMove111', 3, ryr, 0.5, cubeInOut);
              for i = 0,7 do
               setPropertyFromGroup('playerStrums', i, 'downScroll', true);
               setPropertyFromGroup('opponentStrums', i, 'downScroll', false);
              end
            elseif ly < 315 then
              local dyl = getRandomInt(100, 314);
              local uyl = getRandomInt(100, 314);
              local ryl = getRandomInt(100, 314);
       
              noteTweenY('NoteMove12', 5, dyl, 0.5, cubeInOut);
              noteTweenY('NoteMove13', 6, uyl, 0.5, cubeInOut);
              noteTweenY('NoteMove14', 7, ryl, 0.5, cubeInOut);
              noteTweenY('NoteMove121', 1, dyl, 0.5, cubeInOut);
              noteTweenY('NoteMove131', 2, uyl, 0.5, cubeInOut);
              noteTweenY('NoteMove141', 3, ryl, 0.5, cubeInOut);
              for i = 0,7 do
               setPropertyFromGroup('playerStrums', i, 'downScroll', false);
               setPropertyFromGroup('opponentStrums', i, 'downScroll', true);
              end
            enabled = true
        end
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit)
        setProperty('camGame.angle',angleshit)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*5, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*5, crochet*0.001, 'linear')
        if curBeat >= 43.8 then
            if curBeat % 2 == 0 then
                angleshit = anglevar;
            else
                angleshit = -anglevar;
            end
            setProperty('camHUD.angle',angleshit*20)
            setProperty('camGame.angle',angleshit*20)
            doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.005, 'circOut')
            doTweenX('tuin', 'camHUD', -angleshit*20, crochet*0.003, 'linear')
            doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.005, 'circOut')
            doTweenX('ttrn', 'camGame', -angleshit*20, crochet*0.003, 'linear')
            window_shake_x = 10
            window_shake_y = 10

            if curBeat >= 63.9 then
                if curBeat % 2 == 0 then
                    angleshit = anglevar;
                else
                    angleshit = -anglevar;
                end
                setProperty('camHUD.angle',angleshit*35)
                setProperty('camGame.angle',angleshit*35)
                doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.005, 'circOut')
                doTweenX('tuin', 'camHUD', -angleshit*35, crochet*0.003, 'linear')
                doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.005, 'circOut')
                doTweenX('ttrn', 'camGame', -angleshit*35, crochet*0.003, 'linear')
                window_shake_x = 20
                window_shake_y = 20
    
            if curBeat >= 161 then
                if curBeat % 2 == 0 then
                    angleshit = anglevar;
                else
                    angleshit = -anglevar;
                end
                setProperty('camHUD.angle',angleshit*5)
                setProperty('camGame.angle',angleshit*5)
                doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                doTweenX('tuin', 'camHUD', -angleshit*5, crochet*0.002, 'linear')
                doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                doTweenX('ttrn', 'camGame', -angleshit*5, crochet*0.002, 'linear')
                window_shake_x = 5
                window_shake_y = 5
                if curBeat >= 241 then
                    if curBeat % 2 == 0 then
                        angleshit = anglevar;
                    else
                        angleshit = -anglevar;
                    end
                    setProperty('camHUD.angle',angleshit*10)
                    setProperty('camGame.angle',angleshit*10)
                    doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                    doTweenX('tuin', 'camHUD', -angleshit*10, crochet*0.002, 'linear')
                    doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                    doTweenX('ttrn', 'camGame', -angleshit*10, crochet*0.002, 'linear')
                    window_shake_x = 10
                    window_shake_y = 10
                    if curBeat >= 245 then
                        if curBeat % 2 == 0 then
                            angleshit = anglevar;
                        else
                            angleshit = -anglevar;
                        end
                        setProperty('camHUD.angle',angleshit*15)
                        setProperty('camGame.angle',angleshit*15)
                        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                        doTweenX('tuin', 'camHUD', -angleshit*15, crochet*0.002, 'linear')
                        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                        doTweenX('ttrn', 'camGame', -angleshit*15, crochet*0.002, 'linear')
                        window_shake_x = 20
                        window_shake_y = 20
                        if curBeat >= 249 then
                            if curBeat % 2 == 0 then
                                angleshit = anglevar;
                            else
                                angleshit = -anglevar;
                            end
                            setProperty('camHUD.angle',angleshit*25)
                            setProperty('camGame.angle',angleshit*25)
                            doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                            doTweenX('tuin', 'camHUD', -angleshit*25, crochet*0.002, 'linear')
                            doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                            doTweenX('ttrn', 'camGame', -angleshit*25, crochet*0.002, 'linear')
                            window_shake_x = 30
                            window_shake_y = 30
                            if curBeat >= 254 then
                                if curBeat % 2 == 0 then
                                    angleshit = anglevar;
                                else
                                    angleshit = -anglevar;
                                end
                                setProperty('camHUD.angle',angleshit*35)
                                setProperty('camGame.angle',angleshit*35)
                                doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                                doTweenX('tuin', 'camHUD', -angleshit*35, crochet*0.002, 'linear')
                                doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                                doTweenX('ttrn', 'camGame', -angleshit*35, crochet*0.002, 'linear')
                                window_shake_x = 40
                                window_shake_y = 40
                                if curBeat >= 256 then
                                    if curBeat % 2 == 0 then
                                        angleshit = anglevar;
                                    else
                                        angleshit = -anglevar;
                                    end
                                    setProperty('camHUD.angle',angleshit*50)
                                    setProperty('camGame.angle',angleshit*50)
                                    doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                                    doTweenX('tuin', 'camHUD', -angleshit*50, crochet*0.002, 'linear')
                                    doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                                    doTweenX('ttrn', 'camGame', -angleshit*50, crochet*0.002, 'linear')
                                    window_shake_x = 35
                                    window_shake_y = 35
                                    if curBeat >= 319 then
                                        window_shake_x = 40
                                        window_shake_y = 40
                                        if curBeat >= 322 then
                                            window_shake_x = 50
                                            window_shake_y = 50
                                    if curBeat >= 385 then
                                        if curBeat % 2 == 0 then
                                            angleshit = anglevar;
                                        else
                                            angleshit = -anglevar;
                                        end
                                        setProperty('camHUD.angle',angleshit*5)
                                        setProperty('camGame.angle',angleshit*5)
                                        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                                        doTweenX('tuin', 'camHUD', -angleshit*5, crochet*0.002, 'linear')
                                        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                                        doTweenX('ttrn', 'camGame', -angleshit*5, crochet*0.002, 'linear')
                                        window_shake_x = 0
                                        window_shake_y = 0
                                        if curBeat >= 418 then
                                            if curBeat % 2 == 0 then
                                                angleshit = anglevar;
                                            else
                                                angleshit = -anglevar;
                                            end
                                            setProperty('camHUD.angle',angleshit*5)
                                            setProperty('camGame.angle',angleshit*5)
                                            doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                                            doTweenX('tuin', 'camHUD', -angleshit*5, crochet*0.002, 'linear')
                                            doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                                            doTweenX('ttrn', 'camGame', -angleshit*5, crochet*0.002, 'linear')
                                            if curBeat >= 420 then
                                                if curBeat % 2 == 0 then
                                                    angleshit = anglevar;
                                                else
                                                    angleshit = -anglevar;
                                                end
                                                setProperty('camHUD.angle',angleshit*5)
                                                setProperty('camGame.angle',angleshit*5)
                                                doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.003, 'circOut')
                                                doTweenX('tuin', 'camHUD', -angleshit*5, crochet*0.002, 'linear')
                                                doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.003, 'circOut')
                                                doTweenX('ttrn', 'camGame', -angleshit*5, crochet*0.002, 'linear')
                                                window_shake_x = 10 
                                                window_shake_y = 10
                if curBeat >= 548 then
                    if curBeat % 2 == 0 then
                        angleshit = anglevar;
                    else
                        angleshit = -anglevar;
                    end
                    setProperty('camHUD.angle',angleshit*25)
                    setProperty('camGame.angle',angleshit*25)
                    doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
                    doTweenX('tuin', 'camHUD', -angleshit*25, crochet*0.001, 'linear')
                    doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
                    doTweenX('ttrn', 'camGame', -angleshit*25, crochet*0.001, 'linear')	
                    if enabled then 
                        if curBeat % 2 == 0 then
                            angleshit2 = anglevar2;
                        else
                            angleshit2 = -anglevar2;
                        end
                        setProperty('camHUD.angle',angleshit2*intensity2)
                        setProperty('camGame.angle',angleshit2*intensity2)
                        doTweenAngle('turn', 'camHUD', angleshit2*intensity, stepCrochet*0.002, 'circOut')
                        doTweenX('tuin', 'camHUD', -angleshit2*intensity, crochet*0.001, 'linear')
                        doTweenAngle('tt', 'camGame', angleshit2*intensity, stepCrochet*0.002, 'circOut')
                        doTweenX('ttrn', 'camGame', -angleshit2*intensity, crochet*0.001, 'linear')
                        end
                end
    end
end
end
end
end
end
end
end
end       
end      
end     
end   
end  
function onStepHit()
    if enabled then
            if curStep % 4 == 0 then
                doTweenY('rrr', 'camHUD', -12*intensity2, stepCrochet*0.002, 'circOut')
                doTweenY('rtr', 'camGame.scroll', 24, stepCrochet*0.002, 'sineIn')
                noteTweenAngle('A', 0, 360, 0.5, 'circInOut')
                noteTweenAngle('B', 1, 360, 0.5, 'circInOut')
                noteTweenAngle('C', 2, 360, 0.5, 'circInOut')
                noteTweenAngle('D', 3, 360, 0.5, 'circInOut')
                noteTweenAngle('E', 4, 360, 0.5, 'circInOut')
                noteTweenAngle('F', 5, 360, 0.5, 'circInOut')
                noteTweenAngle('G', 6, 360, 0.5, 'circInOut')
                noteTweenAngle('H', 7, 360, 0.5, 'circInOut')
                noteTweenAngle('I', 8, 360, 0.5, 'circInOut')
                noteTweenAngle('J', 9, 360, 0.5, 'circInOut')
                noteTweenAlpha("NoteAlpha2", 1, -1, 0.5, 'linear')
                noteTweenAlpha("NoteAlpha4", 3, -1, 0.5, 'linear')
                noteTweenAlpha("NoteAlpha3", 2, -1, 0.5, 'linear')
                noteTweenAlpha("NoteAlpha1", 0, -1, 0.5, 'linear')
                noteTweenAlpha("NoteAlpha222", 4, -1, 0.5, 'linear')
                noteTweenAlpha("NoteAlpha434", 5, -1, 0.5, 'linear')
                noteTweenAlpha("NoteAlpha3123", 6, -1, 0.5, 'linear')
                noteTweenAlpha("NoteAlpha11421", 7, -1, 0.5, 'linear')
            end
            if curStep % 4 == 2 then
                doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
                doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
                noteTweenAlpha("NoteAlpha2124", 1, 1, 0.3, 'linear')
                noteTweenAlpha("NoteAlpha41521524", 3, 1, 0.3, 'linear')
                noteTweenAlpha("NoteAlpha312124", 2, 1, 0.3, 'linear')
                noteTweenAlpha("NoteAlpha1112524", 0, 1, 0.3, 'linear')
                noteTweenAlpha("NoteAlpha22", 4, 1, 0.3, 'linear')
                noteTweenAlpha("NoteAlpha44", 5, 1, 0.3, 'linear')
                noteTweenAlpha("NoteAlpha33", 6, 1, 0.3, 'linear')
                noteTweenAlpha("NoteAlpha11", 7, 1, 0.3, 'linear')
            end
            end
    end
function onSongStart()
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.7)
        noteTweenX("Note0", 2, 640, 5, "cubeInOut")
        noteTweenX("Note1", 0, 400, 5, "cubeInOut")
        noteTweenX("Note2", 3, 760, 5, "cubeInOut")
        noteTweenX("Note3", 1, 520, 5, "cubeInOut")
            noteTweenX("Note5", 6, 640, 5, "cubeInOut")
            noteTweenX("Note7", 4, 400, 5, "cubeInOut")
            noteTweenX("Note6", 7, 760, 5, "cubeInOut")
            noteTweenX("Note4", 5, 520, 5, "cubeInOut")
    end
end       
end 
     
end 