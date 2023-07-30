Config = {}

Config.Elevators = {
	['fib'] = {
		jobs = {enable = true, jobs = {'police', 'fib'}},
		text3d = {enable = true, text = '~g~[E]~s~ - Elevator', size = 0.5},
		marker = {enable = true, distance = 7.5, type = 27, size = {a = 1.0, b = 1.0, c = 1.0}, color = {a = 255, b = 255, c = 255}},
		locations = {
			{label = 'Dach', coords = vec4(141.27, -735.02, 262.85, 156.69), isVehicleAllowed = false},
			{label = '53. Stockwerk', coords = vec4(156.96, -757.31, 258.15, 153.16), isVehicleAllowed = false},
			{label = '49. Stockwerk', coords = vec4(136.06, -761.82, 242.15, 152.7), isVehicleAllowed = false},
			{label = '47. Stockwerk', coords = vec4(136.14, -761.68, 234.15, 155.86), isVehicleAllowed = false},
			{label = '1. Stockwerk', coords = vec4(136.06, -761.82, 45.75, 158.04), isVehicleAllowed = false},
			{label = 'Garage', coords = vec4(144.28, -688.96, 33.13, 247.74), isVehicleAllowed = false},
		}
	},
	['mazebanktower'] = {
		jobs = {enable = false, jobs = {'none'}},
		text3d = {enable = true, text = '~g~[E]~s~ - Elevator', size = 0.5},
		marker = {enable = true, distance = 7.5, type = 27, size = {a = 1.0, b = 1.0, c = 1.0}, color = {a = 255, b = 255, c = 255}},
		locations = {
			{label = 'Dach', coords = vec4(-75.09, -819.12, 326.18, 357.0), isVehicleAllowed = true},
			{label = 'Garage', coords = vec4(-84.24, -821.29, 36.03, 345.93), isVehicleAllowed = true},
		}
	},
}