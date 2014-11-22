@DashboardController = RouteController.extend
  layoutTemplate: 'generalLayout'
  template: 'dashboard'
  onBeforeAction: -> AccountsHelper.signInRequired(@)
  waitOn: () -> [
    Meteor.subscribe('companies'),
    Meteor.subscribe('bugs_with_votes')
  ]
  data: () ->
    company: Companies.findOne()
    bugs: Bugs.find()