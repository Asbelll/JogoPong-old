-- <Descrição do state>

-- Criação da tabela
class.StartSequence()

function StartSequence:load()
end

function StartSequence:close()
end

function StartSequence:enable()
	button = loveframes.Create("button")
	button:SetSize(100, 100):SetText("Asbels2Razz"):SetPos(330, 35)
end

function StartSequence:disable()
end

function StartSequence:update(dt)
end

function StartSequence:draw()
	love.graphics.print("Hello World", 400, 300)
	love.graphics.print("Compre a DLC 'Partiu ser op' para adquirir pontos de exclamação em seu jogo", 200, 350)
end

function StartSequence:buttonpressed(key, isrepeat)
end

function StartSequence:buttonreleased(key)
end

function StartSequence:mousepressed(x, y, button)
end

function StartSequence:mousereleased(x, y, button)
end