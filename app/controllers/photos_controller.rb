class PhotosController < ApplicationController 
  
  def index

    @all_photos = Photo.all.order({ :created_at => :desc})

    if session.fetch( :deleted_photo_id).class != NilClass
      @deleted_photo_id = session.fetch( :deleted_photo_id)
      session.store( :deleted_photo_id, nil)
    end

    render( :template => "/photo_templates/list_of_photos.html.erb")

  end


  def display_photo

    @the_photo = Photo.where( { :id => params.fetch(:photo_id)}).at(0)

    render( :template => "/photo_templates/display_photo.html.erb")

  end

  def insert_photo

    @new_photo = Photo.new
    @new_photo.image = params.fetch( :input_image )
    @new_photo.caption = params.fetch( :input_caption )
    @new_photo.owner_id = params.fetch( :input_owner_id)
    @new_photo.save

    redirect_to('/photos/' + @new_photo.id.to_s)

  end

  def delete_photo

    @the_photo = Photo.where( :id => params.fetch( :photo_id )).at(0)
    session.store( :deleted_photo_id , @the_photo.id )
    @the_photo.destroy

    redirect_to('/photos/')

  end

  def insert_comment

    @the_photo = Photo.where( :image => params.fetch( :input_photo_id) ).at(0)
    @the_comment = Comment.new
    @the_comment.body = params.fetch( :input_body)
    @the_comment.author_id = params.fetch( :input_author_id)
    @the_comment.photo_id = @the_photo.id
    @the_comment.save

    redirect_to('/photos/' + @the_photo.id.to_s ) 

  end

end