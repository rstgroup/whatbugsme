Meteor.publish "bugs_with_votes", () ->
  companyIds = _.map(Companies.find({"users._id": @userId}, {fields: {_id: 1}}).fetch(), (c) -> c._id)

  Meteor.publishWithRelations
    handle: this
    collection: Bugs
    filter: {companyId: {$in: companyIds}}
    options: {
      sort: { createdAt: -1 }
    }
    mappings: [{
      key: "bugId"
      collection: Votes
      filter: {userId: @userId}
      reverse: true
    }]