Meteor.methods
  'registerUser': (username, name, email, password) ->
    Accounts.createUser
      username: username
      email: email
      password: password
      profile:
        name: name

  'updateUser': (username, name, email) ->
    Meteor.users.update Meteor.userId(), {$set: {username: username, 'emails.0.address': email, profile: {name: name}}}
