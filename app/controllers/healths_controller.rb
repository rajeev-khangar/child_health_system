class HealthsController < ApplicationController
  include HealthsHelper
  before_action :authenticate_user!


  def index
    babies = Baby.all
    height_age_chart_data(babies)
    weight_age_chart_data(babies)
  end

end