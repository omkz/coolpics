App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    console.log('connected');
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log('disconnected');
    # Called when the subscription has been terminated by the server

  received: (notification) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('received');
    $('#notifications').prepend "<div class='notifications'>#{notification.message}</div>"


