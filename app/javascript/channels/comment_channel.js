import consumer from "./consumer";

if (location.pathname.match(/\/rooms\/\d+\/events\/\d+/)) {
  const [, roomId, eventId] = location.pathname.match(/\/rooms\/(\d+)\/events\/(\d+)/);

  consumer.subscriptions.create({
    channel: "CommentChannel",
    room_id: roomId,
    event_id: eventId
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
        <div class="comment">
          <p class="user-info">${data.user.name}： </p>
          <p>${data.comment.text}</p>
        </div>`;
      const comments = document.getElementById("comments");
      comments.insertAdjacentHTML('beforeend', html);
      const commentForm = document.getElementById("comment-form");
      commentForm.reset();
    }
  });
}
