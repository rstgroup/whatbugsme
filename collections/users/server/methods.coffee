Meteor.methods {
  accountsIsUsernameAvailable: (username) ->
    if Meteor.users.findOne({ "username" : username }) then false else true
  accountsIsEmailAvailable: (email) ->
    if Meteor.users.findOne({ "emails.address" : email }) then false else true
}