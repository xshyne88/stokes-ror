class LandScheduler
  def self.run
    Land.create_or_find_by(name: "oogy boogy")
    Land.last.name
  end
end
