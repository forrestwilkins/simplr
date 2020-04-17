class TemplatesController < ApplicationController
  before_action :set_lil_c, only: [:lil_c, :lil_c_sign_up]
  before_action :fw_only
  before_action :set_fwc

  layout :get_layout

  def set_scroll_to
    session[:scroll_to] = params[:scroll_to]
    render :js => "window.location = '#{root_url}'"
  end

  def finished_scrolling
    session.delete :scroll_to
  end

  def co
    @fwc_home = true
  end

  def lil_c
    @lil_c_home = true
  end

  private

  def record_visit

  end

  def set_lil_c
    @lil_c = true
  end

  def set_fwc
    @forrest_web_co = true
  end

  def fw_only
    unless forrest_web_co? or forrest_wilkins?
      redirect_to home_path
    elsif anrcho?
      redirect_to proposals_path
    end
  end
end
