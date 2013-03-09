Template.timer.status = () ->
  if Session.get("timer") == true
    return "stop"
  else
    return "start"

Template.timer.activated = () ->
  Session.get("eventId") != null

Template.timer.event_name = () ->
  e = Events.findOne(Session.get("eventId"))
  e.name

Template.timer.event_date = () ->
  e = Events.findOne(Session.get("eventId"))
  e.date

Template.timer.time = () ->
  if Session.get("eventId") != null
    e = Events.findOne(Session.get("eventId"))
    return e.seconds.toString().toTime()
  "NO EVENT SELECTED"

id = null

Template.timer.events =
  'click #start' : () ->
    #Start the timer and add an event
    Session.set("timer", true)
    if Session.get("eventId") == null
      Meteor.call("createTimerEvent", (err,result) ->
        if err
          console.log(err)
        Session.set("eventId",result)
      )

    id = Meteor.setInterval(() ->
      Events.update(Session.get("eventId"), {$inc: {seconds: 1}})
    , 1000)

  ,'click #stop' : () ->
    Session.set("timer",false)
    Meteor.clearInterval(id)
  ,'click #finish' : () ->
    Session.set("timer",false)
    Session.set("eventId",null)
    Meteor.clearInterval(id)
