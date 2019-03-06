-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
------------background
-------------------------------
display.setDefault( "background", 255, 255, 0 )
--------------------------------------------------
---- enter diameter text field and "Enter Diameter Here" text
-------------------------------
local diameterTextfield = native.newTextField( display.contentCenterX, display.contentCenterY + 150, 250, 50 )
diameterTextfield.id = "diameter textField"

local enterDiameter = display.newText( "Enter Diameter Here ", display.contentCenterX, display.contentCenterY + 100, native.systemFont, 20)
enterDiameter.id = "area"
enterDiameter:setFillColor( 255, 0, 255)


----------------------------------------------------------------------
------------ Area and Circumference display
-----------------------------
local areaText = display.newText( "Area", display.contentCenterX, display.contentCenterY - 130, native.systemFont, 20)
areaText.id = "area text"
areaText:setFillColor( 255, 0, 0)

local circumferenceText = display.newText( "Circumference", display.contentCenterX, display.contentCenterY - 75, native.systemFont, 20)
circumferenceText.id = "circumference text"
circumferenceText:setFillColor( 255, 0, 0)
-------------------------
-- images
---- Calculate button and circle 
-----------------------------------------------------------
local calculateButton = display.newImageRect( "assets/calculate.png", 200, 100 )
calculateButton.x = 160
calculateButton.y = 475
calculateButton.id = "calculate button"

local circle = display.newImageRect( "assets/circle.png", 350, 350 )
circle.x = 160
circle.y = 130
circle.id = "circle"

-----------------
-----round
------------------------
function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

------------------------------
--------------the math--
-----------------------------------



local function calculateButtonTouch( event )

	local diameter
	local area
	local circumference
	local radius

	diameter = diameterTextfield.text
	radius = diameter/2
	area = (radius*radius)*math.pi
	area = round(area,2)
	circumference = 2*math.pi*radius
	circumference = round(circumference,2)
	----------print area and circumference
	areaText.text = "Area:" .. area
	circumferenceText.text = "Circumference:" .. circumference 

	return true
end

calculateButton:addEventListener( "touch", calculateButtonTouch)

