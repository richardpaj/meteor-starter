class @AppController extends RouteController
  layoutTemplate: 'appLayout'

AppController.events
  'click [data-action=logout]': ->
    AccountsTemplates.logout()
