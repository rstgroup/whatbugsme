Template.dashboardHeader.helpers {
  showInvitation: () ->
    Session.get("isInviteFormVisible")
}


Template.dashboardHeader.events {
  "click .invite-link": (e, t) ->
    Session.set("isInviteFormVisible", !Session.get("isInviteFormVisible"))
  "click .toggle-button a": () ->
    Session.set("isInviteFormVisible", false)
}

AutoForm.hooks {
  createInvitation: {
    onSuccess: () ->
      Session.set("isInviteFormVisible", false)
      Session.set("success", "Invitation sent to the user")
  }
}