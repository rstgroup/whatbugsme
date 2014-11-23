@Invitations.after.insert( (userId, doc) ->
  Email.send(
    from: "noreply@whatbugsme.co",
    to: doc.email
    subject: "Invitation to whatbugsyou.co"
    text:
      """
        Hi

        You have received an invitation to whatbugsyou
        just visit: localhost://invitation/#{doc._id}

        Thanks
      """
  )
)