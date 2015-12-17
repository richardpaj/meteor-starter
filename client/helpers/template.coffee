Template.registerHelper 'isAdmin', (userId) ->
  return if Roles.userIsInRole(userId, ['admin']) then true else false

Template.registerHelper 'isSiteAdmin', (userId) ->
  return if Roles.userIsInRole(userId, ['site-admin']) then true else false

Template.registerHelper 'formatDate', (date) ->
  return moment(date).format("MMMM Do YYYY, hh:mm:ss A")

Template.registerHelper 'isCurrentUser', (userId) ->
  return if userId is Meteor.userId() then true else false

Template.registerHelper 'selected', (v1, v2) ->
  return if v1 == v2 then true else false
