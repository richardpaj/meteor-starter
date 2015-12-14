Template.signIn.events
  'submit form': (e) ->
    e.preventDefault()

    username = $('[name=username]').val()
    password = $('[name=password]').val()

    Meteor.loginWithPassword username, password, (error) ->
      if error
        console.log(error.reason)
