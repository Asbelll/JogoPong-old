class.puEnlarge(PowerUp)

puEnlarge.imageDir = "images/puEnlarge.png"

function puEnlarge:onEnable()
	self.target.height = 150
end

function puEnlarge:onDisable()
	self.target.height = 90
end
