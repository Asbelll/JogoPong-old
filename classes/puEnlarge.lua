class.puEnlarge(PowerUp)

puEnlarge.imageDir = "images/powerUps/puEnlarge.png"
puEnlarge.duration = 20

function puEnlarge:onEnable()
	self.target.height = 150
end

function puEnlarge:onDisable()
	self.target.height = 90
end
