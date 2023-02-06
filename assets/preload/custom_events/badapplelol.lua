function onEvent(name, value1, value2)
	if name == 'badapplelol' and value1 == 'a' then
		makeLuaSprite('whitebg', '', -500, -300)
		makeGraphic('whitebg',5000,5000,'000000')
		addLuaSprite('whitebg', false)
	end
	if name == 'badapplelol' and value1 == 'b' then
		removeLuaSprite('whitebg')
	end
end