class BacheloretteContestantsController < ApplicationController
  def index
    @bach = Bachelorette.find(params[:bachelorette_id])
  end
end
