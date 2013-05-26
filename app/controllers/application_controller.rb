class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_headers

  protected

  def set_headers
    response.headers['X-Access-Main-Program-Grid'] = "Ah, ah, ah... you didn't say the magic word..."
  end
end
