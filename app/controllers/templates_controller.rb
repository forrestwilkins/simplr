class TemplatesController < ApplicationController
  before_action :set_fwc
  
  def co
    @fwc_home = true
  end
  
  private
  
  def set_fwc
    @forrest_web_co = true
  end
end
