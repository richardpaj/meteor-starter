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

  'updateCurrentUser': (username, name, email) ->
    Meteor.users.update Meteor.userId(), {$set: {username: username, 'emails.0.address': email, profile: {name: name}}}

  'setUserAdmin': (options) ->
    #check options,
    #  user: String
    #  role: String

    try
      Roles.setUserRoles options.user, [options.role]
    catch exception
      return exception

  'updateUser': (options) ->
    _id = options._id
    Meteor.users.update _id: _id, {$set: {username: options.username, profile: {name: options.name}, 'emails.0.address': options.email}}

    if Roles.userIsInRole Meteor.userId(), ['site-admin']
      if options.role == 'site-admin'
        Roles.setUserRoles _id, [options.role, 'admin']
      else
        Roles.setUserRoles _id, [options.role]

  'removeUser': (options) ->
    try
      Roles.removeUsersFromRoles options.user, [options.role]
      Meteor.users.remove {_id: options.user}
    catch exception
      return exception
