import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="zones"
export default class extends Controller {
  connect() {
  }

  initialize() {
    this.element.setAttribute("data-action", "change->zones#loadZonePeople")
  }

  loadZonePeople() {
    const selectedZone = this.element.options[this.element.selectedIndex].value
    this.url = "/coincidences/fetch_zone_people?zone_id=" + selectedZone
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
