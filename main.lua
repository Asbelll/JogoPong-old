-- Importa todos os game states
require("states/StartSequence")

function love.load()
	-- Verifica os argumentos de inicialização para escolher o modo de execução
	for l = 1, #arg do
		if (arg[l] == "-KelverMode" and debugMode == false) then
			-- Inicia no modo debug caso solicitado
			lovebird = require("lib/lovebird")
			fpsGraph = require "lib/FPSGraph"

			-- Cria gráficos informativos
			fpsInfo = fpsGraph.createGraph()
			memoryInfo = fpsGraph.createGraph(0, 30)

			-- Inicia modulos de debug do Cupid
			cupid_load_modules("console")

			-- Informações no console
			print("Modo debug LIGADO")
			print('O watcher se encontra desativado no momento, para ativá-lo entre com o comando cupid_load_modules("watcher")')
			print("-----------------")
			debugMode = true
		end
	end
	-- Inicia o loveframes
	loveframes = require("lib.LoveFrames")

	-- Adiciona os game states para uso futuro.
	addState(StartSequence, "StartSequence")

	-- Game state inicial
	enableState("StartSequence")
end

function love.update(dt)
	if (debugMode) then
		lovebird.update(dt)

		fpsGraph.updateFPS(fpsInfo, dt)
		fpsGraph.updateMem(memoryInfo, dt)
	end

	lovelyMoon.update(dt)
	loveframes.update(dt)
end

function love.draw()
	lovelyMoon.draw()

	if (debugMode) then
		love.graphics.setColor(255, 0, 0, 255)
		fpsGraph.drawGraphs({fpsInfo})
		love.graphics.setColor(10, 200, 255, 255)
		fpsGraph.drawGraphs({memoryInfo})
	end

	loveframes.draw()
end

function love.keypressed(key, unicode)
	lovelyMoon.keypressed(key, unicode)
	loveframes.keypressed(key, unicode)

end

function love.keyreleased(key, unicode)
	lovelyMoon.keyreleased(key, unicode)
	loveframes.keyreleased(key)
end

function love.mousepressed(x, y, button)
	lovelyMoon.mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	lovelyMoon.mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end

function love.textinput(text)
	loveframes.textinput(text)
end