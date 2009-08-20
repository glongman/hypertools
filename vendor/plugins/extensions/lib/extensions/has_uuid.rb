require File.dirname(__FILE__) + '/make_uuid' unless defined?(MakeUuid)
class ActiveRecord::Base
  require 'uuidtools'
  include MakeUuid
  def self.has_uuid
    before_validation_on_create :make_uuid
    attr_readonly :uuid
    validates_presence_of :uuid
    validates_uniqueness_of :uuid
  end

end