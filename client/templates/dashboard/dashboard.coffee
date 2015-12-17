Template.dashboard.events
  'submit form': (e) ->
    e.preventDefault()

    username = $('input[name=username]').val()
    name = $('input[name=name]').val()
    email = $('input[name=email]').val()

    Meteor.call 'updateCurrentUser', username, name, email

Template.dashboard.helpers
  'canUserChangeName': ->
    changeName = Settings.findOne({}, {fields: 'userChangeName': 1})

    if changeName
      return ""
    else
      return "disabled"
