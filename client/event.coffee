Template.event.seconds = () ->
  this.seconds.toString().toTime()

Template.event.events =
  'click #destroy' : ()  ->
    unless Session.get("eventId") == this._id
      Events.remove({_id: this._id})
  'click #select' : () ->
    if Session.get("timer") == false
      Session.set("eventId",this._id)