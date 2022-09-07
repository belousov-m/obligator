import { Turbo } from "@hotwired/turbo-rails";
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.element.style.cursor = 'pointer'

    const href = this.element.getAttribute('href')

    this.element.addEventListener('click', () => {
      Turbo.visit(href)
    })
  }
}
