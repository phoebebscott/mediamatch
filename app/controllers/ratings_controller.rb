class RatingsController < ApplicationController
  wrap_parameters format: :json
  respond_to :json, :html
end
