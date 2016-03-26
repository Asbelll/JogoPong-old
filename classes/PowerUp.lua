class.PowerUp()

-- Propriedades que as classes filhas podem definir antes do _init.
PowerUp.imageDir = ""
PowerUp.duration = 10
PowerUp.targetType = ""
PowerUp.enableSounds = {}

function PowerUp:_init()
	self.image = love.graphics.newImage(self.imageDir)
	self.x = 0
	self.y = 0
	self.height = 48
	self.width = 48
	self.hitbox = {}
	self.active = false -- Power up está active quando o PowerUpManager faz com que ele caia na tela.
	self.enabled = false -- Power up está enabled quando a bolinha toca nele e seu efeito é habilitado.
	self.timeLeft = self.duration
	self.target = RPaddle
	self.font = love.graphics.newFont(20)
end

-- Draw chamado quando o power up está ativo.
function PowerUp:drawActive()
	if (self.active) then
		love.graphics.draw(self.image, self.x, self.y)
	end
end

function PowerUp:drawTimeLeft(x, y)
	love.graphics.setFont(self.font)
	love.graphics.printf("["..math.floor(self.timeLeft).."]", x, y, 20, "left")
end

function PowerUp:move(dt)
	if (self.active) then
		-- Move o power up para baixo em uma velocidade constante até que ele saia da tela.
		self.y = self.y + (100*dt)
		self.hitbox = Hit:createHitbox(self.x, self.y, self.width, self.height)

		if (self.y >= love.graphics.getHeight()) then
			self.active = false
		end
	end
end

-- Chamado quando o power up é criado.
function PowerUp:activate()
	self.active = true
	self.x = math.random(love.graphics.getWidth()/2 - 150, love.graphics.getWidth()/2 + 150) -- X aleatório.
	self.y = 0 - self.height -- Y fora da tela.
end

-- Chamado quando a bolinha habilita o power up.
function PowerUp:enable()
	self.enabled = true
	self.active = false


	-- Define que é o alvo do power up.
	if (self.targetType ~= "reverse") then
		if (ball.xDirect == 1) then
			self.target = LPaddle
		else
			self.target = RPaddle
		end
	else
		if (ball.xDirect == 1) then
			self.target = RPaddle
		else
			self.target = LPaddle
		end
	end

	-- Reproduz seu som de ativação.
	local enableSound = love.audio.newSource(self.enableSounds[math.random(1, #self.enableSounds)])
	enableSound:play()
	self:onEnable()
end

-- Desabilita efeito do power up.
function PowerUp:disable()
	self.enabled = false
	self.timeLeft = self.duration

	self:onDisable()
end

function PowerUp:updateDuration(dt)
	self.timeLeft = self.timeLeft - dt
end

-- Chamados quando o power up está enabled --
function PowerUp:update(dt)
end

function PowerUp:draw()
end

-- Eventos --
function PowerUp:onEnable()
end

function PowerUp:onDisable()
end
