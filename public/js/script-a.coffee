
console.log 'inside script-a'

@wait 5000, () ->
	@doClick '#login-sign-in-link'
	@wait 5000, () ->
		@doClick '.login-close-text'

