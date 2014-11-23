Template.userSignIn.events {
  "focus input": (e,t) -> $(e.currentTarget).parent().addClass("focused")
  "blur input": (e,t) -> $(e.currentTarget).parent().removeClass("focused")
}

AutoForm.hooks {
  signInForm: {
    onSubmit: (doc) ->
      @event.stopPropagation()
      that = this
      Meteor.loginWithPassword(doc.email, doc.password, (error) ->
        if error
          Session.set("error", "Wrong email and/or password")
        else
          Session.set("success", "Signed in successfully")
          Router.go(@AccountsHelper.afterSignInPath())
        that.done()
      )
      false
  }
}