
class Scriptloader
	constructor: (interpreter, scripts) =>
		$.ajax {
			url: "/js/#{interpreter}",
			dataType: 'text',
			success: (data) ->
				console.log "success: #{data}"
			error: (xhr, stuff, error) ->
				console.log "ERROR loading interpreter: #{error}"
		}

