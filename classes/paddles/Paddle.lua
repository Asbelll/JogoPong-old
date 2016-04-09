class.Paddle()

-- Propriedades padrões
Paddle.id = "Paddle" -- Valor identificador do paddle.
Paddle.nome = "--"
Paddle.height = 90
Paddle.accel = 9
Paddle.speedMax = 1500
Paddle.strength = 0
Paddle.friction = 4.5
Paddle.skill = Skill()
Paddle.energyMeter = Meter()
Paddle.color = {r = 255, g = 255, b = 255, a = 255}
Paddle.blendMode = "alpha"

function Paddle:_init(x, side)
	self.x = x
	self.y = love.graphics.getHeight()/2 - self.height/2
	self.side = side
	self.width = 10
	self.speed = 0
	self.sound = {}
	self.sound.hit = self:loadSounds()
end

function Paddle:move(dt)
	self.y = self.y + (self.speed*dt)
	if self.y < 0 then
		self.y = 0
		self.speed = 0
 	elseif self.y > (love.graphics.getHeight() - self.height) then
		self.y = love.graphics.getHeight() - self.height
		self.speed = 0
	end
end

function Paddle:update(dt)

end

function Paddle:draw(dt)
	-- Armazena cores e BlendMode atuais.
	local rD, gD, bD, aD = love.graphics.getColor()
	local blendD = love.graphics.getBlendMode()

	-- Aplica as cores e BlendMode do objeto.
	love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
	love.graphics.setBlendMode(self.blendMode)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 0, 0, 0 )

	-- Retorna a cor e BlendMode aos valores anteriores.
	love.graphics.setColor(rD, gD, bD, aD)
	love.graphics.setBlendMode(blendD)
end

function Paddle:loadSounds()
	local sounds = {} -- Lista de sons.
	local dir = "sounds/paddleHit/" -- Diretório dos sons de hits.
	local filePrefix = self.id -- Prefixo dos arquivos de aúdio.
	local fileDir = dir .. filePrefix .. "_hit.mp3" -- Diretório do arquivo a ser verificado.
	local file = io.open("../../" .. fileDir)

	-- Usa o prefixo padrão caso nenhum arquivo seja encontrado utilizando o id do paddle.
	if (file == nil) then
		filePrefix = "default"
	end

	-- Adiciona o audio sem numeração à lista.
	sounds[#sounds + 1] = love.audio.newSource(dir .. filePrefix .. "_hit.mp3")
	sounds[#sounds]:setVolume(0.6)

	-- Passa a procurar por arquivos com numeração.
	local fileNumber = 2
	fileDir = dir .. filePrefix .. "_hit" .. fileNumber .. ".mp3"

	file = io.open("../../" .. fileDir)
	-- Enquanto existir arquivos com os nomes utilizados, a lista de áudios será atualizada.
	while (file ~= nil) do
		-- Adiciona áudio com numeração à lista.
		sounds[#sounds + 1] = love.audio.newSource(fileDir)
		sounds[#sounds]:setVolume(0.6)

		fileNumber = fileNumber + 1
		fileDir = dir .. filePrefix .. "_hit" .. fileNumber .. ".mp3"
		file = io.open("../../" .. fileDir)
	end

	return sounds
end

function Paddle:playHitSound()
	local soundKey = math.random(1, #self.sound.hit)
	self.sound.hit[soundKey]:play()
	pretty.dump(self.sound.hit)
end
