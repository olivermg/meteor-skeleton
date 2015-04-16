
class Recorder
	constructor: (root) ->
		@root = root
		@started = false

	removeClickHandler: (el) ->
		console.log 'removing click handler'
		el.off 'click'

	installClickHandler: (el) ->
		console.log 'installing click handler'
		el.on 'click', (e) ->
			console.log 'clicked: ', e

	installObserver: () =>
		MutationObserver = window.MutationObserver || window.WebKitMutationObserver

		observer = new MutationObserver (mutations, observer) =>
			@installClickHandler()

		observer.observe document, {
			childList: true,
			attributes: true,
			subtree: true,
			characterData: true
		}


	start: () =>
		console.log 'starting recorder'
		@installClickHandler @root
		@started = true

	stop: () =>
		console.log 'stopping recorder'
		@removeClickHandler @root
		@started = false

	toggle: () =>
		if @started
			@stop()
		else
			@start()

installRecorder = () ->
	@recorder = new Recorder $('html')
	$.ajax {
		url: "/html/toolbar.html",
		accept: 'text/html',
		dataType: 'text',
		success: (data) =>
			$('body').prepend data
			$('.recorder-toolbar').on 'click', (e) =>
				@recorder.toggle()
		error: (xhr, stuff, error) ->
			console.log "ERROR loading script: #{error}"
	}

$(document).ready () ->
	installRecorder()

