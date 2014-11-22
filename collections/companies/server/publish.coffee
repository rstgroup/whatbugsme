Meteor.publish "companies", () ->
  Companies.find({"users._id": @userId})