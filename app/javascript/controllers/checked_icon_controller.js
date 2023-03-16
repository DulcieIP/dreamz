import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checked-icon"
export default class extends Controller {
  connect() {
    console.log("coucou from checked_icon controller");

    const labels = document.querySelectorAll('.scene-wrapper label');

    // Add a click event listener to each label
    labels.forEach(label => {
      label.addEventListener('click', event => {
        // Get the icon element inside the clicked label
        const icon = label.querySelector('i');

        // Toggle the "fa-regular" and "fa-circle-check" classes on the icon element
        if (icon.classList.contains('fa-regular')) {
          icon.classList.remove('fa-regular');
          icon.classList.add('fa-solid', 'fa-circle-check');
        } else {
          icon.classList.remove('fa-solid', 'fa-circle-check');
          icon.classList.add('fa-regular');
        }
      });
    });
  }
}
