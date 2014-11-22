Template.userSignUp.events {
  "focus input": (e,t) -> $(e.currentTarget).parent().addClass("focused")
  "blur input": (e,t) -> $(e.currentTarget).parent().removeClass("focused")
}

AutoForm.hooks {
  signUpForm: {
    onSubmit: (doc) ->
      @event.stopPropagation()
      that = this
      Accounts.createUser({email: doc.email, password : doc.password, username: doc.username}, (error) ->
        if error
          Session.set("error", "Cannot sign up")
        else
          Session.set("success", "Signed up successfully")
          if Meteor.isClient
            Router.go(AccountsHelper.afterSignInPath())
        that.done()
      )
      false
  }
}