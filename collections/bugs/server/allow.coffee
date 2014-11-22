@Bugs.allow
  insert: (userId, doc) ->
    return false unless userId
    company = Companies.findOne(doc.companyId)
    !! _.find(company.users, (u) -> u._id == userId)