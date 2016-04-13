class CorsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    set_headers
    headers["Access-Control-Allow-Headers"] = 'Origin, Accept, Content-Type, Authorization, Token'
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      set_headers
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      head :ok
    end
  end

  def set_headers
    headers["Access-Control-Allow-Origin"]  = request.env['HTTP_REFERER']   # HTTP_ORIGIN
    headers["Access-Control-Allow-Methods"] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers["Access-Control-Max-Age"] = '1728000'
  end

end
