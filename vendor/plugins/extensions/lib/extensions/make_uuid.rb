module MakeUuid
  def make_uuid
    self.uuid = UUID.random_create.to_s if uuid.blank?
  end
end