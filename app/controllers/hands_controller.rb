class HandsController < ApplicationController
  def score
    render json: { "score": "high ace" }
  end
end
