class.puSanic(PowerUp)

puSanic.imageDir = "images/powerUps/puSanic.png"
puSanic.duration = 5
puSanic.enableSounds = {"sounds/sanic.ogg", "sounds/sanic2.wav", "sounds/sanic3.wav", "sounds/sanic4.wav"}

local emitter, pImg, pX, pY, blendMode

function puSanic:onEnable()
	ball.speedY = ball.speedY * 2
	ball.speedX = ball.speedX * 2


	tex = love.graphics.newImage('images/particles/default.png')

	emitter = love.graphics.newParticleSystem(tex, 250)
	emitter:setDirection(0)
	emitter:setAreaSpread("uniform",5,5)
	emitter:setEmissionRate(250)
	emitter:setEmitterLifetime(-1)
	emitter:setLinearAcceleration(-10,-10,10,10)
	emitter:setParticleLifetime(0,1)
	emitter:setSpeed(-400,-400)
	emitter:setSpread(0.4)
	emitter:setSizes(10)
	emitter:setColors(255,100,0,255, 255,0,0,255)

	ball.color = {
		r = 255,
		g = 100,
		b = 0,
		a = 255
	}
end

function puSanic:onDisable()
	ball.color = {
		r = 255,
		g = 255,
		b = 255,
		a = 255
	}
end

function puSanic:update(dt)
	ball.speedY = ball.speedY + self.timeLeft/2
	ball.speedX = ball.speedX + self.timeLeft/2

	blendMode = love.graphics.getBlendMode()
	emitter:setDirection(ball.angle * -1)
	emitter:setPosition(ball.x, ball.y)
	emitter:setEmissionRate(self.timeLeft * 50)
	emitter:update(dt)
end

function puSanic:draw()
	love.graphics.setBlendMode("additive")
	love.graphics.draw(emitter, 0, 0)
	love.graphics.setBlendMode(blendMode)
end