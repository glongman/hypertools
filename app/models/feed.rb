class Feed < ActiveRecord::Base
  has_uuid
  serialize :body, Hash
  belongs_to :user
end
