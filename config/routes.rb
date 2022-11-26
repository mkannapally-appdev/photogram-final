Rails.application.routes.draw do
  # Routes for the Photo resource:


  get("/users" , {:controller => "users" , :action => "index"})

  get("/users/:username" , {:controller => "users" , :action => "show"})

  get("/users/:username/feed" , {:controller => "users" , :action => "user_feed"})

  get("/" , {:controller => "users" , :action => "index"})


  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })


  # Add Like
  post("/insert_like" , {:controller => "photos" , :action => "like"})

  # Delete like
  get("/delete_like/:path_id" , {:controller => "photos" , :action => "unlike"})

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------
# Comment routes

  # CREATE
  post("/add_new_comment", { :controller => "photos", :action => "create_comment" })

  # DELETE

  get("/delete_comment/:the_comment_id", { :controller => "comments", :action => "destroy"})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
