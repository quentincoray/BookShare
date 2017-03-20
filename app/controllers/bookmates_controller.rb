class BookmatesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:search]

  def search
    @address = params[:search]
    @bookmates = Bookmate.near(@address, 10)
    @hash = Gmaps4rails.build_markers(@bookmates) do |bookmate, marker|
      marker.lat bookmate.latitude
      marker.lng bookmate.longitude
      marker.infowindow render_to_string(partial: 'infowindow', locals: { bookmate: bookmate })
    end
  end
end
