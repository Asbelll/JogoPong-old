class.MrBigMeter(Meter)

MrBigMeter.stocks = 2

function MrBigMeter:update(dt)
	self:charge(dt*4)
end


-- Eventos --
function MrBigMeter:onBPContact()
end
