class CurrentCompanyAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force current_companies to sign in before any other actions.
  # skip_before_action(:force_current_company_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "current_company_authentication/sign_in.html.erb" })
  end

  def create_cookie
    current_company = CurrentCompany.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if current_company != nil
      are_they_legit = current_company.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/current_company_sign_in", { :alert => "Incorrect password." })
      else
        session[:current_company_id] = current_company.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/current_company_sign_in", { :alert => "No current_company with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "current_company_authentication/sign_up.html.erb" })
  end

  def create
    @current_company = CurrentCompany.new
    @current_company.email = params.fetch("query_email")
    @current_company.password = params.fetch("query_password")
    @current_company.password_confirmation = params.fetch("query_password_confirmation")

    save_status = @current_company.save

    if save_status == true
      session[:current_company_id] = @current_company.id
   
      redirect_to("/", { :notice => "Current company account created successfully."})
    else
      redirect_to("/current_company_sign_up", { :alert => @current_company.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "current_company_authentication/edit_profile.html.erb" })
  end

  def update
    @current_company = @current_current_company
    @current_company.email = params.fetch("query_email")
    @current_company.password = params.fetch("query_password")
    @current_company.password_confirmation = params.fetch("query_password_confirmation")
    
    if @current_company.valid?
      @current_company.save

      redirect_to("/", { :notice => "Current company account updated successfully."})
    else
      render({ :template => "current_company_authentication/edit_profile_with_errors.html.erb" , :alert => @current_company.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_current_company.destroy
    reset_session
    
    redirect_to("/", { :notice => "CurrentCompany account cancelled" })
  end
 
end
