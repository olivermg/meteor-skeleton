if Meteor.isClient
	# counter starts at 0
	#console.log "ccccccccccccc"
	Session.setDefault 'counter', 0

	Template.hello.helpers {
		counter: () ->
			Session.get 'counter'
		}

	Template.hello.events {
		'click button': () ->
			# increment the counter when button is clicked
			Session.set 'counter', Session.get('counter') + 1
		}

if Meteor.isServer
	Meteor.startup () ->
		# code to run on server at startup
		#console.log "sssssssssssssss"

