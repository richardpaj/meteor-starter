Template.adminEditUser.onCreated () ->
  Template.instance().subscribe('users')

Template.adminEditUser.helpers
  'user': ->
    user = Meteor.users.findOne({_id: Router.current().params._id})

    if user
      return user
