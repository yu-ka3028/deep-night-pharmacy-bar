import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["textarea"]
  static values = { key: String }

  connect() {
    const saved = localStorage.getItem(this.keyValue)
    if (saved) this.textareaTarget.value = saved
  }

  save() {
    localStorage.setItem(this.keyValue, this.textareaTarget.value)
  }

  clear() {
    localStorage.removeItem(this.keyValue)
  }

  clearInput() {
    this.textareaTarget.value = ""
    localStorage.removeItem(this.keyValue)
  }
}
