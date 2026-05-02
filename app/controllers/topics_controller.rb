class TopicsController < ApplicationController
  def show
    @topic = Topic.order("RANDOM()").first
  end
end
