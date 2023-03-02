class ApplicationController < ActionController::Base
  before_action(:load_current_current_company)
  
  # Uncomment line 5 in this file and line 3 in CurrentCompanyAuthenticationController if you want to force current_companies to sign in before any other actions.
  # before_action(:force_current_company_sign_in)
  
  def load_current_current_company
    the_id = session[:current_company_id]
    
    @current_current_company = CurrentCompany.where({ :id => the_id }).first
  end
  
  def force_current_company_sign_in
    if @current_current_company == nil
      redirect_to("/current_company_sign_in", { :notice => "You have to sign in first." })
    end
  end

  before_action(:load_current_user)
  
  # Uncomment line 5 in this file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
