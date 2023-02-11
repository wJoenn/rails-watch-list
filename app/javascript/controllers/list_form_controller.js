import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="list-form"
export default class extends Controller {
  connect() {
    if (this.formTarget.dataset.showListForm === "true") this.formTarget.classList.remove("d-none")

    window.addEventListener("keyup", event => {
      if (event.key === "Escape") {
        this.formTarget.classList.add("d-none")
        document.querySelector("body").classList.remove("stop-scrolling")
      }
    })
  }

  static targets = ["form"]

  hideForm(event) {
    if (event.currentTarget === event.target) {
      this.formTarget.classList.add("d-none")
      document.querySelector("body").classList.remove("stop-scrolling")
    }
  }

  showForm() {
    this.formTarget.classList.remove("d-none")
    document.querySelector("body").classList.add("stop-scrolling")
  }
}
