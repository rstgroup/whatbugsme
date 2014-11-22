@AccountsHelper = {
  signInRequired: (router) ->
    if !Meteor.loggingIn()
      if !Meteor.user()
        Session.set('redirectedFrom', router.path)
        Router.go('/users/sign-in')
        Session.set('error', i18n('user.labels.signInRequired'))
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