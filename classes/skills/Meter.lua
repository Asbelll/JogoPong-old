class.Meter()

Meter.activationMode = "keyPress"
Meter.energyMax = 240
Meter.stocks = 1

function Meter:_init(id)
	self.energy = 0
	self.id = id
	self.gfx = {}
	self.gfx.bg = love.graphics.newImage("images/meters/" .. id .. "/bg.png")
	self.gfx.energy = love.graphics.newImage("images/meters/" .. id .. "/energy.png")
	self.gfx.division = love.graphics.newImage("images/meters/" .. id .. "/division.png")
	self.gfx.border = love.graphics.newImage("images/meters/" .. id .. "/border.png")
	self.gfx.aff = "images/meters/" .. id .. "/border.png"
end

function Meter:update(dt)
	if (self.energy < 250) then
		self.energy = self.energy + dt
	end
end

function Meter:draw()
	local imageX
	local imageY = love.graphics.getHeight()/2 - self.gfx.bg:getHeight()/2
	local parentPaddle = Paddle.getPaddleBySide(self.side)
	local energyQuad = love.graphics.newQuad(0, 0, self.gfx.energy:getWidth(), self.energy, self.gfx.energy:getDimensions())

	if (self.side == "L") then
		imageX = (50 - self.gfx.bg:getWidth())/2 -- Posição central entre o paddle e a extremidade da janela
	else
		imageX = love.graphics.getWidth() - ((50 - self.gfx.bg:getWidth())/2 + parentPaddle.width + parentPaddle.width) -- Posição central entre o paddle e a extremidade da janela
	end

	love.graphics.draw(self.gfx.bg, imageX, imageY)
	love.graphics.draw(self.gfx.energy, energyQuad, imageX, imageY)
	love.graphics.draw(self.gfx.division, imageX, imageY)
	love.graphics.draw(self.gfx.border, imageX, imageY)
end

-- Eventos --
function Meter:onEnable()
end

function Meter:onDisable()
end