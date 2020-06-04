Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:username", { :controller => "users", :action => "display_user"})

  get("/insert_user_record/", { :controller => "users", :action => "insert_user"})

  get("/update_user/:user_id", { :controller => "users", :action => "update_user"})

  get("/photos/", { :controller => "photos", :action => "index"})

  get("/insert_photo_record/", { :controller => "photos", :action => "insert_photo"})
  
  get("/photos/:photo_id", { :controller => "photos", :action => "display_photo"})

  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete_photo"} )

  get("/insert_comment_record/", { :controller => "photos", :action => "insert_comment"} )

end
