class.PowerUp()

PowerUp.imageDir = "images/powerUp.png"

function PowerUp:_init(x, y)
	self.image = love.graphics.newImage(self.imageDir)
	self.x = 0
	self.y = 0
	self.height = 48
	self.width = 48
	self.enabled = false
end

function PowerUp:enable()
	self.enabled = true
	self.x = math.random(love.graphics.getWidth()/2 - 150, love.graphics.getWidth()/2 + 150)
	self.y = 0 - self.height
end

function PowerUp:draw()
	if (self.enabled) then
		love.graphics.draw(self.image, self.x, self.y)
	end
end

function PowerUp:move(dt)
	if (self.enabled) then
		self.y = self.y + (100*dt)

		if (self.y >= love.graphics.getHeight()) then
			self.enabled = false
		end
	end
end
