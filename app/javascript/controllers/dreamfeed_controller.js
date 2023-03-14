import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dreamfeed"
export default class extends Controller {
  static targets = ["showbigimage"]

  connect() {
    console.log('coucou')
  }

  bigimage() {
    this.showbigimageTarget.classList.remove("d-none")
  }

  closeimage(event) {
    if (event.target.tagName == "DIV") {
      this.showbigimageTarget.classList.add("d-none")
    }
  }

  close() {
    this.showbigimageTarget.classList.add("d-none")
  }
}
