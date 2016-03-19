-- Criação da tabela
class.StartSequence()

LPaddle = {x = 50, y = love.graphics.getHeight()/2 - 45, speed = 0, speedMax = 150}

function StartSequence:load()
end

function StartSequence:close()
end

function StartSequence:enable()
end

function StartSequence:disable()
end

function StartSequence:update(dt)
	LPaddle.y = LPaddle.y + (LPaddle.speed*dt)
	if LPaddle.y < 0 then
		LPaddle.y = 0
		LPaddle.speed = 0
 	elseif LPaddle.y > (love.graphics.getHeight() - 90) then
		LPaddle.y = love.graphics.getHeight() - 90
		LPaddle.speed = 0
	end

	if LPaddle.speed > 0 then
		LPaddle.speed = LPaddle.speed - 3.125
	elseif LPaddle.speed < 0 then
		LPaddle.speed = LPaddle.speed + 3.125
	end
	print(LPaddle.speed)
end

function StartSequence:draw()
	love.graphics.rectangle("fill", LPaddle.x, LPaddle.y, 10, 90, 0, 0, 0 )
end

function StartSequence:keyhold(key, isrepeat)
	if key == "LPaddleUp" then
		if LPaddle.speed > (LPaddle.speedMax*-1) then
			LPaddle.speed = LPaddle.speed + -50
		end
	end

	if key == "LPaddleDown" then
		if LPaddle.speed < LPaddle.speedMax then
			LPaddle.speed = LPaddle.speed + 50
		end
	end
end

function StartSequence:keyreleased(key)
end
