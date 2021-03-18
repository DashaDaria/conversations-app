import consumer from "./consumer"

consumer.subscriptions.create(
  {
    channel: "ConversationChannel",
    topic: "conversation_" + window.location.search.replace("?user_id=","")
  },
  {
  received(data) {
    console.log(data)
    this.appendLine(data)
    const element = document.getElementById("message")
    element.value = ''
  },

  appendLine(data) {
    const html = this.createLine(data)
    const element = document.getElementById("conversation-list")
    element.insertAdjacentHTML("beforebegin", html)
  },

  createLine(data) {
    return `
      <li class="list-group-item">
          <div>
            <strong>${data.from}</strong>
            <small>${data.timestamp}</small>
          </div>
          ${data.body}
        </li>
    `
  }
})


