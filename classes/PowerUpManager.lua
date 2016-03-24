class.PowerUpManager()

function PowerUpManager:_init()
	self.powerUpList = {PowerUp(), puEnlarge()}
	self.enabled = 2
end

function PowerUpManager:draw()
	self.powerUpList[self.enabled]:draw()
end

function PowerUpManager:move(dt)
	self.powerUpList[self.enabled]:move(dt)
end

function PowerUpManager:newPowerUp()
	self.enabled = math.random(0, table.getn(self.powerUpList))
	self.powerUpList[self.enabled]:enable()
end
