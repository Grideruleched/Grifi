# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "uri"
require "net/http"


require "uri"
require "net/http"

url = URI("https://profile.callofduty.com/cod/login")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
puts response.read_body


require "uri"
require "net/http"

url = URI("https://profile.callofduty.com/do_login?new_SiteId=cod")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Cookie"] = "XSRF-TOKEN={{XSRF-TOKEN}}"
form_data = [['username', '{{accountEmail}}'],['password', '{{accountPassword}}'],['remember_me', 'true'],['_csrf', '{{XSRF-TOKEN}}']]
request.set_form form_data, 'multipart/form-data'
response = https.request(request)
puts response.read_body

url = URI("https://my.callofduty.com/api/papi-client/stats/cod/v1/title/mw/platform/battle/gamer/iShot%2321899/profile/type/mp")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
puts response.read_body