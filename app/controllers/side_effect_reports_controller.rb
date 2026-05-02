class SideEffectReportsController < ApplicationController
  def show
    @report = SideEffectReport.find(params[:id])
  end
end
