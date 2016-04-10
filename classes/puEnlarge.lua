class.puEnlarge(PowerUp)

puEnlarge.imageDir = "images/powerUps/puEnlarge.png"
puEnlarge.duration = 20
puEnlarge.enableSounds = {"sounds/enlarge.ogg"}

function puEnlarge:onEnable()
	self.target.height = self.target.height + self.target.pHeight/3 * 2 -- Paddle ganha 2/3 de sua altura base.
end

function puEnlarge:onDisable()
	self.target.height = self.target.height - self.target.pHeight/3 * 2 -- Paddle perde 2/3 de sua altura base.
end
