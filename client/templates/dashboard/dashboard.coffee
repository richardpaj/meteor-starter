Template.dashboard.events
  'submit form': (e) ->
    e.preventDefault()

    username = $('input[name=username]').val()
    name = $('input[name=name]').val()
    email = $('input[name=email]').val()

    Meteor.call 'updateUser', username, name, email
