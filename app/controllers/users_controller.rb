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

end