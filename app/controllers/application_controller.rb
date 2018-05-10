class ApplicationController < ActionController::API
  include Response

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found) #error 404
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, :unprocessable_entity) #error 422
  end

end
