@Schemas ||= {}

@Schemas.Bug = new SimpleSchema(
  name:
    type: String,
    label: "What bugs you"
    min: 3
  companyId: 
    type: String,
    label: "Company"
    regEx: SimpleSchema.RegEx.Id
  vote: 
    type: Number
    label: "Vote"
    defaultValue: 0
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