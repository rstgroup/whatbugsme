@Schemas ||= {}

@Schemas.Invitation = new SimpleSchema(
  userId: 
    type: String
    label: "User"
    regEx: SimpleSchema.RegEx.Id
  email:
    type: String,
    regEx: SimpleSchema.RegEx.Email
    label: "Email"
  companyId: 
    type: String
    label: "Company"
    regEx: SimpleSchema.RegEx.Id
  alreadyUsed: 
    type: Boolean
    label: "Already used"
    defaultValue: false
  createdAt:
    type: Date,
    autoValue: () ->
      if (@isInsert) 
        return new Date
      else if this.isUpsert
        return {$setOnInsert: new Date}
      else
        @unset()
)