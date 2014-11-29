Template.userSignUp.events {
  "focus input": (e,t) -> $(e.currentTarget).parent().addClass("focused")
  "blur input": (e,t) -> $(e.currentTarget).parent().removeClass("focused")
}

AutoForm.hooks {
  signUpForm: {
    onSubmit: (doc) ->
      @event.stopPropagation()
      that = this
      Meteor.call '/api/accounts/create', doc, (error, result) ->
        if error
          Session.set("error", "Cannot sign up")
        else
          Session.set("success", "Signed up successfully")
          Meteor.loginWithPassword(doc.email, doc.password)
          Router.go(AccountsHelper.afterSignInPath())
        that.done()
      false
  }
}