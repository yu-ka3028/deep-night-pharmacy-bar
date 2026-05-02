class PrescriptionsController < ApplicationController
  def create
    # Claude API連携は issue #4 で実装
    @topic = Topic.find(params[:topic_id])
    @answer = params[:answer]
    redirect_to prescription_path("preview")
  end

  def show
    # Claude API連携は issue #4 で実装
  end
end
