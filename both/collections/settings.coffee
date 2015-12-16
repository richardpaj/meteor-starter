@Settings = new Mongo.Collection('settings')

Schemas = {}

Schemas.Settings = new SimpleSchema
  userChangeName:
    type: Boolean

Settings.attachSchema Schemas.Settings
