require 'rails_helper'

RSpec.describe RouterController do
  it "should redirect to the long url" do
    url = create(:url)
    get :show, short: url.short
    expect(response.status).to eq(302)
    expect(response.header["Location"]).to eq(url.long)
  end
end
