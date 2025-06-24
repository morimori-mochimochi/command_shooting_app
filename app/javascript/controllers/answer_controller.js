import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { correct: String }

  check(event) {
    if (event.target.value.trim() === this.correctValue.trim()) {

      const timerElement=document.querySelector('[data-controller="timer"]');
      const timerController=this.application.getControllerForElementAndIdentifier(timerElement,"timer");
      if (timerController && typeof timerController.stop==="function"){
        timerController.stop();
      }

      const nextUrl = this.element.dataset.answerNextUrl;
      if (nextUrl){
        window.location.href = nextUrl;
      }
    }
  }
}