Template.dashboardHeader.helpers {
  showInvitation: () ->
    Session.get("isInviteFormVisible")
}


Template.dashboardHeader.events {
  "click .invite-link": (e, t) ->
    Session.set("isInviteFormVisible", !Session.get("isInviteFormVisible"))
}