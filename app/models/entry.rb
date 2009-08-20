class Entry < ActiveRecord::Base
  has_uuid
  serialize :body, Hash
  validates_presence_of :url, :body
end
