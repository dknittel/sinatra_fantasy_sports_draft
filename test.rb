require 'dotenv'
require 'httparty'
require 'json'

begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
  puts 'Skipping Dotenv - remember to set environment variables directly'
end
uri = URI('http://api.nfldata.apiphany.com/nba/v2/JSON/PlayerSeasonStats/2015')
uri.query = URI.encode_www_form({
})

request = Net::HTTP::Get.new(uri.request_uri)
# Request headers
request['Ocp-Apim-Subscription-Key'] = ENV['Ocp_Apim_Subscription_Key']#d6419bdf515e4574a431f73be3a3721f'
# Request body
request.body = "{body}"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
end

player_array = JSON.parse(response.body)
player_array.each do |hash|
	hash.delete('StatID')
	hash.delete('TeamID')
	hash.delete('PlayerID')
	hash.delete('SeasonType')
	hash.delete('Season')
	hash.delete('Started')
	hash.delete('Updated')
	hash.delete('EffectiveFieldGoalsPercentage')
	hash.delete('TwoPointersMade')
	hash.delete('TwoPointersAttempted')
	hash.delete('TwoPointersPercentage')
	hash.delete('ThreePointersMade')
	hash.delete('ThreePointersAttempted')
	hash.delete('OffensiveReboundsPercentage')
	hash.delete('DefensiveReboundsPercentage')
	hash.delete('TotalReboundsPercentage')
	hash.delete('TrueShootingAttempts')
	hash.delete('PlayerEfficiencyRating')
	hash.delete('AssistsPercentage')
	hash.delete('StealsPercentage')
	hash.delete('AssistsPercentage')
	hash.delete('BlocksPercentage')
	hash.delete('TurnOversPercentage')
	hash.delete('UsageRatePercentage')
	hash.delete('FieldGoalsMade')
	hash.delete('FieldGoalsAttempted')
	hash.delete('FreeThrowsMade')
	hash.delete('FreeThrowsAttempted')
	hash.delete('OffensiveRebounds')
	hash.delete('DefensiveRebounds')
	hash.delete('TrueShootingPercentage')
	hash.delete('FantasyPoints')
	hash.delete('PersonalFouls')
end

p player_array[0].symbolize_keys
# player_array.each do |player_stats|
# 	player_stats.symbolize_keys!
# 	p player_stats
# 	# @pool.players.create(player_stats)
# end