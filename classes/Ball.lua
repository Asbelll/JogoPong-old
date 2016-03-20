class.Ball()

--[[
[22:53:22] Matheus: Yf = (velocidadeDoPaddle + [PP] + Y)
[22:53:43 | Edited 23:00:08] Matheus: Xf = X - (|Yf| - |Y|)
[22:54:34] Matheus: Limitar velocidade mínima de X
]]--

math.randomseed(os.time())

function Ball:_init(y)
	self.x = love.graphics.getWidth()/2
	self.y = y
	self.speedX = 250
	self.speedY = 0
	self.radius = 10
	self.direct = math.random(2)
end

function Ball:mover(dt)
	if self.direct == 1 then
		self.x = self.x + (self.speedX*dt)
	elseif self.direct == 2 then
		self.x = self.x - (self.speedX*dt)
	end

		self.y = self.y + (self.speedY*dt)
end
