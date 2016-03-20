-- Criação da tabela
class.StartSequence()

function StartSequence:load()
	math.randomseed(os.time())
	-- Inicia os paddles
	LPaddle = Paddle(50)
	RPaddle = Paddle(love.graphics.getWidth() - 50)

	-- Inicia o ball com posY aleatório
	ball = Ball(math.random(155))

	friction = 4.5
end

function StartSequence:close()
end

function StartSequence:enable()
end

function StartSequence:disable()
end

function StartSequence:update(dt)
	-- Atualiza hitboxes dos paddles e da bolinha
	LPaddle.hitbox = Hit:createHitbox(LPaddle.x, LPaddle.y, LPaddle.width, LPaddle.height)
	RPaddle.hitbox = Hit:createHitbox(RPaddle.x, RPaddle.y, RPaddle.width, RPaddle.height)
	ball.hitbox = Hit:createHitbox(ball.x - ball.radius, ball.y - ball.radius, ball.radius*2, ball.radius*2)

	ball = Hit:wallCollision(ball)
	ball = Hit:paddleCollision(ball, LPaddle)
	ball = Hit:paddleCollision(ball, RPaddle)

	LPaddle:mover(dt)
	RPaddle:mover(dt)
	ball:mover(dt)

	-- Força de atrito agindo na velocidade dos paddles
	if LPaddle.speed > 0 then
		LPaddle.speed = LPaddle.speed - friction
	elseif LPaddle.speed < 0 then
		LPaddle.speed = LPaddle.speed + friction
	end

	if RPaddle.speed > 0 then
		RPaddle.speed = RPaddle.speed - friction
	elseif RPaddle.speed < 0 then
		RPaddle.speed = RPaddle.speed + friction
	end
end

function StartSequence:draw()
	love.graphics.rectangle("fill", LPaddle.x, LPaddle.y, LPaddle.width, LPaddle.height, 0, 0, 0 )
	love.graphics.rectangle("fill", RPaddle.x, RPaddle.y, RPaddle.width, RPaddle.height, 0, 0, 0 )
	love.graphics.circle("fill", ball.x, ball.y, ball.radius, 4)
end

function StartSequence:keyhold(key, isrepeat)
	if key == "LPaddleUp" then
		if LPaddle.speed > (LPaddle.speedMax*-1) then
			LPaddle.speed = LPaddle.speed + -LPaddle.accel
		end
	end

	if key == "LPaddleDown" then
		if LPaddle.speed < LPaddle.speedMax then
			LPaddle.speed = LPaddle.speed + LPaddle.accel
		end
	end

	if key == "RPaddleUp" then
		if RPaddle.speed > (RPaddle.speedMax*-1) then
			RPaddle.speed = RPaddle.speed + -RPaddle.accel
		end
	end

	if key == "RPaddleDown" then
		if RPaddle.speed < RPaddle.speedMax then
			RPaddle.speed = RPaddle.speed + RPaddle.accel
		end
	end

	if key == "Restart" then
		ball:_init(love.graphics.getHeight()/2 - 20)
	end
end

function StartSequence:keyreleased(key)
end
