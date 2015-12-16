Template.registerHelper 'isAdmin', (userId) ->
  return if Roles.userIsInRole(userId, ['admin']) then true else false

Template.registerHelper 'isSiteAdmin', (userId) ->
  return if Roles.userIsInRole(userId, ['site-admin']) then true else false

Template.registerHelper 'formatDate', (date) ->
  return moment(date).format("MMMM Do YYYY, hh:mm:ss A")
