Template.userJoin.events {
  "focus input": (e,t) -> $(e.currentTarget).parent().addClass("focused")
  "blur input": (e,t) -> $(e.currentTarget).parent().removeClass("focused")
}

Template.userJoin.helpers {
  invitedAddress: () ->
    @invitation.email
}