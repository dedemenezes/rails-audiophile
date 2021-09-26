module SeedsHelper
  module ParseData
    def self.json_db
      file = "app/assets/challenge_briefing/starter-code/data.json"
      JSON.parse(File.read(file))
    end
  end
end
