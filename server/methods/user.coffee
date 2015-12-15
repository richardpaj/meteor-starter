Meteor.methods
  'registerUser': (username, name, email, password) ->
    Accounts.createUser
      username: username
      email: email
      password: password
      profile:
        name: name

  'updateUser': (name, email) ->
    Meteor.users.update Meteor.userId(), {$set: {'emails.0.address': email, profile: {name: name}}}
