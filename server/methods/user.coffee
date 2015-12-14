Meteor.methods
  'registerUser': (username, name, email, password) ->
    Accounts.createUser
      username: username
      email: email
      password: password
      profile:
        name: name
