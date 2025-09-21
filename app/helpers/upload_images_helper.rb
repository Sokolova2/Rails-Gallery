# frozen_string_literal: true

module UploadImagesHelper
  def image_category(category)
    case category
    when cats
      [
        'https://media.4-paws.org/d/2/5/f/d25ff020556e4b5eae747c55576f3b50886c0b90/cut%20cat%20serhio%2002-1813x1811-720x719.jpg',
        'https://t3.ftcdn.net/jpg/02/36/99/22/360_F_236992283_sNOxCVQeFLd5pdqaKGh8DRGMZy7P4XKm.jpg',
        'https://www.whiskas.com.ph/cdn-cgi/image/height=617,f=auto,quality=90/sites/g/files/fnmzdf8166/files/2025-05/whiskas04_1725883735474.jpg',
        'https://www.hshv.org/wp-content/uploads/2020/09/GettyImages-1152049636.jpg',
        'https://scitechdaily.com/images/Bengal-Cat-With-Glitter-Trait.jpg',
        'https://d2zp5xs5cp8zlg.cloudfront.net/image-88409-800.jpg',
        'https://static01.nyt.com/images/2024/03/05/autossell/00TB-MEOWS/00TB-MEOWS-square640.jpg',
        'https://sonoraliveoakvet.com/wp-content/uploads/2023/09/cat-coughing-scaled.jpg',
        'https://blog.nature.org/wp-content/uploads/2022/05/29473548577_8414ac0a6e_k.jpg',
        'https://cloud9vets.co.uk/wp-content/uploads/2018/10/how-long-do-cats-live.jpg',
        'https://wwfgifts-files.worldwildlife.org/wwfgifts/images/black-footed-cat-large-photo.jpg'
      ]
    when dogs
      [
        'https://www.tierschutzbund.de/fileadmin/_processed_/7/c/csm_schwarzer_Hund_auf_Wiese_c_xkunclova-Shutterstock_01_5566a80d25.jpg',
        'https://cdn.pixabay.com/photo/2015/11/17/13/13/puppy-1047521_1280.jpg',
        'https://www.shutterstock.com/image-photo/happy-puppy-welsh-corgi-14-600nw-2270841247.jpg',
        'https://www.diamondpet.com/wp-content/uploads/2023/07/brown-chihuahua-standing-in-grass-071723.jpg',
        'https://cdn.britannica.com/92/212692-050-D53981F5/labradoodle-dog-stick-running-grass.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWEarDMn9AeXlaCM1o6nKeK07J4c-gpaxdPQ&s',
        'https://yumove.co.uk/cdn/shop/articles/Dog_ageing_puppy_da5d1eeb-9265-4925-adc2-24396ff6e7aa.jpg?v=1739461142',
        'https://c.files.bbci.co.uk/18d0/live/88ff5600-d979-11ef-a5c8-1da73bd59591.jpg',
        'https://hips.hearstapps.com/hmg-prod/images/teddy-6617f86ca5b27.jpg?crop=1xw:0.5625xh;0,0.127xh',
        'https://www.dogstrust.org.uk/images/800x600/assets/2025-03/toffee%202.jpg'
      ]
    when birds
      [
        'https://cdn.britannica.com/10/250610-050-BC5CCDAF/Zebra-finch-Taeniopygia-guttata-bird.jpg',
        'https://gardenandgun.com/wp-content/uploads/2024/04/AdobeStock_475438898-1600x1067.jpeg',
        'https://supertails.com/cdn/shop/articles/bird-breed_2cd7d88f-2438-4acf-9bd8-64c561ae55ae.jpg?v=1747132798',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTzF8L5pJjdN0SK1hIOt4L1aUuyCAsVa_6RA&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkcdBu3lGXaclMCh50g36VrUOHWs5v396pYg&s',
        'https://res.cloudinary.com/dr0zfbman/images/w_1920,h_1130,c_scale/f_auto,q_auto:good/v1743055135/WordPress%20Content/Birds-1_25561b7c13/Birds-1_25561b7c13.jpg?_i=AA',
        'https://ecologytraining.co.uk/wp-content/uploads/2021/07/Birds-for-Beginners.jpg',
        'https://images.theconversation.com/files/456350/original/file-20220405-6157-c2dbrq.jpeg?ixlib=rb-4.1.0&rect=20%2C287%2C2287%2C1142&q=45&auto=format&w=1356&h=668&fit=crop',
        'https://images.squarespace-cdn.com/content/v1/5d832608f3dbc267e2e21b59/932f3493-b14b-4ff6-99d4-bf938c662ea2/iStock-1243410279.jpg',
        'https://naturealberta.ca/wp-content/uploads/2025/04/6.-Tree-Swallow-NICK-CARTER.jpg',
        'https://live.staticflickr.com/65535/51980751292_38b3d98b76_b.jpg'
      ]
    when hamsters
      [
        'https://www.thesprucepets.com/thmb/PygsykINEzCIYwnH9gBYKswujE4=/3000x0/filters:no_upscale():strip_icc()/hamsters-overview-1238973-hero-aa6ddf6f33c64da1b12103c8ba556bc3.jpg',
        'https://www.petscorner.co.uk/Images/Article/large/pc-ah-article-sa-syrian-hamster.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/European_hamster_%28Cricetus_cricetus%29_Meidling.jpg/1200px-European_hamster_%28Cricetus_cricetus%29_Meidling.jpg',
        'https://www.burgesspetcare.com/wp-content/uploads/2020/09/Hamsters-01-scaled-1024x683.jpg',
        'https://www.burgesspetcare.com/wp-content/uploads/2020/02/shutterstock_1672897153.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdoNhc58ev7PIQwmjhwj4ww9F0IwdRsuKq2g&s',
        'https://static.wikia.nocookie.net/rodentcare/images/5/53/Golden_Hamster.jpg/revision/latest/scale-to-width-down/700?cb=20120730042156',
        'https://navs.org/wp-content/uploads/2025/06/post-card-hamster-smelling.webp',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg1M6F4up89Lk5fkKYgdtTr-0n6npXO3_39A&s',
        'https://spca.bc.ca/wp-content/uploads/2024/03/small-animal-hamster-white-grey-eye-contact-scaled.jpg',
        'https://www.zooplus.co.uk/magazine/wp-content/uploads/2018/03/hamster-language.webp'
      ]
    when squirrel
      [
        'https://upload.wikimedia.org/wikipedia/commons/1/15/EasternGraySquirrel_GAm.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkAz0AkRXuGixlahXchHNGy6yvoeFkB1YEMw&s',
        'https://www.dupageforest.org/hubfs/Your-Links-to-Nature/Photos/Blog-Nature-Storytellers/10%20Nutty%20Squirrel%20Facts/squirrel%20cropped.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjIFOqAP8B7C4iTw0UVCeSrBzlly0BFbTQzw&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_8jBy-rU-Sk-iu5_OiDfaVUSd78ZNEu5OBQ&s',
        'https://cottagelife.com/wp-content/uploads/2015/01/shutterstock_1904408467.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhcHWnsQUnnFRsWaQ_J41wolCbkJBm-H8r5w&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4K5ahg00cQaACe0YCcw8ns6aZqPmowG71gQ&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-RUra5lXJ8Ip1rwoN5SWEby0i_VklfHtGwQ&s',
        'https://iowredsquirreltrust.co.uk/wp-content/uploads/2024/06/448472507_1221399875687694_4383553167558339023_n-scaled.jpg',
        'https://ichef.bbci.co.uk/news/1024/branded_news/a221/live/ca074c20-b0c0-11ef-b2d5-1f470ee03eb2.png'
      ]
    end
  end
end
