require 'net/http'

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

puts response.body