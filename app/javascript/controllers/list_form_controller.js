import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if (this.formTarget.dataset.showListForm === "true") this.formTarget.classList.remove("d-none")

    window.addEventListener("keyup", event => {
      if (event.key === "Escape") this.formTarget.classList.add("d-none")
    })
  }

  static targets = ["form"]

  hideForm(event) {
    if (event.currentTarget === event.target) this.formTarget.classList.add("d-none")
  }

  showForm() {
    this.formTarget.classList.remove("d-none")
  }
}
