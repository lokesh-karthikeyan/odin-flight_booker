import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['passenger']
  static values = { count: Number }

  add () {
    if (this.countValue > 3) {
      return
    }

    const formContainer = document.querySelector('.passenger-form-container')

    const nameFieldIdAttr = `booking_passengers_attributes_${this.countValue}_name`
    const nameFieldNameAttr = `booking[passengers_attributes][${this.countValue}][name]`

    const emailFieldIdAttr = `booking_passengers_attributes_${this.countValue}_email`
    const emailFieldNameAttr = `booking[passengers_attributes][${this.countValue}][email]`

    const template = document.querySelector('template')
    const newForm = template.content.cloneNode(true)

    const labels = [...newForm.querySelectorAll('label')]
    labels[0].setAttribute('for', nameFieldIdAttr)
    labels[1].setAttribute('for', emailFieldIdAttr)

    const inputs = [...newForm.querySelectorAll('input')]
    inputs[0].setAttribute('name', nameFieldNameAttr)
    inputs[1].setAttribute('name', emailFieldNameAttr)

    this.countValue++
    formContainer.append(newForm)
  }

  remove () {
    if (this.countValue < 2) {
      return
    }

    const passengerForm = [...document.querySelectorAll('.passenger-fields')]
    const lastElement = passengerForm[passengerForm.length - 1]

    lastElement.remove()
    this.countValue--
  }
}
