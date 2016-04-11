class CorsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  before_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    if access_allowed?
      set_headers
      headers["Access-Control-Allow-Headers"] = 'Origin, Accept, Content-Type, Authorization, Token'
    else
      head :forbidden
    end
  end

  def cors_preflight_check
    if access_allowed?
      if request.method == 'OPTIONS'
        set_headers
        headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
        head :ok
      end
    else
      head :forbidden
    end
  end

  def set_headers
    headers["Access-Control-Allow-Origin"]  = request.env['HTTP_REFERER']   # HTTP_ORIGIN
    headers["Access-Control-Allow-Methods"] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers["Access-Control-Max-Age"] = '1728000'
  end

  def access_allowed?
    @menu = Menu.find_by_url(request.env['HTTP_REFERER'])  # HTTP_ORIGIN
    if @menu.nil?
      pattern = /^(\w+):\/\/([\w\.]+).[\d\.]*/
      @menu = Menu.find_by_url(request.env['HTTP_REFERER'].slice(pattern))
    else
      session[:menu_id] = @menu.id
    end
    begin
      return request.env['HTTP_REFERER'].include?(@menu.url)  # HTTP_ORIGIN
    rescue
    end
    session.delete(:menu_id)
    return false
  end

end
