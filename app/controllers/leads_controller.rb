class LeadsController < ApplicationController
  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(params[:lead])
    @lead.save ? redirect_to(effectived_lead_path) : render(:new)
  end

  def effectived
  end
end