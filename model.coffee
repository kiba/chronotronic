Events = new Meteor.Collection("Events")

Meteor.methods({
    createTimerEvent: () ->
      Events.insert({user_id: Meteor.userId(), seconds: 0, date: getTodayDate(), name: null})
    createNewEvent: (date,name,time) ->
      Events.insert({user_id: Meteor.userId(), seconds: time, date: date, name: name})
  }
)