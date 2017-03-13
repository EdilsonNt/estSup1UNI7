local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

-- Define reference points locations anchor ponts
local TOP_REF = 0
local BOTTOM_REF = 1
local LEFT_REF = 0
local RIGHT_REF = 1
local CENTER_REF = 0.5

display.setStatusBar( display.HiddenStatusBar )

local baseline = 280

-- The sky as background
local sky = display.newImage( "sky.jpg", centerX, centerY )
sky.anchorX = LEFT_REF
sky.x = 0
sky.y = baseline - 100
local sky2 = display.newImage( "sky.jpg", centerX, centerY )
sky2.anchorX = LEFT_REF
sky2.x = 480
sky2.y = baseline - 100


-- A sprite sheet with a green dude
local sheetInfo2 = require("robot")
local sheet2 = graphics.newImageSheet( "robot.png", sheetInfo2:getSheet() )

-- play 15 frames every 500 ms
local instance2 = display.newSprite( sheet2, { name="man", start=1, count=9, time=600 } )
instance2.x = display.contentWidth /4 - 50
instance2.y = baseline - 40
instance2:scale( 0.125, 0.125 )
instance2:play()


local floor = display.newImage( "floor.png" )
floor.anchorX = LEFT_REF
floor.x = 0
floor.y = baseline
local floor2 = display.newImage( "floor.png" )
floor2.anchorX = LEFT_REF
floor2.x = 480
floor2.y = baseline


local tPrevious = system.getTimer()
local function move(event)
	local tDelta = event.time - tPrevious
	tPrevious = event.time

	local xOffset = ( 0.2 * tDelta )

	sky.x = floor.x - xOffset
	sky2.x = floor2.x - xOffset
	floor.x = floor.x - xOffset
	floor2.x = floor2.x - xOffset
	
	if (floor.x + floor.contentWidth) < 0 then
		floor:translate( 480 * 2, 0)
	end
	if (floor2.x + floor2.contentWidth) < 0 then
		floor2:translate( 480 * 2, 0)
	end
	if (sky.x + sky.contentWidth) < 0 then
		sky:translate( 480 * 2, 0)
	end
	if (sky2.x + sky2.contentWidth) < 0 then
		sky2:translate( 480 * 2, 0)
	end
	
end

Runtime:addEventListener( "enterFrame", move );