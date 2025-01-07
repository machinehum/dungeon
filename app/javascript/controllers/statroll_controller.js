import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="statroll"
export default class extends Controller {
  static targets = [ "value", "display", "incrementor", "decrementor" ]
  static values = { base: Number }

  connect() {
    this.buttonStatus()
  }

  increment() {
    var pa = Number( document.querySelector("#points-available").textContent )
    var roll = Number( document.querySelector("#initial-roll").textContent )
    if ( pa > 0 ) {
      this.valueTarget.value = this.displayTarget.textContent = Number(this.valueTarget.value) + 1
      document.querySelector("#points-available").textContent = pa - 1
    }
    this.buttonStatus()
  }

  decrement() {
    var pa = Number( document.querySelector("#points-available").textContent )
    var roll = Number( document.querySelector("#initial-roll").textContent )
    var currentValue = Number( this.valueTarget.value )
    if ( (pa < roll) && (currentValue > this.baseValue) ) {
      this.valueTarget.value = this.displayTarget.textContent = currentValue - 1
      document.querySelector("#points-available").textContent = pa + 1
    }
    this.buttonStatus()
  }

  buttonStatus() {
    // Decrementor status is individual -- if an attribute's value is at the floor, decrementor should be disabled. Otherwise it's enabled. 
    // Incrementor status is global (because we have no per-attribute cap) -- if points-available gets to zero, *all* incrementors should be disabled. 
    
    if ( this.valueTarget.value == this.baseValue ) {
      this.decrementorTarget.disabled = true
      this.displayTarget.classList.remove("bg-cyan-800")
    } else {
      this.decrementorTarget.disabled = false
      this.displayTarget.classList.add("bg-cyan-800")
    }

    var incVal = true
    if ( Number( document.querySelector("#points-available").textContent ) > 0 ) {
      incVal = false
    }
    const incrementors = document.querySelectorAll(".btn-incrementor")
    incrementors.forEach((inc) => {
      inc.disabled = incVal
    });
    document.querySelector("#save-stats").disabled = !incVal
  }

}