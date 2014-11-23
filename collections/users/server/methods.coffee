Meteor.methods {
  "/api/accounts/is_email_uniq": (email) ->
    if Meteor.users.findOne({ "emails.address" : email }) then false else true

  "/api/accounts/create": (data) ->
    if data.invitation
      check(data, Schemas.UserJoin)
      inv = Invitations.findOne(data.invitation)
      delete data.invitation
      userId = Accounts.createUser(data)
      Companies.update(inv.companyId,{$push:{'users':{_id: userId}}})
    else
      check(data, Schemas.UserSignUp)
      userId = Accounts.createUser(data)
      companyData = {
        users: [{_id: userId}]
        name: data.companyName
      }
      Companies.insert(companyData)
      userId
}