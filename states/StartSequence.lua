-- Criação da tabela
class.StartSequence()

function StartSequence:load()
	math.randomseed(os.time())
	score = Score()

	powerUpManager = PowerUpManager()
	powerUpManager:newPowerUp()

	music = love.audio.newSource("pallid underbrush.mp3")
	music:setVolume(0.4)
	music:setLooping(true)
	music:play()

	wallHitSound = love.audio.newSource("sounds/wallHit.ogg")
	wallHitSound:setVolume(0.6)

	paddleHitSound = love.audio.newSource("sounds/paddleHit.ogg")
	paddleHitSound:setVolume(0.6)
	-- Inicia os paddles
	LPaddle = Paddle(50)
	RPaddle = Paddle(love.graphics.getWidth() - 50)

	-- Inicia o ball com posY aleatório
	ball = Ball(math.random(-155,155))

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
	score:point(ball.x)
	powerUpManager:move(dt)

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
	-- Desenha linha central.
	love.graphics.rectangle("fill", love.graphics.getWidth()/ 2 - 2.5, 0, 5, love.graphics.getHeight(), 0, 0, 0 )

	-- Desenha os objetos do jogo.
	LPaddle:draw()
	RPaddle:draw()
	ball:draw()
	score:draw()
	powerUpManager:draw()
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
		ball:_init(math.random(-155,155))
		score:_init()
	end
end

function StartSequence:keyreleased(key)
end
