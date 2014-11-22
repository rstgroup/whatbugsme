Meteor.methods {
  "/api/accounts/is_email_uniq": (email) ->
    if Meteor.users.findOne({ "emails.address" : email }) then false else true

  "/api/accounts/create": (data) ->
    check(data, Schemas.UserSignUp)
    userId = Accounts.createUser(data)
    companyData = {
      users: [{_id: userId}]
      name: data.companyName
    }
    Companies.insert(companyData)
    userId
}