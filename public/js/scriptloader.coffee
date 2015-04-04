
class Scriptloader
	constructor: (interpreter, scripts, onready) ->
		$.ajax {
			url: "/js/#{interpreter}",
			dataType: 'text',
			success: (data) ->
				@interpreter = eval data
				if onready
					onready @interpreter
			error: (xhr, stuff, error) ->
				console.log "ERROR loading interpreter: #{error}"
		}

@scriptloader = new Scriptloader 'interpreter.js', [], (interpreter) ->
	console.log 'before'
	interpreter()
	console.log 'after'

