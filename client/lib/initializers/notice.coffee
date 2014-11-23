Meteor.startup () ->
  if Meteor.isClient
    Tracker.autorun () ->
      if Session.get("error")
        alertify.error(Session.get("error"))
        Session.set("error", null)
      if Session.get("success")
        alertify.success(Session.get("success"))
        Session.set("success", null)