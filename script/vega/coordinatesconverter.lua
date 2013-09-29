require "vegatable"
require "transform"
require "matrix"
require "coordinates"

--- Table with functions to convert vectors from one space to another.
vega.spaceconverter = {}

--- Returns where the layer vector is located on display. If the vector is out
-- of the display, it returns negative values or values greater than the display size.
-- @param vector table with x and y fields.
-- @param layer the layer where the vector is.
-- @param display the display.
-- @returns a table created with the function vega.coordinates, where the x and y fields
-- are the pixels of the screen, and relativex and relativey are relative to the screen
-- size.
function vega.spaceconverter.fromlayertodisplay(vector, layer, display)
	local viewmatrix = vega.transform.getviewmatrix(layer)
	local newvector = vega.transform.transformpoint(vector, viewmatrix)
	newvector.x = (display.size.x * newvector.x) / layer.camera.size.x
	newvector.y = (display.size.y * newvector.y) / layer.camera.size.y
	return vega.coordinates(newvector, function() return display.size end)
end

--- Returns where the display vector is located in the given layer.
-- @param vector table with x and y fields. x and y are the pixel coordinates of the
-- display, can be negative values or values greater than the display size if the vector
-- is out of the display.
-- @param display the display.
-- @param layer the layer to calculate.
-- @returns a table created with the function vega.coordinates, where the x and y fields
-- are the coordinates within the layer, and relativex and relativey are relative to the layer
-- view size (camera size).
function vega.spaceconverter.fromdisplaytolayer(vector, display, layer)
	local newvector = {}
	newvector.x = (layer.camera.size.x * vector.x) / display.size.x
	newvector.y = (layer.camera.size.y * vector.y) / display.size.y
	local viewmatrix = vega.transform.getviewmatrix(layer):inverse()
	newvector = vega.transform.transformpoint(newvector, viewmatrix)
	return vega.coordinates(newvector, function() return layer.camera.size end)
end

--- Returns where the vector of the first layer is located in the second layer.
function vega.spaceconverter.fromlayertoanotherlayer(vector, layer1, layer2)
	local viewmatrix1 = vega.transform.getviewmatrix(layer1)
	local newvector = vega.transform.transformpoint(vector, viewmatrix1)
	newvector.x = (layer2.camera.size.x * newvector.x) / layer1.camera.size.x
	newvector.y = (layer2.camera.size.y * newvector.y) / layer1.camera.size.y
	local viewmatrix2 = vega.transform.getviewmatrix(layer2):inverse()
	newvector = vega.transform.transformpoint(newvector, viewmatrix2)
	return vega.coordinates(newvector, function() return layer2.size end)
end