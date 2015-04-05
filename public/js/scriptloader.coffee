
class Scriptloader
	constructor: (interpreter, scripts, onready) ->
		@scripts = scripts
		$.ajax {
			url: "/js/#{interpreter}",
			dataType: 'text', # setting it to 'script' would automatically invoke it
			success: (data) => # '=>' binds 'this' inside function to instance of Scriptloader
				@interpreter = eval data
				if onready
					onready.call this # call of instance var binds 'this' to instance of Scriptloader
			error: (xhr, stuff, error) ->
				console.log "ERROR loading interpreter: #{error}"
		}

	run: () =>
		@interpreter @scripts

scripts = [
	[
		"1:aaa",
		"1:bbb"
	],
	[
		"2:aaa",
		"2:bbb",
		"3:ccc"
	]
]

@scriptloader = new Scriptloader 'interpreter.js', scripts, () ->
	console.log 'before'
	@run()
	console.log 'after'

