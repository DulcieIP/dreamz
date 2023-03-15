import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countermax"
export default class extends Controller {
  check(event) {

    var str = event.currentTarget.innerText;
    console.log(str.length);
    // if str.length >= 250
    //   this.currentTarget.classList.add("red");


  }

}
