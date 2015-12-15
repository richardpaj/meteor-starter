Meteor.publish 'users', () ->
  isAdmin = Roles.userIsInRole this.userId, 'admin'

  if isAdmin
    return Meteor.users.find {}, {fields: {"username": 1, "emails.address": 1, "roles": 1, "profile": 1}}
  else
    return null
