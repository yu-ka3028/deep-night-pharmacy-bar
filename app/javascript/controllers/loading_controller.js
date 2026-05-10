import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    message: { type: String, default: "処理中…" },
    icon: { type: String, default: "" }
  }

  show() {
    if (this.overlay) return
    const el = document.createElement("div")
    el.className = "loading-overlay"
    el.innerHTML = `
      <div class="loading-content">
        <img src="${this.iconValue}" class="loading-pharmacist" alt="" aria-hidden="true">
        <p class="loading-message">${this.messageValue}</p>
      </div>
    `
    this.overlay = el
    document.body.appendChild(el)
  }
}
