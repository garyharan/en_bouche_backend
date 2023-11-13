import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Growing list controller connected");
  }

  addListItem() {
    console.log("Add list item method called");
    const list = this.element.querySelector("ul, ol");
    const listItems = list.querySelectorAll("li");
    const lastListItem = listItems[listItems.length - 2];

    const newListItem = lastListItem.cloneNode(true);
    const inputFields = newListItem.querySelectorAll("input, textarea, select");

    inputFields.forEach((field) => {
      field.name = field.name.replace(/\d+/, (match) => parseInt(match, 10) + 1);
      field.value = "";
    });

    list.insertBefore(newListItem, list.lastElementChild);
    newListItem.style.display = "list-item";

    // focus on the first visible input field of the new list item
    const firstInputField = newListItem.querySelector("input:not([type='hidden']), textarea:not([type='hidden'])");
    if (firstInputField) {
      firstInputField.focus();
    }
  }

  enableShortCutForAddingListItem(field) {
    field.addEventListener("keydown", (event) => {
      if (event.key === "Enter" && event.metaKey) {
        event.preventDefault();
        this.addListItem();
      }
    });
  }

  removeListItem(event) {
    console.log("Remove list item method called");
    const liElement = event.currentTarget.closest("li");
    liElement.querySelector("input[name*='_destroy']").value = 1;
    liElement.style.display = "none";
  }
}
