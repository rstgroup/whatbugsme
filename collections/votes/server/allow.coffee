@Votes.allow
  insert: (userId, doc) ->
    Votes._transform(doc).canEdit(userId)
  update: (userId, doc) ->
    Votes._transform(doc).canEdit(userId)