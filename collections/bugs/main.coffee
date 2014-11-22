@Bugs.attachSchema(@Schemas.Bug)
@Bugs._transform = (bug) -> _.extend(bug, @Transforms.Bug)