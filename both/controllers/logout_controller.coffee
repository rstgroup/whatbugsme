@LogoutController = RouteController.extend
  path: "/users/sign-out"
  action: () ->
    Meteor.logout()
    Router.go("/")