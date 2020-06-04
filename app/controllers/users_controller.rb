class UsersController < ApplicationController 
  
  def index

    @all_users = User.all.order({ :created_at => :desc})

    render( :template => "/user_templates/list_of_users.html.erb")
  end

  def display_user

    @the_user = User.where( { :username => params.fetch(:username)}).at(0)

    @user_photos = Photo.where( { :owner_id => @the_user.id})

    render( :template => "user_templates/display_user.html.erb")

  end

  def insert_user
    
    @new_user = User.new
    @new_user.username = params.fetch( :input_username )
    @new_user.save

    redirect_to( '/users/' + @new_user.username )

  end

  def delete_user

    @the_user = User.where( :id => params.fetch( :id )).at(0)
    @deleted_username = @the_user.username
    @the_user.destroy

    redirect_to('/users/')

  end

end