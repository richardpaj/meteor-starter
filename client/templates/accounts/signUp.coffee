Template.signUp.events
  'submit form': (e) ->
    e.preventDefault()

    username = $('[name=username]').val()
    name = $('[name=name]').val()
    email = $('[name=email]').val()
    password = $('[name=password]').val()
    password_confirm = $('[name=password_confirm]').val()

    if Meteor.users.find().count() == 0
      role = 'admin'
    else
      role = 'user'

    if password == password_confirm
      Meteor.call 'registerUser', username, name, email, password
      Router.go 'home'
    else
      console.log 'passwords are not identical'
