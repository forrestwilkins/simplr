class BlogController < ApplicationController
  before_action :set_fwc
  layout 'co'

  def index
    @blog = true
    @post = Post.new
  end

  private

  def set_fwc
    @forrest_web_co = true
  end
end
