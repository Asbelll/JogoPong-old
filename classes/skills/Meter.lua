class.Meter()

Meter.activationMode = "keyPress"
Meter.energyMax = 230
Meter.stocks = 1
Meter.minCharge = 2 -- Valor mínimo de charge no BPContact.

function Meter:_init(id)
	self.energy = 0
	self.id = id
	self.gfx = {}
	self.fullStocks = 0
	self.gfx.bg = love.graphics.newImage("images/meters/" .. id .. "/bg.png")
	self.gfx.energy = love.graphics.newImage("images/meters/" .. id .. "/energy.png")
	self.gfx.division = love.graphics.newImage("images/meters/" .. id .. "/division.png")
	self.gfx.border = love.graphics.newImage("images/meters/" .. id .. "/border.png")
end

function Meter:update(dt)
end

function Meter:draw()
	local imageX
	local imageY = love.graphics.getHeight()/2 - self.gfx.bg:getHeight()/2
	local parentPaddle = Paddle.getPaddleBySide(self.side)
	local energyQuad = love.graphics.newQuad(0, 0, self.gfx.energy:getWidth(), self.energy, self.gfx.energy:getDimensions())

	if (self.side == "L") then
		imageX = (50 - self.gfx.bg:getWidth())/2 -- Posição central entre o paddle e a extremidade da janela (eixo X)
	else
		imageX = love.graphics.getWidth() - ((50 - self.gfx.bg:getWidth())/2 + parentPaddle.width + parentPaddle.width) -- Posição central entre o paddle e a extremidade da janela
	end

	love.graphics.draw(self.gfx.bg, imageX, imageY)
	love.graphics.draw(self.gfx.energy, energyQuad, imageX, imageY)
	love.graphics.draw(self.gfx.division, imageX, imageY)
	love.graphics.draw(self.gfx.border, imageX, imageY)
end

function Meter:charge(value)
	if (self.energy < self.energyMax) then
		-- Verifica se a adição atingirá o máximo.
		if (self.energy + value >= self.energyMax) then
			self.energy = self.energyMax
			self:onMaxCharge()
		else
			self.energy = self.energy + value
		end

		-- Verifica se algum stock foi enchido por inteiro.
		if (math.floor(self.energy / (self.energyMax / self.stocks)) > self.fullStocks) then
			self.fullStocks = math.floor(self.energy / (self.energyMax / self.stocks))
			self:onStockCharge()
		end
	end
end

-- Eventos --
function Meter:onEnable()
end

function Meter:onDisable()
end

function Meter:onMaxCharge()
	local paddle = Paddle.getPaddleBySide(self.side)
	paddle.color = {r = 0, g = 255, b = 255, a = 255}
end

function Meter:onStockCharge()
end

function Meter:onBPContact(speed, speedX, speedY, speedF, speedXF, speedYF)
	local chargeVal = self.minCharge

	-- Se houver um ganho na velocidade, esse valor será adicionado à energia.
	if (speedF - speed > 0) then
		chargeVal = chargeVal + (speedF - speed) / 10
	end

	self:charge(chargeVal)
end
