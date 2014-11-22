@Schemas ||= {}

@Schemas.Company = new SimpleSchema(
  name:
    type: String,
    label: "Company Name"
    min: 3
  users: 
    type: [Object]
    minCount: 1
  "users.$._id":
    type: String
    label: "user id"
    regEx: SimpleSchema.RegEx.Id
)