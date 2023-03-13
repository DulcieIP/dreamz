import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-element"
export default class extends Controller {
  static targets = ["element"]
  static values = {
    className: String
  }

  connect() {
    console.log("hello from toggle controller")
  }

  toggle() {
    this.elementTarget.classList.toggle("active");
    console.log(this.elementTarget)
  }
}
