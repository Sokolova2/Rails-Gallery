import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
  connect(){
    this.masonry();
  }
  masonry(){
    let masonryContainer = document.querySelector('.masonry-container');
    if (masonryContainer) {
      imagesLoaded(masonryContainer, function () {
        new window.Masonry(masonryContainer, {
          itemSelector: '.masonry-item',
          percentPosition: true,
          gutter: 0,
        });
      });
    }
  }
}




