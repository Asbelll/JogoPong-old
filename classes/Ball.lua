class.Ball()

function Ball:_init(speedY, color)
	self.x = love.graphics.getWidth()/2
	self.y = love.graphics.getHeight()/2
	self.speedX = 250
	self.speedY = speedY
	self.radius = 10
	self.xDirect = math.random(2)
	self.color = color
	self.blendMode = "alpha"
end

function Ball:mover(dt)
	-- Move a bolinha nos exos X (de acordo com o xDirect) e Y.
	if self.xDirect == 1 then
		self.x = self.x + (self.speedX*dt)
	elseif self.xDirect == 2 then
		self.x = self.x - (self.speedX*dt)
	end

	self.y = self.y + (self.speedY*dt)

	-- Calcula em radianos a orientação da bolinha.
	local deltaX = (self.speedX)
	local deltaY = (self.speedY) * -1

	if (self.xDirect == 2) then
		deltaX = deltaX * -1
	end

	-- Atualiza orientação do objeto.
	self.angle = math.atan2(deltaY, deltaX)
end

function Ball:draw()
	-- Armazena cores e BlendMode atuais.
	local rD, gD, bD, aD = love.graphics.getColor()
	local blendD = love.graphics.getBlendMode()

	-- Aplica as cores e BlendMode do objeto.
	love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
	love.graphics.setBlendMode(self.blendMode)
	love.graphics.circle("fill", self.x, self.y, self.radius, 4)

	-- Retorna a cor e BlendMode aos valores anteriores.
	love.graphics.setColor(rD, gD, bD, aD)
	love.graphics.setBlendMode(blendD)
end
