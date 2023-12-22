// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

var burgerBtn = document.getElementById('burgerBtn');
var mobile = document.getElementById('mobile');
burgerBtn.addEventListener('click', function() {
    mobile.classList.toggle('navigation');
}, false);