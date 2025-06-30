class TopController < ApplicationController
  layout false, only: [:index]
  def index; end

  def standby; end
end
