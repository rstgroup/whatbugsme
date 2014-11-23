@AccountsHelper = {
  signInRequired: (router) ->
    if !Meteor.loggingIn()
      if !Meteor.user()
        Session.set('redirectedFrom', router.path)
        Router.go('/')
        Session.set('error', "You have to be signed in to continue")
      else
        Session.set('redirectedFrom', null)
        router.next()
    else
      router.next()

  afterSignInPath: () ->
    if Session.get("redirectedFrom")
      red = Session.get("redirectedFrom")
      Session.set("redirectedFrom", null)
      red
    else
      "/dashboard"
}