// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core";
import "bootstrap"

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

function init_masonry() {
    let masonryContainer = document.querySelector(".masonry-container");
    if (masonryContainer) {
        imagesLoaded(masonryContainer, function () {
            new window.Masonry(masonryContainer, {
                itemSelector: ".masonry-item",
                percentPosition: true,
                gutter: 0,
            });
        });
    }
}

document.addEventListener("turbo:load", init_masonry);
document.addEventListener("DOMContentLoaded", init_masonry);

// FIXME
import "trix"
import "@rails/actiontext"
