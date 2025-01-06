import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="statroll"
export default class extends Controller {
  static targets = [ "value", "points" ]
  static values = { base: Number }

  increment() {
    var pa = Number( document.querySelector("#points-available").textContent )
    if ( pa > 0 ) {
      this.valueTarget.value = Number(this.valueTarget.value) + 1
      document.querySelector("#points-available").textContent = pa - 1
    } 
  }

  decrement() {
    var pa = Number( document.querySelector("#points-available").textContent )
    var roll = Number( document.querySelector("#initial-roll").textContent )
    var currentValue = Number( this.valueTarget.value )
    if ( (pa < roll) && (currentValue> this.baseValue) ) {
      this.valueTarget.value = currentValue - 1
      document.querySelector("#points-available").textContent = pa + 1
    } 
  }

  valueCheck() {

  }
}