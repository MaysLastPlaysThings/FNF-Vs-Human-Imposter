local xx = -100; --750
local yy = 1150; --750
local xx2 = 400; --1500
local yy2 = 1350; --750
local ofs = 15;
local ofs2 = 35;
local followchars = true;
local del = 0;
local del2 = 0;
local dadzoom = 0.65;
local bfzoom = 0.8;
local HPDrain = false;
local beating = false;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onCreate()
		makeAnimatedLuaSprite('wall','BG/maroon/InVolcano/wallBP', -2900, -100)
		addAnimationByPrefix('wall','loop','Back wall and lava',24,true)
		scaleObject('wall', 1.4, 1.3)
		addLuaSprite('wall')
		
		makeAnimatedLuaSprite('bubb','BG/maroon/InVolcano/bubbles', -1000, 1800)
		addAnimationByPrefix('bubb','loop','Lava Bubbles',24,true)
		scaleObject('bubb', 1.3, 1.3)
		addLuaSprite('bubb')
		
		makeLuaSprite('floor','BG/maroon/InVolcano/platform', -950, 1525)
		scaleObject('floor', 1.5, 2)
		addLuaSprite('floor')
		
		makeLuaSprite('OrangeGlow', 'BG/maroon/InVolcano/OrangeGlowOverlay', -1280, 420)
		setBlendMode('OrangeGlow', 'ADD')
		setProperty('OrangeGlow.alpha', 0.1)
		scaleObject('OrangeGlow', 2, 2)
		addLuaSprite('OrangeGlow', true)
			
		makeLuaSprite('Overlay', 'BG/maroon/InVolcano/overlaythjing', -1350, 300)
		setBlendMode('Overlay', 'ADD')
		scaleObject('Overlay', 2, 2)
		addLuaSprite('Overlay', true)
   HPDrain = true;

	makeLuaSprite('RedFlash', '', 0, 0)
	makeGraphic('RedFlash', 1300, 750, 'FF1000')
	setObjectCamera('RedFlash','hud')
	setProperty('RedFlash.alpha', 0.0001)
	addLuaSprite('RedFlash', true)
	
	makeLuaSprite('RedFlash_Above', 'BG/maroon/InVolcano/RedFlash_Above', -1400, 400)
	setProperty('RedFlash_Above.alpha', 0.0001)
	scaleObject('RedFlash_Above', 1.47, 1.1)
	addLuaSprite('RedFlash_Above', true)

    makeLuaSprite('red','redbg', 0, 0)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	makeLuaSprite('csdown','cutscene1', 0, 0)
	makeLuaSprite('csup','cutscene2', 0, 0)
    addLuaSprite('red')
	addLuaSprite('flash')
	addLuaSprite('flashwhite')
	
	
	addLuaSprite('csup')
	addLuaSprite('csdown')
	
	
	
	setProperty('red.alpha', 0);
	setObjectCamera('red', 'other');
	setProperty('flash.alpha', 0);
	setObjectCamera('flash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'hud');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'hud');
	
	makeLuaSprite('Name','boiling point V2', -500, 100)
	addLuaSprite('Name')
	setObjectCamera('Name', 'hud');
	scaleObject('Name',0.75,0.75)
	
end

function onBeatHit()
	if curBeat % 2 == 0 then
	  if beating == true then
	  triggerEvent('Add Camera Zoom', 0.03, 0.03)
	  end
	end
end


function onStepHit()
   if curStep == 1 then
		doTweenX('NameTweenX', 'Name', 0, 2, 'CircInOut');
		runTimer('nameout', 5);
   end
   if curStep == 128 or curStep == 9999 then
   beating = true
   end
   if curStep == 9999 or curStep == 9999 then
   beating = false
   end
   if curStep == 128 or curStep == 512 or curStep == 1280 or curStep == 2176 or curStep == 2304 or curStep == 2640 then
   flash()
   end
   if curStep == 9999 or curStep == 9999 or curStep == 9999 then
   cuton()
   end
   if curStep == 9999 or curStep == 9999 or curStep == 9999 then
   cutoff()
   end
   if curStep == 512 or curStep == 1280 or curStep == 1920 or curStep == 2176 or curStep == 2432 or curStep == 2592 then
   xx = 0; 
   yy = 1250;
   xx2 = 0;
   yy2 = 1250;
   triggerEvent('Camera Follow Pos',xx,yy)
   end
   if curStep == 640 or curStep == 1408 or curStep == 2048 or curStep == 2304 or curStep == 2560 then
   xx = -100; 
   yy = 1150;
   xx2 = 200;
   yy2 = 1350;
   triggerEvent('Camera Follow Pos',xx,yy)
   end
   if curStep == 2560 then
   bfzoom = 0.9
   dadzoom = 0.75
   end
end

function flash()
    setProperty('flashwhite.alpha', 1);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function flashdark()
    setProperty('flash.alpha', 1);
	doTweenAlpha('flashdowndark', 'flash', 0, 1.5, 'linear');
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'nameout' then
	doTweenX('NameTweenX2', 'Name', -500, 2, 'CircInOut');
    end
end

function cuton()
    doTweenY('CSUPY', 'csup', 0, 1, 'CircInOut');
    doTweenY('SCDOWNY', 'csdown', 0, 1, 'CircInOut');
	setProperty('healthBar.alpha', tonumber(0))
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
end

function cutoff()
    doTweenY('CSUPYend', 'csup', -100, 1, 'CircInOut');
    doTweenY('SCDOWNYend', 'csdown', 100, 1, 'CircInOut');
	setProperty('healthBar.alpha', tonumber(1))
    setProperty('iconP1.alpha', tonumber(1))
    setProperty('iconP2.alpha', tonumber(1))
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',dadzoom)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs2,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
			end

        else
            setProperty('defaultCamZoom',bfzoom)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
			end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

function opponentNoteHit()
    triggerEvent('Screen Shake','0.01, 0.01','0.1, 0.0075');

		if HPDrain and not isSustainNote then
			setProperty('health', getProperty('health')-0.02*getProperty('health'))

		elseif HPDrain and isSustainNote then
			setProperty('health', getProperty('health')-0.008*getProperty('health'))
		end
    end