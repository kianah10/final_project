Rails.application.routes.draw do



  # Routes for the Connections of connection resource:

  # CREATE
  post("/insert_connections_of_connection", { :controller => "connections_of_connections", :action => "create" })
          
  # READ
  get("/connections_of_connections", { :controller => "connections_of_connections", :action => "index" })
  
  get("/connections_of_connections/:path_id", { :controller => "connections_of_connections", :action => "show" })
  
  # UPDATE
  
  post("/modify_connections_of_connection/:path_id", { :controller => "connections_of_connections", :action => "update" })
  
  # DELETE
  get("/delete_connections_of_connection/:path_id", { :controller => "connections_of_connections", :action => "destroy" })

  #------------------------------

  # Routes for the Current company account:

  # SIGN UP FORM
  get("/current_company_sign_up", { :controller => "current_company_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_current_company", { :controller => "current_company_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_current_company_profile", { :controller => "current_company_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_current_company", { :controller => "current_company_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_current_company_account", { :controller => "current_company_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/current_company_sign_in", { :controller => "current_company_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/current_company_verify_credentials", { :controller => "current_company_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/current_company_sign_out", { :controller => "current_company_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Connection resource:

  # CREATE
  post("/insert_connection", { :controller => "connections", :action => "create" })
          
  # READ
  get("/connections", { :controller => "connections", :action => "index" })
  
  get("/connections/:path_id", { :controller => "connections", :action => "show" })
  
  # UPDATE
  
  post("/modify_connection/:path_id", { :controller => "connections", :action => "update" })
  
  # DELETE
  get("/delete_connection/:path_id", { :controller => "connections", :action => "destroy" })

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

end
