import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["textarea"]

  clear() {
    this.textareaTarget.value = ""
  }
}
