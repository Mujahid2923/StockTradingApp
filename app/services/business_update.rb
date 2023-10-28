# frozen_string_literal: true

# Business Update
class BusinessUpdate
  attr_accessor :user, :params, :id

  def initialize(id:, current_user:, params:)
    @user = current_user
    @params = params
    @id = id
  end

  def call
    @business = Business.find(id)

    authorize! @business, to: :create?

    @business.update(params) ? true : false
  end
end
