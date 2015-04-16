
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
	$('body').prepend '<div class="recorder-toolbar">TOOLBAR</div>'
	$('.recorder-toolbar').on 'click', (e) =>
		@recorder.toggle()

$(document).ready () ->
	installRecorder()

