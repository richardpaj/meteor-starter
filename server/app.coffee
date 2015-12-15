Accounts.onLogin (info) ->
  user = info.user

  if !Roles.userIsInRole(user, ['admin','user'])
    if Meteor.users.find().count() == 1
      Roles.addUsersToRoles(user, 'admin', Roles.GLOBAL_GROUP)
    else
      Roles.addUsersToRoles(user, 'user', Roles.GLOBAL_GROUP)

  return user
