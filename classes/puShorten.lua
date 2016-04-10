class.puShorten(PowerUp)

puShorten.imageDir = "images/powerUps/puShorten.png"
puShorten.duration = 15
puShorten.targetType = "reverse"
puShorten.enableSounds = {"sounds/shorten.ogg"}

function puShorten:onEnable()
	self.target.height = self.target.height - self.target.pHeight/3 * 2 -- Paddle perde 2/3 de sua altura base.
end

function puShorten:onDisable()
	self.target.height = self.target.height + self.target.pHeight/3 * 2 -- Paddle ganha 2/3 de sua altura base.
end
