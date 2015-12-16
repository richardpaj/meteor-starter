@UsersIndex = new EasySearch.Index
  collection: Meteor.users
  fields: ['username', 'emails', 'profile.name', 'roles']
  engine: new EasySearch.Minimongo(
    selectorPerField: (field, searchString) ->
      if 'emails' == field
        return {
          emails:
            $elemMatch:
              address: '$regex' : '.*' + searchString + '.*', '$options' : 'i'
        }
      return this.defaultConfiguration().selectorPerField field, searchString
    sort: () -> ['createdAt']
  )
