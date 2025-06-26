import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { correct: String }

  check(event) {
    if (event.target.value.trim() === this.correctValue.trim()) {

      const timerElement=document.querySelector('[data-controller="timer"]');
      const timerController=this.application.getControllerForElementAndIdentifier(timerElement,"timer");
      const gameSessionId=timerElement.dataset.gameSessionId;
      const nextUrl = this.element.dataset.answerNextUrl;
  
      const isLastQuestion= nextUrl && !nextUrl.includes("index=");

      if (timerController) {
        if (isLastQuestion){
          timerController.stopAndSendDuration(gameSessionId);
        }else if (typeof timerController.stop ==="function"){
          timerController.stop();
        }
      }

      if (nextUrl){
        window.location.href = nextUrl;
      }
    }
  }
}