require 'uri'
require 'net/http'

uri = URI('https://hooks.slack.com/services/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')
https = Net::HTTP.new(uri.host,uri.port)
https.use_ssl = true
request = Net::HTTP::Post.new(uri.path)
request.body = "{'text': 'Rachel is cool!'}"
response = https.request(request)
puts response