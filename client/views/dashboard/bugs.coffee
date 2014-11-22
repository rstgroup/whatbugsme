Template.bugs.helpers {
  sortedBugs: () ->
    _.sortBy(@bugs.fetch(), (b) -> -b.createdAt)
}
