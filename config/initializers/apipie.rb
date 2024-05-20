# frozen_string_literal: true

Apipie.configure do |config|
  config.app_name                = 'Rails Bank'
  config.api_base_url            = ''
  config.doc_base_url            = '/documentacao'
  config.app_info                = 'Endpoint base de um banco'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.validate = false
end
