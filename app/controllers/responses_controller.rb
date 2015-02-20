class ResponsesController < ApplicationController
  def new
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)
    if @response.save
      redirect_to bills_path, notice: 'Vote has been submitted.'
    end
  end

  private

  def response_params
    params.require(:response).permit(:id, :vote, :bill_id)
  end
end
