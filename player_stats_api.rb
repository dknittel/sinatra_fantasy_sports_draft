require 'dotenv'
require 'httparty'
require 'json'

begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
  puts 'Skipping Dotenv - remember to set environment variables directly'
end

class AthleteStats
  include HTTParty
  base_uri 'http://api.espn.com/v1/sports/basketball/nba/athletes'

  def get_athlete_id(athlete_id)
    response = self.class.get('/json', query: {
    							athlete_id: athlete_id
                              })
    # parameters = {enable=statistics}

    if response.success?
      json = JSON.parse(response.body)
      json['results'].first['geometry']['location']
    else
      response
      # nil
    end
  end
end

athlete_stats = AthleteStats.new
p athlete_stats.get_athlete_id(100)
