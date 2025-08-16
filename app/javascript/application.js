// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core";
//= require masonry/jquery.masonry

document.addEventListener("DOMContentLoaded", function(){
    const fileInput = document.getElementById("image_upload");
    const form = document.getElementById("image-upload-form");

    if(fileInput && form){
        fileInput.addEventListener("change", function (){
            if (fileInput.files.length > 0){
                form.submit();
            }
        });
    }
});