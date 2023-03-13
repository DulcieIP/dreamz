import { Controller } from "@hotwired/stimulus"
import { Gradient } from '../gradient.js'

// Connects to data-controller="gradient"
export default class extends Controller {
  connect() {

    // Create your instance
    const gradient = new Gradient()

    // Call `initGradient` with the selector to your canvas
    gradient.initGradient('#gradient-canvas')
  }
}
