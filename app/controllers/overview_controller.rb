class OverviewController < ApplicationController
  layout 'another'
  def index
   @time=Time.now
  end
end
