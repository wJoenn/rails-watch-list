import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark-form"
export default class extends Controller {
  connect() {
    if (this.formTarget.dataset.showBookmarkForm === "true") this.toggleForm()
  }

  static targets = ["form", "button"]

  toggleForm() {
    this.formTarget.classList.toggle("h-0")
    this.buttonTarget.classList.toggle("tilted")
  }
}
