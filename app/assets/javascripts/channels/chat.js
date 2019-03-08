App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log('Connected to the chat channel!');
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
    console.log('Disconnected from the chat channel!');
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    var messges = $('#chatbox');
    messges.append(data['messge']);
    messges.scrollTop(messges[0].scrollHeight);
  }
});
