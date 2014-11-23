that = this
@Schemas ||= {}

@Schemas.UserJoin = new SimpleSchema(
  email:
    type: String,
    regEx: SimpleSchema.RegEx.Email
    label: "Email"
    custom: () ->
      if Meteor.isClient && this.isSet
        Meteor.call '/api/accounts/is_email_uniq', @value, (error, result) ->
          if !result
            that.Schemas.UserSignUp.namedContext('signUpForm').addInvalidKeys([{name: 'email', type: 'notUnique'}])
  password:
    type: String,
    label: "Password"
    min: 6
  invitation:
    type: String
    label: "Invitation"
    regEx: SimpleSchema.RegEx.Id
  passwordConfirmation:
    type: String,
    min: 6
    label: "Password confirmation"
    custom: () ->
      if @value != @field('password').value
        return "passwordMissmatch"
)

