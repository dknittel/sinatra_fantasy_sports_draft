 # Player.create(name: 'Steph Curry', ppg: 30, apg: 23, rpg: 14, spg: 7, nba_team: 'Warriors', position: 'PG')
 # Player.create(name: 'Klay Thompson', ppg: 30, apg: 12, rpg: 10, spg: 3, nba_team: 'Warriors', position: 'SG')
 # Player.create(name: 'Draymond Green', ppg: 22, apg: 13, rpg: 15, spg: 5, nba_team: 'Warriors', position: 'PF')
 # Player.create(name: 'Harrison Barnes', ppg: 21, apg: 12, rpg: 14, spg: 4, nba_team: 'Warriors', position: 'SF')
 # Player.create(name: 'Andrew Bogut', ppg: 15, apg: 8, rpg: 20, spg: 4, nba_team: 'Warriors', position: 'C')
 # Player.create(name: 'Andre Iguodala', ppg: 27, apg: 12, rpg: 13, spg: 8, nba_team: 'Warriors', position: 'SG')
 # Player.create(name: 'Kevin Durant', ppg: 22, apg: 10, rpg: 13, spg: 7, nba_team: 'Thunder', position: 'SF')
 # Player.create(name: 'Russell Westbrook', ppg: 30, apg: 10, rpg: 8, spg: 9, nba_team: 'Thunder', position: 'PG')
 # Player.create(name: 'Kyrie Irving', ppg: 25, apg: 15, rpg: 5, spg: 6, nba_team: 'Cavaliers', position: 'PG')
 # Player.create(name: 'Anthony Davis', ppg: 12, apg: 7, rpg: 10, spg: 3, nba_team: 'Hornets', position: 'C')
 # Player.create(name: 'Dirk Nowitzki', ppg: 26, apg: 6, rpg: 12, spg: 3, nba_team: 'Mavericks', position: 'PF')
 # Player.create(name: 'Tim Duncan', ppg: 12, apg: 5, rpg: 12, spg: 3, nba_team: 'Spurs', position: 'PF')
require 'net/http'
require 'json'

uri = URI('http://api.nfldata.apiphany.com/nba/v2/JSON/PlayerSeasonStats/2015')
uri.query = URI.encode_www_form({
})

request = Net::HTTP::Get.new(uri.request_uri)
# Request headers
request['Ocp-Apim-Subscription-Key'] = 'd6419bdf515e4574a431f73be3a3721f'
# Request body
request.body = "{body}"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
end

player_array = JSON.parse(response.body)
# p array[0].class
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

Pool.create(name: 'NBA 2015')
@pool = Pool.first
player_array.each do |player_stats|
	@pool.players.create()
end


#arrays are not complete:
 # [['Steph Curry', ppg: 30, apg: 23, rpg: 14, spg: 7, nba_team: 'Warriors', 'PG']
 # ['Klay Thompson', ppg: 30, apg: 12, rpg: 10, spg: 3, nba_team: 'Warriors', 'SG']
 # ['Draymond Green', ppg: 22, apg: 13, rpg: 15, spg: 5, nba_team: 'Warriors', 'PF']
 # ['Harrison Barnes', ppg: 21, apg: 12, rpg: 14, spg: 4, nba_team: 'Warriors', 'SF']
 # ['Andrew Bogut', ppg: 15, apg: 8, rpg: 20, spg: 4, nba_team: 'Warriors', 'C']
 # ['Andre Iguodala', ppg: 27, apg: 12, rpg: 13, spg: 8, nba_team: 'Warriors', 'SG']
 # ['Kevin Durant', ppg: 22, apg: 10, rpg: 13, spg: 7, nba_team: 'Thunder', 'SF']
 # ['Russell Westbrook', ppg: 30, apg: 10, rpg: 8, spg: 9, nba_team: 'Thunder', 'PG']
 # ['Kyrie Irving', ppg: 25, apg: 15, rpg: 5, spg: 6, nba_team: 'Cavaliers', 'PG']
 # ['Anthony Davis', ppg: 12, apg: 7, rpg: 10, spg: 3, nba_team: 'Hornets', 'C']
 # ['Dirk Nowitzki', ppg: 26, apg: 6, rpg: 12, spg: 3, nba_team: 'Mavericks', 'PF']
 # ['Tim Duncan', ppg: 12, apg: 5, rpg: 12, spg: 3, nba_team: 'Spurs', 'PF']]

