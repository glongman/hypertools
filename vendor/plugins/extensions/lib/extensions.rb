Dir[File.dirname(__FILE__)+"/extensions/*.rb"].each do |r|
  require r
end