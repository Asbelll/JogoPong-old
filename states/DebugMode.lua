-- <Descrição do state>

-- Criação da classe
class.DebugMode()

function DebugMode:load()
	-- Importa bibliotecas de debug
	lovebird = require("lib/lovebird")
	fpsGraph = require "lib/FPSGraph"

	-- Cria gráficos informativos
	fpsInfo = fpsGraph.createGraph()
	memoryInfo = fpsGraph.createGraph(0, 30)

	-- Inicia módulos de debug do Cupid
	cupid_load_modules("console")

	-- Informações no console
	print("Modo debug LIGADO")
	print('O watcher se encontra desativado no momento, para ativá-lo entre com o comando cupid_load_modules("watcher")')
	print("-----------------")
end

function DebugMode:close()
end

function DebugMode:enable()
end

function DebugMode:disable()
end

function DebugMode:update(dt)
	lovebird.update(dt)

	fpsGraph.updateFPS(fpsInfo, dt)
	fpsGraph.updateMem(memoryInfo, dt)
end

function DebugMode:draw()
	love.graphics.setColor(255, 0, 0, 255)
	fpsGraph.drawGraphs({fpsInfo})
	love.graphics.setColor(10, 200, 255, 255)
	fpsGraph.drawGraphs({memoryInfo})
end

function DebugMode:keypressed(key, unicode)
end

function DebugMode:keyreleased(key, unicode)
end

function DebugMode:mousepressed(x, y, button)
end

function DebugMode:mousereleased(x, y, button)
end