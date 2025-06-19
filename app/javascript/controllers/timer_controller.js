import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets =["timer","start"]

  start() {
    this.startTime = Date.now()
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
}