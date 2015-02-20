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
      render :new
    end
  end

  def destroy
    session[:staff_id] = nil
    redirect_to log_in_path
  end

end
