@Companies = new Mongo.Collection("companies")

@Companies.attachSchema(@Schemas.Company)

