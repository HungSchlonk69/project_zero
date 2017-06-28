--[[
	Peasantclass for "Filthy Peasants"
	©LazyProggers
]]--

-- LIBARIES
require "math"

-- Start of the peasant class and methods
math.randomseed(os.time()) -- Seed the random function with the time
math.random() math.random() math.random() -- To avoid an error, where the "random" number equals 1 generate 3 numbers first

-- VARIABLES
names = {"Tjorben", "Niemand", "Idina-Hui", "Toelpel", "Nichtsnutz", "Idiot", "Dumbaf"}	-- All possible names are cached in this table
currentNumber = 0

-- FUNCTIONS
function check_values(peasant_id)
	if peasant_id.awe > 100 then peasant_id.awe = 100	-- Check if the awe is over 100% and if yes correct it
	elseif peasant_id.awe < 0 then peasant_id.awe = 0	end	-- Check if the awe is under 0% and if yes correct it

	if peasant_id.worship > 100 then peasant_id.worship = 100	-- Check if the worship is over 100% and if yes correct it
	elseif peasant_id.worship < 0 then peasant_id.worship = 0	end	-- Check if the worship is under 0% and if yes correct it

	if peasant_id.love > 100 then peasant_id.love = 100	-- Check if the love is over 100% and if yes correct it
	elseif peasant_id.love < 0 then peasant_id.love = 0	end	-- Check if the love is under 0% and if yes correct it

	if peasant_id.fear > 100 then peasant_id.fear = 100	-- Check if the fear is over 100% and if yes correct it
	elseif peasant_id.fear < 0 then peasant_id.fear = 0	end	-- Check if the fear is under 0% and if yes correct it

	if peasant_id.hatred > 100 then peasant_id.hatred = 100	-- Check if the hatred is over 100% and if yes correct it
	elseif peasant_id.hatred < 0 then peasant_id.hatred = 0	end	-- Check if the hatred is under 0% and if yes correct it
	return peasant_id
end

function change_value(peasant_id, key, value)
	if (key == "awe") then
		peasant_id.awe = peasant_id.awe + value
	elseif (key == "worship") then
		peasant_id.worship = peasant_id.worship + value
	elseif (key == "love") then
		peasant_id.love = peasant_id.love + value
	elseif (key == "fear") then
		peasant_id.fear = peasant_id.fear + value
	elseif (key == "hatred") then
		peasant_id.hatred = peasant_id.hatred + value
	end
	check_values(peasant_id)
	return peasant_id
end

function birth()
	random = math.random(table.getn(names))	-- Get a random number between 0 and the lenght of the names array (table)
	name = names[random]	-- Define name to one of the array names
	peasant_id = {name = name, awe = 0, worship = 0, love = 0, fear = 0, hatred = 0}	-- Safe all variables in the new peasant id
	currentNumber = currentNumber + 1
	return peasant_id
end

function kill(peasant_id)
	peasant_id = nil	-- Delete all values of the peasant given to the function
	currentNumber = currentNumber - 1
	return peasant_id
end

function createCiv(numberOfPeasants, civname)
	civilistation = {}
	civilistation[0] = {name = civname, startNumber = numberOfPeasants, creationTime = os.time()}	--	Save name, start number of peasants and starting time into the civilisation
	for i = 1, numberOfPeasants do
		civilistation[i] = birth()
	end
	return civilistation
end

function checkTime(civ)
	timeExists = os.time() - civ[0].creationTime	-- Calculate how long a civ exists
	return timeExists
end

-- TESTING AREA

--[[
	Notes:

	Known errors:

]]--
