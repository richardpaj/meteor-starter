Template.registerHelper 'isAdmin', (userId) ->
  if Meteor.userId() == userId
    return if Roles.userIsInRole(userId, 'admin') then true else false
