import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredients"
export default class extends Controller {
  addIngredient() {
    console.log("Add ingredient method called");
    const ingredientList = this.element.querySelector("ul");
    const listItems = ingredientList.querySelectorAll("li");
    const _AddIngredientButtonLi = listItems[listItems.length - 1];
    const lastIngredientLi = listItems[listItems.length - 2];

    const newIngredient = lastIngredientLi.cloneNode(true);
    const inputFields = newIngredient.querySelectorAll("input");

    inputFields.forEach((field) => {
      field.name = field.name.replace(/\d+/, (match) => parseInt(match, 10) + 1);
      field.value = "";
    });

    ingredientList.insertBefore(newIngredient, ingredientList.lastElementChild);
    newIngredient.style.display = "list-item";
  }

  removeIngredient(event) {
    const liElement = event.currentTarget.closest("li");
    liElement.querySelector("input[name*='_destroy']").value = 1;
    liElement.style.display = "none";
  }
}
