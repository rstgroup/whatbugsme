@Schemas ||= {}

@Schemas.UserSignIn = new SimpleSchema(
  email:
    type: String,
    regEx: SimpleSchema.RegEx.Email
    label: "Email"
  password:
    type: String,
    label: "Password"
)

