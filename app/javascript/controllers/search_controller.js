import { Controller } from "@hotwired/stimulus"


console.log("yeah");

export default class extends Controller {
  static targets = ["button", "link", "panel"]



panel() {


  this.panelTarget.classList.remove("d-none")
  this.linkTarget.classList.remove("d-none")
}

reset() {
  this.buttonTarget.classList.remove("d-none")
  this.linkTarget.classList.add("d-none")
  this.panelTarget.classList.add("d-none")
}
}
