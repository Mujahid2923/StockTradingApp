# frozen_string_literal: true

# Business Update
class BusinessUpdate < Base
  def call
    business = Business.find(id)

    authorize! business, to: :update?

    business.update(params) ? true : false
  end
end
