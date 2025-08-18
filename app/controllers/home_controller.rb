class HomeController < ApplicationController
  def index
    @category = Category.all
    @images = Image.all

    Turbo::StreamsChannel.broadcast_update_to("mystr", target: "content", partial: "layouts/navbar")
  end
end
