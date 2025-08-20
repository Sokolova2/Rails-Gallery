// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core";
//= require masonry/jquery.masonry

document.addEventListener("DOMContentLoaded", function(e){
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


document.addEventListener("DOMContentLoaded", function (){
    const button_english = document.getElementById('english')
    const button_russian = document.getElementById('russian')
    const button_ukraine = document.getElementById('ukraine')

    if(button_english) {
        button_english.addEventListener('click', function () {
            I18n.locale = en
        })
    }
    else if(button_russian){
        button_russian.addEventListener('click', function (){
            I18n.locale = ru
        })
    }
    else{
        button_ukraine.addEventListener('click', function (){
            I18n.locale = uk
        })
    }
})