import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets =["timer","start"]

  connect() {
    this.start()
  }

  start() {
    const gameSessionId = this.element.dataset.gameSessionId
    const key = `startTime-${gameSessionId}`
    const savedStartTime = sessionStorage.getItem(key)

    if (savedStartTime) {
      this.startTime = parseInt(savedStartTime, 10)
    } else{
      this.startTime = Date.now()
      sessionStorage.setItem(key, this.startTime)
    }
    this.countUp()
  }

  stop() {
    clearTimeout(this.timerId)
  }

  countUp() {
    const d=new Date(Date.now()-this.startTime)
    const m=String(d.getMinutes()).padStart(2,"0")
    const s=String(d.getSeconds()).padStart(2,"0")
    const ms=String(d.getMilliseconds()).padStart(3,"0")
    this.timerTarget.textContent= `${m}:${s},${ms}`

    this.timerId=setTimeout(()=>this.countUp(),10)
  }

  stopAndSendDuration(gameSessionId) {
    clearTimeout(this.timerId);

    const duration = Date.now() - this.startTime

    fetch(`/game_sessions/${gameSessionId}/finish`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: `duration=${duration}`
    })
    .then(response =>{
      if (response.ok) {

        sessionStorage.removeItem(`startTime-${gameSessionId}`);
        sessionStorage.removeItem("currentGameSessionId");

        window.location.href =`/game_sessions/${gameSessionId}/finished`;
      }else{
        console.error("Failed to save duration");
      }
    })
    .catch(error => {
      console.error("Network error:", error);
    });
  }
}