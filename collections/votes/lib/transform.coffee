@Transforms ||= {}

Transforms.Vote = {
  bug: () -> Bugs.findOne(@bugId)

  company: () -> Companies.findOne(@bug().companyId)

  canEdit: (userId) ->
    return false unless userId
    !! _.find(@company().users, (u) -> u._id == userId)
}