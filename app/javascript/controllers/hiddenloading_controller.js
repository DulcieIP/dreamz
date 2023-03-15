import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hiddenloading"
export default class extends Controller {
  static targets = ["loading", "form"]


  show() {
    this.loadingTarget.classList.remove("d-none")
    this.formTarget.classList.add("d-none")
  }
}
