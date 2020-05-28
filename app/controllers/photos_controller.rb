class PhotosController < ApplicationController 
  
  def index

    @all_photos = Photo.all.order({ :created_at => :desc})

    render( :template => "/photo_templates/list_of_photos.html.erb")

  end


  def display_photo

    @the_photo = Photo.where( { :id => params.fetch(:photo_id)}).at(0)

    render( :template => "/photo_templates/display_photo.html.erb")

  end

end