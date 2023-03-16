import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
import { visit } from "@hotwired/turbo"

// Connects to data-controller="homepage"
export default class extends Controller {
  static targets = ["title", "message", "audio"]

  hide() {
    if (this.titleTarget.classList.contains("animate__fadeIn")) {
      this.titleTarget.classList.remove("animate__fadeIn");
      this.titleTarget.classList.add("d-none");

      this.messageTarget.classList.remove("d-none");
      


      new Typed(this.messageTarget, {
          strings: ['Tell me about ^300 <br>your dream...'],
          typeSpeed: 50,
          loop: false,
      })

    } else {
      this.messageTarget.classList.add("animate__animated")
      this.messageTarget.classList.add("animate__fadeOutLeft")
      setTimeout(() => {
        visit('/dreams/new')
      }, 1000)
    }
  }

}
