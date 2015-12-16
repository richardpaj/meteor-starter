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
  'isCurrentUser': ->
    return if this._id is Meteor.userId() then true else false

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

  'click #removeUser': (e, t) ->
    #if Roles.userIsInRole this._id, 'admin'
    #  role = 'admin'
    #else
    #  role = 'user'
    Session.set 'selectedUser', this._id
    Modal.show 'confirmDelete'

Template.confirmDelete.events
  'click #deleteUser': (e) ->
    if Roles.userIsInRole (Session.get 'selectedUser'), 'admin'
      role = 'admin'
    else
      role = 'user'

    Meteor.call 'removeUser', {
      user: Session.get 'selectedUser',
      role: role
    }, (error, response) ->
      if error
        console.log error.reason
