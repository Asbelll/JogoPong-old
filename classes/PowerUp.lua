class.PowerUp()

PowerUp.imageDir = ""
PowerUp.duration = 10

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
end

function PowerUp:draw()
	if (self.active) then
		love.graphics.draw(self.image, self.x, self.y)
	end
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

	if (ball.direct == 1) then
		self.target = LPaddle
	else
		self.target = RPaddle
	end

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

function PowerUp:onEnable()
end

function PowerUp:onDisable()
end
