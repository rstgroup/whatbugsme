@Votes.attachSchema(@Schemas.Vote)
@Votes._transform = (vote) -> _.extend(vote, Transforms.Vote)