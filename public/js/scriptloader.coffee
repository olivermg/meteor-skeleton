
class Scriptloader
	constructor: (interpreter, scripts, onready) ->
		@scripts = scripts
		$.ajax {
			url: "/js/#{interpreter}",
			dataType: 'text', # setting it to 'script' would automatically invoke it
			success: (data) => # => binds 'this' inside function to instance of Scriptloader
				@interpreter = eval data
				if onready
					onready.call this, @interpreter # call of instance var binds 'this' to instance of Scriptloader
			error: (xhr, stuff, error) ->
				console.log "ERROR loading interpreter: #{error}"
		}

	run: () =>
		@interpreter(@scripts)

@scriptloader = new Scriptloader 'interpreter.js', [], () ->
	console.log 'before'
	@run()
	console.log 'after'

