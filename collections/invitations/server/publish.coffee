Meteor.publish "invitation", (id) ->
  Meteor.publishWithRelations
    handle: this
    collection: Invitations
    filter: {_id: id}
    mappings: [{
      key: "companyId"
      collection: Companies
      reverse: false
    }, {
      key: "userId"
      collection: Meteor.users
      reverse: false
    }]