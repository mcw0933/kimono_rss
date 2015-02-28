# Describes the JSON schema for a KimonoLabs endpoint as a series of effective, versioned structures.
class Schema < ActiveRecord::Base
  validates :structure, presence: true

  belongs_to :endpoint, inverse_of: :schemas

  # Initialize effective range
  after_initialize :default_values
  before_save :default_values

  private

  # Ideally we would do this with a database default, but ActiveRecord doesn't like that:

  # ArgumentError: bad value for range
  # from ... gems/activerecord-4.2.0/lib/active_record/connection_adapters/postgresql/oid/range.rb:39:in `initialize'
  def default_values
    self.effective ||= DateTime.new(1, 1, 1)..DateTime::Infinity.new
  end
end
