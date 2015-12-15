class @AppController extends RouteController
  layoutTemplate: 'appLayout'

  onAfterAction: () ->
    Meta.setTitle 'Home'

AppController.events
  'click [data-action=logout]': ->
    AccountsTemplates.logout()
