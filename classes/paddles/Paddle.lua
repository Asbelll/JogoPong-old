class.Paddle()

function Paddle:_init(x, id, color)
	self.x = x
	self.y = love.graphics.getHeight()/2 - 45
	self.speed = 0
	self.speedMax = 1500
	self.accel = 9
	self.width = 10
	self.height = 90
	self.id = id -- Valor identificador do paddle.
	self.color = color
	self.blendMode = "alpha"
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


function Paddle:draw(dt)
	-- Armazena cores e BlendMode atuais.
	local rD, gD, bD, aD = love.graphics.getColor()
	local blendD = love.graphics.getBlendMode()

	-- Aplica as cores e BlendMode do objeto.
	love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
	love.graphics.setBlendMode(self.blendMode)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 0, 0, 0 )

	-- Retorna a cor e BlendMode aos valores anteriores.
	love.graphics.setColor(rD, gD, bD, aD)
	love.graphics.setBlendMode(blendD)
end