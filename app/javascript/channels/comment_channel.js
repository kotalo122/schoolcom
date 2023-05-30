import consumer from "./consumer"

if(location.pathname.match(/\/events\/\d/)){
  // console.log("読み込み完了") //削除

  consumer.subscriptions.create("CommentChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data) //追加
    }
  })
}