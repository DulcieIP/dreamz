import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countermax"
export default class extends Controller {
  static targets = ["counter", "input"]

  check() {

    if (this.inputTarget.value.length > 250){
      this.counterTarget.classList.add("red")
    } else {
      this.counterTarget.classList.remove("red")
    }
  }

}
