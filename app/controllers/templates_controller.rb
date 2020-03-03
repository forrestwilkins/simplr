class TemplatesController < ApplicationController
  before_action :fw_only
  before_action :set_fwc
  layout :get_layout

  def lil_c
    @lil_c = true
  end

  def co
    @fwc_home = true
  end

  private

  def set_fwc
    @forrest_web_co = true
  end

  def fw_only
    unless forrest_web_co? or forrest_wilkins? or in_dev?
      redirect_to '/404'
    end
  end
end
