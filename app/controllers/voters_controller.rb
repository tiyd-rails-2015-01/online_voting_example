class VotersController < ApplicationController
  before_action :set_voter, only: [:show, :edit, :update]
  before_action :logged_in?

  def index
  end

  def new
    @voter = Voter.new
  end

  def edit
  end

  def show
  end

  def create
    @voter = Voter.new(voter_params)
    if @voter.save
      redirect_to @voter, notice: "Voter Saved!"
    else
      redirect_to new_voter_path, notice: "All fields are required."
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_voter
    @voter = Voter.find(params[:id])
  end

  def voter_params
    params.require(:voter).permit(:email, :name, :password)
  end
end
