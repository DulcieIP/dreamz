import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="hiddenloading"
export default class extends Controller {
  static targets = ["loading", "form", "bouclodio"]

  show() {
    this.loadingTarget.classList.remove("d-none")
    this.formTarget.classList.add("d-none")

    this.bouclodioTarget.play()

    new Typed(this.textTarget, {
      strings: ['Dream in progress...', 'Compiling your brain cells...', 'Get ready to meet your subconscious...', 'Almost there...', "What's a few seconds of waiting compared to the 6 years you'll spend dreaming?", 'Bringing your dreams to reality...', "Did you know that 90% of dreams are forgotten within 10 minutes of waking up?" ],
      typeSpeed: 90,
      loop: true,
    })
  }
}
