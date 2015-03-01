# Describes a KimonoLabs API endpoint
class Endpoint < ActiveRecord::Base
  validates :kimono_id, presence: true

  has_many :schemas, inverse_of: :endpoint
  has_many :feeds, inverse_of: :endpoint
end
