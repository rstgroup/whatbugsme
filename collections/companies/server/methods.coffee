Meteor.methods {
  "/api/companies/is_name_uniq": (name) ->
    if Companies.findOne({ "name" : name }) then false else true
}