class SideEffectsController < ApplicationController
  def new
  end

  def create
    user_input = params[:user_input].to_s.strip

    if user_input.blank?
      redirect_to new_side_effect_path, alert: "今日やったことを入力してください"
      return
    end

    ai_response = ClaudeService.new.generate_side_effect_report(user_input: user_input)

    report = SideEffectReport.create!(
      user_input: user_input,
      ai_response: ai_response
    )

    redirect_to side_effect_report_path(report)
  end
end
