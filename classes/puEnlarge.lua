class.puEnlarge(PowerUp)

puEnlarge.imageDir = "images/powerUps/puEnlarge.png"
puEnlarge.duration = 20
puEnlarge.enableSound = "sounds/enlarge.ogg"

function puEnlarge:onEnable()
	self.target.height = self.target.height + 60
end

function puEnlarge:onDisable()
	self.target.height = self.target.height - 60
end
