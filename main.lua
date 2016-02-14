-- Importa todos os game states
require("states/StartSequence")

function love.load()
	-- Verifica os argumentos de inicialização para escolher o modo de execução
	debugMode = false

	for l = 1, #arg do
		if (arg[l] == "-KelverMode") then
			-- Inicia no modo debug
			require("lib/cupid")
			lovebird = require("lib/lovebird")

			debugMode = true
		end
	end
	-- Adiciona os game states para uso futuro.
	addState(StartSequence, "StartSequence")
end

function love.update(dt)
	if (debugMode) then
		lovebird.update(dt)
	end

	lovelyMoon.update(dt)
end

function love.draw()
	lovelyMoon.draw()
end

function love.keypressed(key, unicode)
	lovelyMoon.keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	lovelyMoon.keyreleased(key, unicode)
end

function love.mousepressed(x, y, button)
	lovelyMoon.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	lovelyMoon.mousereleased(x, y, button)
end