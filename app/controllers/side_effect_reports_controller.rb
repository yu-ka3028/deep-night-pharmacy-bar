class SideEffectReportsController < ApplicationController
  def show
    @report = SideEffectReport.find(params[:id])
    @og_title = "副作用レポート"
    @og_description = @report.ai_response.truncate(100)
  end
end
