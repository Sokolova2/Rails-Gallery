import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
  connect(){
    this.upload_image()
  }
  upload_image(){
    const fileUpload =  document.getElementById('file-upload')
    const fileName = document.getElementById('file-name')

    if(fileUpload.files.length > 0){
      fileName.textContent = fileUpload.files[0].name;
    }else{
      fileName.textContent = 'No file chosen';
    }
  }
}






