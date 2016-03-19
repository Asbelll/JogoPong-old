class.Paddle()

function Paddle:_init(x)
	self.x = x
	self.y = love.graphics.getHeight()/2 - 45
	self.speed = 0
	self.speedMax = 150
	self.accel = 3.125
	self.width = 10
	self.height = 90
end

function Paddle:mover(dt)
	self.y = self.y + (self.speed*dt)
	if self.y < 0 then
		self.y = 0
		self.speed = 0
 	elseif self.y > (love.graphics.getHeight() - self.height) then
		self.y = love.graphics.getHeight() - self.height
		self.speed = 0
	end
end
