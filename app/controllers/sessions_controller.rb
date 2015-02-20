class SessionsController < ApplicationController

  def new
  end

  def create
    staff = Staff.find_by_email(params[:email])
    if staff && staff.authenticate(params[:password])
      session[:staff_id] = staff.id
      flash[:notice] = "Welcome!"
      redirect_to bills_path
    else
      flash.now[:notice] = "Invalid e-mail or password."
    end
  end

end
