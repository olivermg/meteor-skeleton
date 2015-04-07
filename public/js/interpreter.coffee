
return (scripts) ->
	console.log "got scripts: #{scripts}"
	if scripts
		scripts.map (script) ->
			if script
				script.map (line) ->
					console.log "interpreting #{line}"

