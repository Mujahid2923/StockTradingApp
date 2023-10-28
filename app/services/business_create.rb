# frozen_string_literal: true

# Business Creation
class BusinessCreate
  attr_accessor :current_user, :params

  def initialize(current_user:, params:)
    @current_user = current_user
    @params = params
  end

  def call
    @business = Business.new(params)

    @business.save ? true : false
  end
end
