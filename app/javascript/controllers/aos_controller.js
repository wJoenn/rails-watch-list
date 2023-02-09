import { Controller } from "@hotwired/stimulus"
import AOS from 'aos'

export default class extends Controller {
  connect() {
    console.log("AoS initialized")
    AOS.init();
  }
}
