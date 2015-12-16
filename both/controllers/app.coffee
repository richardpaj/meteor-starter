class @AppController extends RouteController
  layoutTemplate: 'appLayout'
  waitOn: ->
    return [
      Meteor.subscribe('settings')
    ]

  onAfterAction: () ->
    Meta.setTitle 'Home'

AppController.events
  'click [data-action=logout]': ->
    AccountsTemplates.logout()
