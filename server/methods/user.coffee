Meteor.methods
  'registerUser': (username, name, email, password) ->
    id = Accounts.createUser
      username: username
      email: email
      password: password
      profile:
        name: name

    if Meteor.users.find().count() == 1
      Roles.addUsersToRoles(id, ['site-admin', 'admin'])
    else
      Roles.addUsersToRoles(id, 'user')

  'updateUser': (username, name, email) ->
    Meteor.users.update Meteor.userId(), {$set: {username: username, 'emails.0.address': email, profile: {name: name}}}

  'setUserAdmin': (options) ->
    #check options,
    #  user: String
    #  role: String

    try
      Roles.setUserRoles options.user, [options.role]
    catch exception
      return exception

  'removeUser': (options) ->
    try
      Roles.removeUsersFromRoles options.user, [options.role]
      Meteor.users.remove {_id: options.user}
      Session.set 'selectedUser', undefined
    catch exception
      return exception
