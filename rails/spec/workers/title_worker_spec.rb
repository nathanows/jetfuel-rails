require 'rails_helper'

RSpec.describe TitleWorker do
  it "queue's jobs" do
    url = create(:url)
    expect do
      TitleWorker.perform_async(url.id)
    end.to change(TitleWorker.jobs, :size).by(1)
  end

  xit "pulls the title for a URL" do
    url = create(:url, long: "www.yahoo.com")
    expect(url.title).to eq(nil)
    Sidekiq::Testing.inline! do
      TitleWorker.perform_async(url.id)
      TitleWorker.drain
    end
    expect(url.title).to eq("Google")
  end
end
