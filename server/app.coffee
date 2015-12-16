#Accounts.onCreateUser (options, user) ->
#  user.profile = options.profile
#  console.log 'firing'
#
#  console.log Meteor.users.find().count()

#  if Meteor.users.find().count() == 1
#    Roles.addUsersToRoles(user._id, 'admin', Roles.GLOBAL_GROUP)
#  else
#    Roles.addUsersToRoles(user._id, 'user', Roles.GLOBAL_GROUP)

#  return user
