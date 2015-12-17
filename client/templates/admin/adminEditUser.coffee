Template.adminEditUser.onCreated () ->
  Template.instance().subscribe('users')

Template.adminEditUser.helpers
  'user': ->
    user = Meteor.users.findOne({_id: Router.current().params._id})

    if user
      return user

Template.adminEditUser.events
  'submit form': (e, t) ->
    e.preventDefault()

    _id = Router.current().params._id

    username = $('input[name=username]').val()
    name = $('input[name=name]').val()
    email = $('input[name=email]').val()
    role = $(e.target).find('option:selected').val()

    Meteor.call 'updateUser',
      _id: _id,
      username: username,
      name: name,
      email: email,
      role: role

    Router.go 'adminUsers'

  'click #cancel': ->
    Router.go 'adminUsers'
