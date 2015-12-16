Template.adminUsers.onCreated () ->
  Template.instance().subscribe('users')

Template.adminUsers.helpers
  'users': ->
    users = Meteor.users.find()

    if users
      return users
  'usersIndex': ->
    UsersIndex
  'inputAttributes': ->
    return {'class': 'form-control', 'placeholder': 'Search'}
