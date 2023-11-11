import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredients"
export default class extends Controller {
  addIngredient() {
    console.log("Add ingredient method called");
    const ingredientList = this.element.querySelector("ul");
    const lastIngredient = ingredientList.lastElementChild.previousElementSibling;
    const newIngredient = lastIngredient.cloneNode(true);
    const inputFields = newIngredient.querySelectorAll("input");

    inputFields.forEach((field) => {
      field.name = field.name.replace(/\d+/, (match) => parseInt(match, 10) + 1);
      field.value = "";
    });

    ingredientList.insertBefore(newIngredient, ingredientList.lastElementChild);
  }
}
