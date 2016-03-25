class.puMessyControls(PowerUp)

puMessyControls.imageDir = "images/powerUps/puMessyControls.png"
puMessyControls.duration = 10
puMessyControls.targetType = "reverse"
puMessyControls.enableSound = "sounds/messycontrols.ogg"

local keyUp, keyDown
local target

function puMessyControls:onEnable()
	target = self.target.id

	for key, command in pairs(commandList) do
		if (command == target.."PaddleDown") then
			keyDown = key
		end

		if (command == target.."PaddleUp") then
			keyUp = key
		end
	end

	commandList[keyDown] = target.."PaddleUp"
	commandList[keyUp] = target.."PaddleDown"
end

function puMessyControls:onDisable()
	commandList[keyDown] = target.."PaddleDown"
	commandList[keyUp] = target.."PaddleUp"
end
