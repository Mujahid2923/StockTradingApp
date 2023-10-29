# frozen_string_literal: true

# Business Creation
class BusinessCreate < Base
  def call
    authorize! Business, to: :create?

    business = Business.new(params)

    business.save ? true : false
  end
end
