class.puShorten(PowerUp)

puShorten.imageDir = "images/powerUps/puShorten.png"
puShorten.duration = 15
puShorten.targetType = "reverse"
puShorten.enableSound = "sounds/shorten.ogg"

function puShorten:onEnable()
	self.target.height = self.target.height - 60
end

function puShorten:onDisable()
	self.target.height = self.target.height + 60
end
