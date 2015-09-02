require 'dotenv'
require 'httparty'
require 'json'
require 'net/http'

begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
  puts 'Skipping Dotenv - remember to set environment variables directly'
end

class AthleteStats
  include HTTParty
  # base_uri 'http://fantasysports.yahooapis.com/fantasy/v2/player'
  # base_uri 'http://api.cbssports.com/fantasy/stats/categories?version=3.0'
  base_uri 'http://api.nfldata.apiphany.com/nba/v2/XML/PlayerSeasonStats/2015'

  # $session = YahooSession::requireSession(CLIENT_ID,CLIENT_SECRET, APP_ID)

  #   $mails= query('your query  limit 10')

  def get_season_id(season_id)
    uri = URI('http://api.nfldata.apiphany.com/nba/v2/{format}/Players')
uri.query = URI.encode_www_form({
})

request = Net::HTTP::Get.new(uri.request_uri
)    response = self.class.get('/json', query: {
           #        client_id: ENV['CLIENT_ID'],
           #        client_secret: ENV['CLIENT_SECRET'],
    							# athlete_id: athlete_id
                  season_id: season_id,
                  'Ocp-Apim-Subscription-Key' => ENV['Ocp-Apim-Subscription-Key']
                  })

    if response.success?
      request.body = "{body}"

      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
      end

      # puts response.body
      # json = JSON.parse(response.body)
      # json['results'].first['geometry']['location']
    else
      response
      # nil
    end
  end
end

athlete_stats = AthleteStats.new
p athlete_stats.get_season_id('PlayerSeasonStats/2015')
