class CloudUser < ActiveRecord::Base
  has_uuid(:no_generate)
  validates_presence_of :url, :body
end
