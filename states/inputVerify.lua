-- Transforma todos os comandos de entrada do love em comandos válidos para a engine

class.InputVerify()

commandList = {lshift = "poo", g = "ness", up = "paula", t = "jeff"}

function InputVerify:load()
end

function InputVerify:close()
end

function InputVerify:enable()
 print("Módulo INPUT VERIFY iniciado com sucesso")
end

function InputVerify:disable()
end

function InputVerify:update(dt)
end

function InputVerify:draw()
end

function InputVerify:keypressed(key, isrepeat)
	if commandList[key] ~= nil then
		lovelyMoon.buttonpressed(commandList[key])
	end
end

function InputVerify:keyreleased(key)
	if commandList[key] ~= nil then
		lovelyMoon.buttonreleased(commandList[key])
	end
end

function InputVerify:mousepressed(x, y, button)
	if commandList[key] ~= nil then
		lovelyMoon.buttonpressed(commandList[key])
	end
end

function InputVerify:mousereleased(x, y, button)
	if commandList[key] ~= nil then
		lovelyMoon.buttonreleased(commandList[key])
	end
end