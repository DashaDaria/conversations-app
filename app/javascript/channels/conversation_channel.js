// app/javascript/channels/chat_channel.js
import consumer from "./consumer"

consumer.subscriptions.create({ channel: "ConversationChannel", room: "Best Room" })

