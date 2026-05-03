class PrescriptionsController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    user_input = params[:answer].to_s.strip

    if user_input.blank?
      redirect_to play_path, alert: "回答を入力してください"
      return
    end

    ai_response = ClaudeService.new.generate_prescription(topic: topic, user_input: user_input)

    prescription = Prescription.create!(
      topic: topic,
      user_input: user_input,
      ai_response: ai_response
    )

    redirect_to prescription_path(prescription)
  end

  def show
    @prescription = Prescription.find(params[:id])
    @topic = @prescription.topic
    @og_title = "「#{@topic.name}」への服薬指導箋"
    @og_description = @prescription.ai_response.truncate(100)
  end
end
