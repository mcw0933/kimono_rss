# Describes a JSON content document at a particular point in time for a feed.
class Entry < ActiveRecord::Base
  belongs_to :feed, inverse_of: :entries
end
