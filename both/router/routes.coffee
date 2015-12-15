Router.route '/',
  name: 'home'
  controller: HomeController

Router.route '/dashboard',
  name: 'dashboard'
  controller: DashboardController

Router.route '/admin/dashboard',
  name: 'adminDashboard'
  controller: AdminController

Router.plugin 'ensureSignedIn',
  only: ['dashboard', 'adminDashboard']
