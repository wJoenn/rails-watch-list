import { Controller } from "@hotwired/stimulus"

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
