that = this
@Schemas ||= {}

@Schemas.UserSignUp = new SimpleSchema(
  email:
    type: String,
    regEx: SimpleSchema.RegEx.Email
    label: "Email"
    custom: () ->
      if Meteor.isClient && this.isSet
        Meteor.call 'accountsIsEmailAvailable', @value, (error, result) ->
          if !result
            that.Schemas.UserSignUp.namedContext('signUpForm').addInvalidKeys([{name: 'email', type: 'notUnique'}])

  password:
    type: String,
    label: "Password"
    min: 6
  username:
    type: String,
    label: "Username"
    min: 3
    custom: () ->
      if Meteor.isClient && this.isSet
        Meteor.call 'accountsIsUsernameAvailable', @value, (error, result) ->
          if !result
            that.Schemas.UserSignUp.namedContext('signUpForm').addInvalidKeys([{name: 'username', type: 'notUnique'}])
  passwordConfirmation:
    type: String,
    min: 6
    label: "Password confirmation"
    custom: () ->
      if @value != @field('password').value
        return "passwordMissmatch"
)

