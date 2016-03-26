-- State inicial do jogo
class.StartSequence()

function StartSequence:load()
end

function StartSequence:close()
end

function StartSequence:enable()
end

function StartSequence:disable()
end

function StartSequence:draw()
	love.graphics.printf("Pressione R para iniciar um novo jogo", love.graphics.getWidth()/2 - 200, love.graphics.getHeight()/2, 400, "center")
end

function StartSequence:keypressed(key)
	if key == "Restart" then
		-- Game state inicial.
		enableState("Game")
		disableState("StartSequence")
	end
end
