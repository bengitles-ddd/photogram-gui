Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})

  get("/photos", { :controller => "photos", :action => "index"})

  get("/users/:username", { :controller => "users", :action => "display_user"})

  get("/photos/:photo_id", { :controller => "photos", :action => "display_photo"})

  get("/update_user/:user_id", { :controller => "users", :action => "update_user"})

end
