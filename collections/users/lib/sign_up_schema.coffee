that = this
@Schemas ||= {}

@Schemas.UserSignUp = new SimpleSchema(
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
  companyName:
    type: String,
    label: "Company Name"
    min: 3
    custom: () ->
      if Meteor.isClient && this.isSet
        Meteor.call "/api/companies/is_name_uniq", @value, (error, result) ->
          if !result
            that.Schemas.UserSignUp.namedContext('signUpForm').addInvalidKeys([{name: 'companyName', type: 'notUnique'}])
  passwordConfirmation:
    type: String,
    min: 6
    label: "Password confirmation"
    custom: () ->
      if @value != @field('password').value
        return "passwordMissmatch"
)

