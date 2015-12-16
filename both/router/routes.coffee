Router.route '/',
  name: 'home'
  controller: HomeController

Router.route '/dashboard',
  name: 'dashboard'
  controller: DashboardController

# Admin routes
Router.route '/admin',
  action: ->
    Router.go 'adminDashboard'

Router.route '/admin/dashboard',
  name: 'adminDashboard'
  controller: AdminController

Router.route '/admin/users',
  name: 'adminUsers'
  controller: AdminController

# Make sure the user is signed in
Router.plugin 'ensureSignedIn',
  only: ['dashboard', 'adminDashboard', 'adminUsers']
