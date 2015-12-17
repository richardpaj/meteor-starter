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
  title: 'Admin Dashboard'

Router.route '/admin/users',
  name: 'adminUsers'
  controller: AdminController
  parent: 'adminDashboard'
  title: 'Manage users'
  showLink: true

Router.route '/admin/user/edit/:_id',
  name: 'adminEditUser'
  controller: AdminController
  parent: 'adminUsers'
  title: 'Edit user'
  showLink: false
  data: ->
    return {_id: this.params._id}

# Make sure the user is signed in
Router.plugin 'ensureSignedIn',
  only: ['dashboard', 'adminDashboard', 'adminUsers']
