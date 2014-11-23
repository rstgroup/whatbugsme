@Invitations.allow
  insert: (userId, doc) ->
    return false if doc.userId != userId
    company = Companies.findOne(doc.companyId)
    !! _.find(company.users, (u) -> u._id == userId)