class PicturesController < ApplicationController
  def create
    @picture = Picture.new(picture_params)

    respond_to do |format|
    end
  end
end
