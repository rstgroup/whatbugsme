@Schemas ||= {}

@Schemas.Vote = new SimpleSchema(
  userId: 
    type: String
    label: "User"
    regEx: SimpleSchema.RegEx.Id
  bugId: 
    type: String
    label: "Bug"
    regEx: SimpleSchema.RegEx.Id
  agreed: 
    type: Boolean
    label: "Agreed"
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