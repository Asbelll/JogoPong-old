class.Meter()

Meter.activationMode = "keyPress"
Meter.energyMax = 1000
Meter.stocks = 1

function Meter:_init()
	self.energy = 0
end

function Meter:update(dt)
end

function Meter:draw()
end

-- Eventos --
function Meter:onEnable()
end

function Meter:onDisable()
end