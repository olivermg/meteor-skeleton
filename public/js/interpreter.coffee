
return (scripts) ->
	if scripts
		scripts.map (script) ->
			if script
				eval script

