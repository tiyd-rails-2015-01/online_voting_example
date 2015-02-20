class SessionsController < ApplicationController

  def new
  end

  def create
      staff = Staff.find_by(email: params[:email].downcase)
      voter = Voter.find_by(email: params[:email].downcase)
    if staff && staff.authenticate(params[:password])
      session[:staff_id] = staff.id
      flash[:notice] = "Welcome!"
      redirect_to bills_path
    elsif voter && voter.authenticate(params[:password])
      session[:voter_id] = voter.id
      flash[:notice] = "Welcome!"
      redirect_to bills_path
    else
      flash.now[:notice] = "Invalid e-mail or password."
      render :new
    end
  end

  def destroy
    session[:staff_id] = nil
    session[:voter_id] = nil
    redirect_to log_in_path
  end

end
