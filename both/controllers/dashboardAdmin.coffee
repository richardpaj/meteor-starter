class @AdminController extends AppController
  onBeforeAction: () ->
    loggedInUser = Meteor.user()

    if !loggedInUser or !Roles.userIsInRole(loggedInUser, ['admin'])
      this.next()
      Router.go 'home'
    else
      this.next()
  onAfterAction: () ->
    Meta.setTitle 'Admin Dashboard'
