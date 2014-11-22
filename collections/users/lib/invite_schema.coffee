@Schemas ||= {}

@Schemas.UserInvite = new SimpleSchema(
  name:
    type: String,
    label: "Invite Name"
    min: 3
)

