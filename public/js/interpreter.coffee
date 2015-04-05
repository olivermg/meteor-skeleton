
return (scripts) ->
	console.log "got scripts: #{scripts}"
	scripts.map (script) ->
		script.map (line) ->
			console.log "interpreting #{line}"

