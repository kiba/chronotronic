Meteor.subscribe("events")

Template.event_manager.size = () ->
  Events.find({user_id: Meteor.userId()}).count()

Template.event_manager.list = () ->
  Events.find({user_id: Meteor.userId()}, {sort: {seconds: 1}})

Template.event_manager.status = () ->
  Session.get("create")

Template.event_manager.events =
  'click #delete_all' : () ->
    if Session.get("eventId") == null
      Events.remove({user_id: Meteor.userId()})
  'click #create' : () ->
    Session.set("create",true)
