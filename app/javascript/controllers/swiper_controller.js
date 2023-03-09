import { Controller } from "@hotwired/stimulus"
import Swiper from "swiper";
import 'swiper/css';

export default class extends Controller {
  connect() {
    console.log("swiper controller connecté")
    new Swiper(this.element, {
      direction: "horizontal",
      loop: true,
      // Swiper options go here
    });
  }
}
