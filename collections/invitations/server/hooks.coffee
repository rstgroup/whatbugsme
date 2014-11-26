@Invitations.after.insert( (userId, doc) ->
  Email.send(
    from: "noreply@whatbugsme.co",
    to: doc.email
    subject: "Invitation to whatbugsme.co"
    text:
      """
        Hi

        You have received an invitation to whatbugsme
        just visit: #{Meteor.absoluteUrl()}invitation/#{doc._id}

        Thanks
      """
  )
)