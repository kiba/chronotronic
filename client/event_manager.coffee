Meteor.subscribe("events")

Template.event_manager.list = () ->
  if (Session.get("events_toggl"))
    Events.find({user_id: Meteor.userId()}, {sort: {seconds: 1}})
  else
    Events.find({user_id: Meteor.userId(), date: getTodayDate() }, {sort: {seconds: 1}})


Template.event_manager.create = () ->
  Session.get("create")

Template.event_manager.toggl = () ->
  Session.get("events_toggl")


Template.event_manager.events =
  'click #delete_all' : () ->
    if Session.get("eventId") == null
      Meteor.call("removeAll", (err,result) ->
        if err
          console.log(err)
      )
  'click #create' : () ->
    Session.set("create",true)
  'click #all' : () ->
    Session.set('events_toggl', true)
  'click #today' : () ->
    Session.set('events_toggl',false)