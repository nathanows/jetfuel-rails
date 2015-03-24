class Api::V1::UrlController < ApplicationController
  def index
    @urls = Url.all

    render json: @urls
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      TitleWorker.perform_async(@url.id)
      render json: { message: "URL created!", url: @url }
    else
      render json: { message: "Couldn't create URL, please try again.", errors: @url.errors.full_messages }
    end
  end

  private

  def url_params
    params.require(:url).permit(:long, :title)
  end
end
