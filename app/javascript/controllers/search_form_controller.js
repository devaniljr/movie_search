import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  connect() {
    this.element.querySelector("input[name='query']").addEventListener("keydown", e => {
      if (e.keyCode === 8 || e.keyCode === 46) {
        e.preventDefault();
        this.element.querySelector("input[name='query']").value = ""
        this.element.requestSubmit()
      }
    });
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 300)
  }
}
