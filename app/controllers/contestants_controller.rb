class ContestantsController < ApplicationController
  def show
    @contestant = Contestant.find(params[:id])
  end
end
