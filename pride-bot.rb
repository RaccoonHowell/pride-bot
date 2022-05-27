require 'uri'
require 'net/http'

$quoteArray = [
  "\“Darling, I want my gay rights now. I think it’s about time the gay brothers and sisters got their rights… especially the women.\” ~Marsha P. Johnson",
  "\"Nature made a mistake, which I have corrected.\" ~Christine Jorgensen",
  "\"The richness, beauty and depths of love can only be fully experienced in a climate of complete openness, honesty and vulnerability\" ~Anthony Venn Brown",
  "\Scratch a Transphobe, and you'll find a racist underneath\" ~Ashleigh Talbot"
]

def get_quote
    puts $quoteArray.length
    $quoteArray[rand($quoteArray.length)]
end

def message message_to_post
  uri = URI('https://hooks.slack.com/services/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')
  https = Net::HTTP.new(uri.host,uri.port)
  puts https
  https.use_ssl = true
  request = Net::HTTP::Post.new(uri.path)
  request.body = "{'text': '#{message_to_post}'}"
  puts "{'text': '#{message_to_post}'}"
  response = https.request(request)
  puts response
end

puts message(get_quote)