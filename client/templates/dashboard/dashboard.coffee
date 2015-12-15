Template.dashboard.events
  'submit form': (e) ->
    e.preventDefault()

    name = $('input[name=name]').val()
    email = $('input[name=email]').val()

    Meteor.call 'updateUser', name, email
