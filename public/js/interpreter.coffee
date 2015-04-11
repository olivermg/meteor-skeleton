
@doClick = (sel) ->
	$(sel).click()

@wait = (ms, cb) ->
	setTimeout cb, ms

return (scripts) ->
	if scripts
		scripts.map (script) ->
			if script
				eval script

