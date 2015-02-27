# Describes a KimonoLabs API endpoint
class Endpoint < ActiveRecord::Base
  validates :kimono_id, presence: true
end
