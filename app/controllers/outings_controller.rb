class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
  end
end
