App.message = App.cable.subscriptions.create("MessageChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log("Connected", this)
    this.speak()
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    return $('#messages').append(this.renderMessage(data));
  },

  speak: function(){
    this.perform('speak', {user: "Jonh", content: "Yo Man"})
  },

  renderMessage: function(data){
    return "<div class='message'> <h3>" + data.user + ": </h3> <pre>" + data.content + "</pre> </div>";
  }
});
