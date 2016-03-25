class.PowerUpManager()

function PowerUpManager:_init()
	self.powerUpList = {puEnlarge(), puSanic(), puMagnet()}
	self.active = 0
	self.enabled = {}
end

function PowerUpManager:draw()
	if (self.active ~= 0) then
		-- Desenha os power ups ativos
		self.powerUpList[self.active]:draw()
	end
end

function PowerUpManager:update(dt)
	-- Realiza operações no power up ativo.
	if (self.active ~= 0) then
		if (not self.powerUpList[self.active].enabled) then
			-- Move os power ups ativos na tela.
			self.powerUpList[self.active]:move(dt)

			-- Verifica se houve colisão entre a bolinha e o power up.
			if (Hit:checkCollision(ball.hitbox, self.powerUpList[self.active].hitbox)) then
				self.powerUpList[self.active]:enable()
				self.enabled[#self.enabled] = self.active
				self.active = 0
			end
		end
	end

	-- Realiza operações em todos os power ups ativados pelos jogadores.
	for key, indicePowerUp in pairs(self.enabled) do
		-- Atualiza o tempo de duração.
		self.powerUpList[indicePowerUp]:updateDuration(dt)

		-- Se o tempo de um power up exceder, o mesmo será desativado.
		if (self.powerUpList[indicePowerUp].timeLeft <= 0) then
			self.powerUpList[indicePowerUp]:disable()
			self.enabled[key] = nil
		end

		-- Atualiza power ups ainda ativados.
		self.powerUpList[indicePowerUp]:update(dt)
	end
end

function PowerUpManager:newPowerUp()
		self.active = math.random(1, #self.powerUpList)
		self.powerUpList[self.active]:activate()
end
