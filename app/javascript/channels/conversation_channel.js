import consumer from "./consumer"

consumer.subscriptions.create(
  {
    channel: "ConversationChannel",
    topic:  "conversation_" + window.location.search.replace("?user_id=","")
  },
  {
    received: function(data) {
      console.log(data);
    }
  }
)


