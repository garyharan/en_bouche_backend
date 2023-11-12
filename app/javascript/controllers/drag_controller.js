import { Controller } from "@hotwired/stimulus";
import Sortable from 'sortablejs';

export default class extends Controller {
  connect() {
    console.log("Connected");
    var sortable = Sortable.create(this.element, {
      onEnd: this.assignNewPositions.bind(this)
    });
  }

  assignNewPositions() {
    const positionFields = this.element.querySelectorAll("input[name*='position']");
    positionFields.forEach((field, index) => {
      field.value = index + 1;
    });
  }
}
