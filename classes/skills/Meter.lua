class.Meter()

Meter.activationMode = "keyPress"
Meter.energyMax = 1000
Meter.stocks = 1
local gfx  = {}

function Meter:_init(id)
	self.energy = 0
	self.id = id
	gfx.bg = love.graphics.newImage("images/meters/" .. self.id .. "/bg.png")
	gfx.energy = love.graphics.newImage("images/meters/" .. self.id .. "/energy.png")
	gfx.division = love.graphics.newImage("images/meters/" .. self.id .. "/division.png")
	gfx.border = love.graphics.newImage("images/meters/" .. self.id .. "/border.png")
end

function Meter:update(dt)
end

function Meter:draw()
	local imageX
	local imageY = love.graphics.getHeight()/2 - gfx.bg:getHeight()/2
	local parentPaddle = Paddle.getPaddleBySide(self.side)
	local energyQuad = love.graphics.newQuad(0, 0, gfx.energy:getWidth(), self.energy, gfx.energy:getDimensions())

	if (self.side == "L") then
		imageX = (50 - gfx.bg:getWidth())/2 -- Posição central entre o paddle e a extremidade da janela
	else
		imageX = love.graphics.getWidth() - ((50 - gfx.bg:getWidth())/2 + parentPaddle.width + parentPaddle.width) -- Posição central entre o paddle e a extremidade da janela
	end

	love.graphics.draw(gfx.bg, imageX, imageY)
	love.graphics.draw(gfx.energy, energyQuad, imageX, imageY)
	love.graphics.draw(gfx.division, imageX, imageY)
	love.graphics.draw(gfx.border, imageX, imageY)
end

-- Eventos --
function Meter:onEnable()
end

function Meter:onDisable()
end