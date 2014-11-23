@InvitationController = RouteController.extend
  layoutTemplate: 'generalLayout'
  template: 'invitation'
  onBeforeAction: -> 
    Meteor.logout()
    @next()
  waitOn: () -> [
    Meteor.subscribe('invitation', @params._id)
  ]
  data: () ->
    invitation: Invitations.findOne()
    company: Companies.findOne()
    user: Meteor.users.findOne()