@DashboardController = RouteController.extend
  layoutTemplate: 'generalLayout'
  template: 'dashboard'
  onBeforeAction: -> AccountsHelper.signInRequired(@)