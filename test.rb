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

array = JSON.parse(response.body)
p array[0].class