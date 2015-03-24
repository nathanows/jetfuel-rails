class RouterController < ApplicationController

  def show
    url = Url.find_by(short: params["short"])
    redirect_to URI.decode(url.long)
  end
end
