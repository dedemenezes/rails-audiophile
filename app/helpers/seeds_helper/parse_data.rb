module SeedsHelper
  module ParseData
    def self.json_db
      file = Rails.root.join("db/data.json")
      JSON.parse(File.read(file))
    end
  end
end
