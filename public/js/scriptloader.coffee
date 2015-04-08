
class Scriptloader
	constructor: (interpreter, scripts, onready) ->
		@init interpreter, scripts, onready

	init: (interpreter, scripts, onready) =>
		promises = [
			Q.fcall () =>
				# load interpreter:
				@load interpreter
		]
		Array.prototype.push.apply(
			promises,
			scripts.map (s) =>
				# load script:
				@load s
		)
		allpromise = Q.all promises
		allpromise.then (res) =>
					evalres = res.map eval
					@interpreter = evalres[0]
					@scripts = evalres.slice 1
					onready.call this,
				(err) =>
					console.log 'reject:'
					console.log err

	load: (path) =>
		d = Q.defer()
		$.ajax {
			url: "/js/#{path}",
			accept: 'application/javascript',
			dataType: 'text', # setting it to 'script' would automatically invoke it
			success: (data) =>
				d.resolve data
			error: (xhr, stuff, error) ->
				console.log "ERROR loading script: #{error}"
				d.reject error
		}
		d.promise

	run: () =>
		console.log @scripts
		@interpreter @scripts

scripts = [ 'script-a.js', 'script-b.js' ]

@scriptloader = new Scriptloader 'interpreter.js', scripts, () ->
	console.log 'before'
	@run()
	console.log 'after'

