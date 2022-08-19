import { Controller } from "@hotwired/stimulus"
import Rails from '@rails/ujs';
Rails.start();

export default class extends Controller {
  static targets  = [ "form", "output"]
  static values   = { url: String }
  debugger
  connect() {
    debugger
  }

  handleValidation(e) {
    debugger
  }

  handleChange(event) {
    debugger
    Rails.ajax({
      url: this.urlValue,
      type: "POST",
      data: new FormData(this.formTarget),
      success: (data) => {
        this.outputTarget.innerHTML = data;
      },
    })
  }
}
