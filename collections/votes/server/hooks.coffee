updateBugCount = (vote) ->
  positive = Votes.find({bugId: vote.bugId, agreed: true}).count()
  negative = Votes.find({bugId: vote.bugId, agreed: false}).count()
  Bugs.update(vote.bugId, $set: {vote: (positive-negative)})

@Votes.after.insert( (userId, doc) ->
  updateBugCount(doc)
)

@Votes.after.update( (userId, doc) ->
  updateBugCount(doc)
)