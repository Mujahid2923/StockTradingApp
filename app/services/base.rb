# frozen_string_literal: true

# Business Creation
class Base
  include ActionPolicy::GraphQL::Behaviour

  attr_accessor :current_user, :params, :id

  def initialize(current_user:, params:, id: nil)
    @current_user = current_user
    @params = params
    @id = id
  end
end
