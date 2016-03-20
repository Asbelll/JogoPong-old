class.Ball()

--[[
[22:53:22] Matheus: Yf = (velocidadeDoPaddle + [PP] + Y)
[22:53:43 | Edited 23:00:08] Matheus: Xf = X - (|Yf| - |Y|)
[22:54:34] Matheus: Limitar velocidade mínima de X
]]--

function Ball:_init(x)
	self.x = x
	self.y = love.graphics.getHeight()/2 - 45
	self.speed = 0
	self.radius = 10
end
