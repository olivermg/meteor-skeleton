
class Scriptloader
	constructor: (interpreter, scripts, onready) ->
		@scripts = scripts
		@onready = onready  # need to store it as instance var, otherwise 'this' won't be bound to instance when invoking onready-callback
		$.ajax {
			url: "/js/#{interpreter}",
			dataType: 'text', # setting it to 'script' would automatically invoke it
			success: (data) =>
				@interpreter = eval data
				if @onready
					@onready @interpreter # call of instance var binds 'this' to instance of Scriptloader
			error: (xhr, stuff, error) ->
				console.log "ERROR loading interpreter: #{error}"
		}

	run: () =>
		@interpreter(@scripts)

@scriptloader = new Scriptloader 'interpreter.js', [], () ->
	console.log 'before'
	@run()
	console.log 'after'

