class.PowerUp()

PowerUp.imageDir = ""
PowerUp.duration = 10
PowerUp.targetType = ""
PowerUp.enableSound = ""

function PowerUp:_init()
	self.image = love.graphics.newImage(self.imageDir)
	self.x = 0
	self.y = 0
	self.height = 48
	self.width = 48
	self.hitbox = {}
	self.active = false
	self.enabled = false
	self.timeLeft = self.duration
	self.target = RPaddle
	self.font = love.graphics.newFont(20)
end

function PowerUp:drawActive()
	if (self.active) then
		love.graphics.draw(self.image, self.x, self.y)
	end
end

function PowerUp:drawTimeLeft(x, y)
	love.graphics.setFont(self.font)
	love.graphics.printf("["..math.floor(self.timeLeft).."]", x, y, 20, "left")
end

function PowerUp:move(dt)
	if (self.active) then
		self.y = self.y + (100*dt)
		self.hitbox = Hit:createHitbox(self.x, self.y, self.width, self.height)

		if (self.y >= love.graphics.getHeight()) then
			self.active = false
		end
	end
end

function PowerUp:activate()
	self.active = true
	self.x = math.random(love.graphics.getWidth()/2 - 150, love.graphics.getWidth()/2 + 150)
	self.y = 0 - self.height
end

function PowerUp:enable()
	self.enabled = true
	self.active = false

	if (self.targetType ~= "reverse") then
		if (ball.xDirect == 1) then
			self.target = LPaddle
		else
			self.target = RPaddle
		end
	else
		if (ball.xDirect == 1) then
			self.target = RPaddle
		else
			self.target = LPaddle
		end
	end

	local enableSound = love.audio.newSource(self.enableSound)
	enableSound:play()
	self:onEnable()
end

function PowerUp:disable()
	self.enabled = false
	self.timeLeft = self.duration

	self:onDisable()
end

function PowerUp:updateDuration(dt)
	self.timeLeft = self.timeLeft - dt
end

function PowerUp:update(dt)
end

function PowerUp:draw()
end

function PowerUp:onEnable()
end

function PowerUp:onDisable()
end
