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

Template.adminUsers.events
  'click #setAdmin': (e, t) ->
    if Roles.userIsInRole this._id, 'admin'
      return
    else
      role = 'admin'

    Meteor.call 'setUserAdmin', {
      user: this._id,
      role: role
    }, (error, response) ->
      if error
        console.log error.reason

  'click #removeUser': (e) ->
    if Roles.userIsInRole this._id, 'admin'
      role = 'admin'
    else
      role = 'user'

    Meteor.call 'removeUser', {
      user: this._id,
      role: role
    }, (error, response) ->
      if error
        console.log error.reason
