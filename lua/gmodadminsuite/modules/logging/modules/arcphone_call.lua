local MODULE = GAS.Logging:MODULE()
MODULE.Category = "ARCPhone"
MODULE.Name = "Calls"
MODULE.Colour = Color(255,0,0)

MODULE:Setup(function()
	-- This function is called if the module is enabled, and is not called if the module is disabled.
	-- The server owner/configurer states whether modules should be enabled or disabled in the menu.

	-- This is where we add hooks to the module, this function is just an alias of hook.Add:
	-- https://wiki.garrysmod.com/page/hook/Add
	-- You can just use hook.Add, but using this function prevents clashes of hook names between modules
	MODULE:Hook("arcphone_calling", "Blogs_ARCPhoneCalls", function(id, user1, num1, user2, num2, emergency)
		if id == 1 then
			if emergency then
				MODULE:Log(GAS.Logging:FormatPlayer(user1).."("..num1..")".." called Emergency Number("..num2..")")
			else
				MODULE:Log(GAS.Logging:FormatPlayer(user1).."("..num1..")".." called "..GAS.Logging:FormatPlayer(user2).."("..num2..")")
			end
		elseif id == 2 then
			
			MODULE:Log(GAS.Logging:FormatPlayer(user1).."("..num1..")".." accepted the call of "..GAS.Logging:FormatPlayer(user2).."("..num2..")")
		elseif id == 3 then
			MODULE:Log(GAS.Logging:FormatPlayer(user1).."("..num1..")".." cut off the call with "..GAS.Logging:FormatPlayer(user2).."("..num2..")")
		end
	end)
end)

GAS.Logging:AddModule(MODULE)