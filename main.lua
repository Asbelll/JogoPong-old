-- Importa todos os states.
require("states/StartSequence")
require("states/Game")

-- Importa módulos.
require("classes/mInputVerify")

function love.load()
	-- Verifica os argumentos de inicialização para escolher o modo de execução.
	for l = 1, #arg do
		if (arg[l] == "-KelverMode") then
			-- Adiciona e ativa o DebugMode.
			require("states/DebugMode")
			addState(DebugMode, "DebugMode")
			enableState("DebugMode")
		end
	end

	-- Adiciona os game states para uso futuro.
	addState(StartSequence, "StartSequence")
	addState(Game, "Game")

	-- Game state inicial.
	enableState("StartSequence")
end

function love.update(dt)
	InputVerify:update(dt)
	lovelyMoon.update(dt)
end

function love.draw()
	lovelyMoon.draw()
end

function love.keypressed(key)
	InputVerify:keypressed(key)

end

function love.keyreleased(key)
	InputVerify:keyreleased(key)
end

function love.mousepressed(x, y, button)
	lovelyMoon.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	lovelyMoon.mousereleased(x, y, button)
end
