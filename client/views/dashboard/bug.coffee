giveVote = (e, t, agreed) ->
  vote = Votes.findOne({bugId: t.data._id, userId: Meteor.userId()})
  params = {agreed: agreed, bugId: t.data._id, userId: Meteor.userId()}
  if vote
    Votes.update(vote._id, $set: params)
  else
    Votes.insert(params)


Template.bug.helpers {
  createdFromNow: () ->
    moment(@createdAt).fromNow()
  aggreed: (val) ->
    vote = Votes.findOne({bugId: @._id, userId: Meteor.userId()})
    if vote && vote.agreed == val
      "selected"
  btnText: (val) ->
    vote = Votes.findOne({bugId: @._id, userId: Meteor.userId()})
    if val
      if vote && vote.agreed == val then "+1" else "I agree"
    else
      if vote && vote.agreed == val then "-1" else "I disagree"
  conterClass: (val) ->
    if @vote > 0
      "green"
    else if @vote < 0
      "red"
    
}

Template.bug.events {
  "click .agree": (e, t) -> giveVote(e,t,true)
  "click .disagree": (e, t) -> giveVote(e,t,false)

}