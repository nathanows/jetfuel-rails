class Url < ActiveRecord::Base
  validates :long, presence: true
  validates :short, uniqueness: true
  before_validation :generate_short_code, on: [:create]
  before_save :smart_add_url_protocol

  private

  def generate_short_code
    length = 6
    self.short = rand(36**length).to_s(36)
  end

  def smart_add_url_protocol
    unless self.long[/\Ahttp:\/\//] || self.long[/\Ahttps:\/\//]
      self.long = "http://#{self.long}"
    end
  end
end