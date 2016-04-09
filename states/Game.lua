-- State contendo procedimentos realizados durante o gameplay.
class.Game()

function Game:load()
	background = love.graphics.newImage("back8.png") -- Vulgo whale
	-- Carrega classes necessárias.
	-- Energy Meters --
	require("classes/skills/Meter")
	require("classes/skills/CoolGirlMeter")

	-- Skill --
	require("classes/skills/Skill")
	require("classes/skills/CoolGirlSkill")

	-- Paddles --
	require("classes/paddles/Paddle")
	require("classes/paddles/MrBig")
	require("classes/paddles/CoolGirl")
	require("classes/paddles/Leet")
	require("classes/paddles/Isa")
	require("classes/paddles/Kitten")
	require("classes/paddles/Chrystian")
	require("classes/paddles/Uber")
	require("classes/paddles/HackedBig")

	-- Outros --
	require("classes/Ball")
	require("classes/Hit")
	require("classes/Score")

	-- Power ups --
	require("classes/PowerUp")
	require("classes/puEnlarge")
	require("classes/puShorten")
	require("classes/puSanic")
	require("classes/puMagnet")
	require("classes/puReverseControls")
	require("classes/PowerUpManager")

	-- Carrega arquivos.
	music = love.audio.newSource("music/pallid underbrush.mp3")
	wallHitSound = love.audio.newSource("sounds/wallHit.ogg")
end

function Game:close()
	-- Remove arquivos da memória.
	music, wallHitSound, powerUpManager, LPaddle, RPaddle, ball, friction, nextPowerUp = nil
end

function Game:enable()
	-- Define valores iniciais quando o state for ativado.
	math.randomseed(os.time())

	score = Score()
	powerUpManager = PowerUpManager()

	-- Inicia o ball branco com posY aleatório.
	ball = Ball(math.random(-155,155), {r = 255, g = 255, b = 255, a = 255})

	-- Inicia os paddles.
	LPaddle = Leet(50, "L")
	RPaddle = Isa(love.graphics.getWidth() - 50, "R")

	music:setVolume(0.4)
	music:setLooping(true)
	music:play()

	wallHitSound:setVolume(0.6)

	nextPowerUp = 15 -- Tempo inicial para chamada de um power up.
end

function Game:disable()
end

function Game:update(dt)
	-- Atualiza hitboxes dos paddles e da bolinha.
	LPaddle.hitbox = Hit:createHitbox(LPaddle.x, LPaddle.y, LPaddle.width, LPaddle.height)
	RPaddle.hitbox = Hit:createHitbox(RPaddle.x, RPaddle.y, RPaddle.width, RPaddle.height)
	ball.hitbox = Hit:createHitbox(ball.x - ball.radius, ball.y - ball.radius, ball.radius*2, ball.radius*2)

	LPaddle:move(dt)
	RPaddle:move(dt)
	ball:move(dt)
	score:point(ball.x)
	powerUpManager:update(dt)

	-- Atualiza tempo para chamar o próximo power up.
	if (nextPowerUp <= 0) then
		nextPowerUp = 30
		powerUpManager:newPowerUp()
	else
		nextPowerUp = nextPowerUp - dt
	end

	-- Força de atrito agindo na velocidade dos paddles.
	if LPaddle.speed > 0 then
		LPaddle.speed = LPaddle.speed - LPaddle.friction
	elseif LPaddle.speed < 0 then
		LPaddle.speed = LPaddle.speed + LPaddle.friction
	end

	if RPaddle.speed > 0 then
		RPaddle.speed = RPaddle.speed - RPaddle.friction
	elseif RPaddle.speed < 0 then
		RPaddle.speed = RPaddle.speed + RPaddle.friction
	end

	-- Utiliza Info1 e Info2 para mostrar X e Y da bolinha.
	if (isStateEnabled('DebugMode')) then
		fpsGraph.updateGraph(Info1, ball.speedX, "velocidade X: "..ball.speedX, dt)
		fpsGraph.updateGraph(Info2, math.abs(ball.speedY), "velocidade Y: "..ball.speedY, dt)
	end
end

function Game:draw()
	love.graphics.draw(background, 0, 0, 0, 1, 1)
	-- Desenha linha central.
	love.graphics.rectangle("fill", love.graphics.getWidth()/ 2 - 2.5, 0, 5, love.graphics.getHeight(), 0, 0, 0 )

	-- Desenha os objetos do jogo.
	LPaddle:draw()
	RPaddle:draw()
	ball:draw()
	score:draw()
	powerUpManager:draw()
end

function Game:keyhold(key)
	-- Verifica teclas seguradas.
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
end

function Game:keypressed(key)
	-- Verifica teclas pressionadas.
	if key == "Restart" then
		-- Reinicia State.
		disableState("Game")
		enableState("Game")
	end

	if key == "newPowerUp" then
		powerUpManager:newPowerUp()
	end
end
