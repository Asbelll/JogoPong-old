-- Transforma todos os comandos de entrada do love em comandos válidos para a engine

class.InputVerify()

commandList = {lshift = "poo", g = "ness", up = "paula", t = "jeff"}

function InputVerify:keypressed(key, isrepeat)
	if commandList[key] ~= nil then
		lovelyMoon.keypressed(commandList[key], isrepeat)
	end
end

function InputVerify:keyreleased(key)
	if commandList[key] ~= nil then
		lovelyMoon.keyreleased(commandList[key])
	end
end
