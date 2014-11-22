@Transforms ||= {}

Transforms.User = {
  userName: () ->
    @emails[0].address
}

Meteor.users._transform = (user) -> _.extend(user, Transforms.User)