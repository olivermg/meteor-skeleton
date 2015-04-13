
console.log 'recorder'

installClickHandler = () ->
	$('html').off 'click'
	$('html').on 'click', (e) ->
		console.log 'clicked: ', e

installToolbar = () ->
	$('body').prepend '<div class="recorder-toolbar">TOOLBAR</div>'

$(document).ready () ->
	MutationObserver = window.MutationObserver || window.WebKitMutationObserver

	observer = new MutationObserver (mutations, observer) ->
		installClickHandler()

	observer.observe document, {
		childList: true,
		attributes: true,
		subtree: true,
		characterData: true
	}

	installToolbar()
	installClickHandler()

