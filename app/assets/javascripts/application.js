import Rails from "@rails/ujs";
import { Turbo } from "@hotwired/turbo-rails";

// Initialize Rails UJS and Turbo
Rails.start();
Turbo.start();

console.log(Rails); // Check if Rails UJS is imported
console.log('Rails UJS has started'); // Confirm Rails UJS has started
console.log(Turbo); // Check if Turbo is imported
console.log('Turbo has started'); // Confirm Turbo has started

// Then, require statements for Sprockets
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require_tree .