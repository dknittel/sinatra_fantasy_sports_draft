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
request['Ocp-Apim-Subscription-Key'] = ENV['Ocp_Apim_Subscription_Key']
# Request body
request.body = "{body}"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
end

player_array = JSON.parse(response.body)
player_array = player_array.dup
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

Pool.create(name: 'NBA 2015')
@pool = Pool.first
player_array.each do |player_stats|
	@pool.players.create(name: player_stats["Name"], team: player_stats["Team"], position: player_stats["Position"], games: player_stats["Games"], field_goals_percentage: player_stats["FieldGoalsPercentage"], three_pointers_percentage: player_stats["ThreePointersPercentage"], free_throws_percentage: player_stats["FreeThrowsPercentage"], rebounds: player_stats["Rebounds"], assists: player_stats["Assists"], steals: player_stats["Steals"], blocked_shots: player_stats["BlockedShots"], turnovers: player_stats["Turnovers"], points: player_stats["Points"])
end


# p player_array[0]
 # player_array = [{name: 'Steph Curry', ppg: 30, apg: 23, rpg: 14, spg: 7, nba_team: 'Warriors', position: 'PG'},
 # {name:'Klay Thompson', ppg: 30, apg: 12, rpg: 10, spg: 3, nba_team: 'Warriors', position: 'SG'},
 # {name:'Draymond Green', ppg: 22, apg: 13, rpg: 15, spg: 5, nba_team: 'Warriors', position: 'PF'},
 # {name:'Harrison Barnes', ppg: 21, apg: 12, rpg: 14, spg: 4, nba_team: 'Warriors', position: 'SF'},
 # {name:'Andrew Bogut', ppg: 15, apg: 8, rpg: 20, spg: 4, nba_team: 'Warriors', position: 'C'},
 # {name:'Andre Iguodala', ppg: 27, apg: 12, rpg: 13, spg: 8, nba_team: 'Warriors', position: 'SG'},
 # {name:'Kevin Durant', ppg: 22, apg: 10, rpg: 13, spg: 7, nba_team: 'Thunder', position: 'SF'},
 # {name:'Russell Westbrook', ppg: 30, apg: 10, rpg: 8, spg: 9, nba_team: 'Thunder', position: 'PG'},
 # {name:'Kyrie Irving', ppg: 25, apg: 15, rpg: 5, spg: 6, nba_team: 'Cavaliers', position: 'PG'},
 # {name:'Anthony Davis', ppg: 12, apg: 7, rpg: 10, spg: 3, nba_team: 'Hornets', position: 'C'},
 # {name:'Dirk Nowitzki', ppg: 26, apg: 6, rpg: 12, spg: 3, nba_team: 'Mavericks', position: 'PF'},
 # {name:'Tim Duncan', ppg: 12, apg: 5, rpg: 12, spg: 3, nba_team: 'Spurs', position: 'PF'},
 # {name:'James Harden', ppg: 11, apg: 5, rpg: 10, spg: 2, nba_team: 'Rockets', position: 'SG'}]




