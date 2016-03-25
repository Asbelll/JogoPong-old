class.puShorten(PowerUp)

puShorten.imageDir = "images/powerUps/puShorten.png"
puShorten.duration = 15
puShorten.targetType = "reverse"

function puShorten:onEnable()
	self.target.height = 30
end

function puShorten:onDisable()
	self.target.height = 90
end
