class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV['BASIC_AUTH_USER'], password: ENV['BASIC_AUTH_PASS'] if ENV['BASIC_AUTH_USER'].present? && !Rails.env.test?
end
