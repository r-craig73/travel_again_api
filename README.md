# Travel API

### by Ron Craig (ron.craig@comcast.net)

### Description
#### Building a travel API reviewing various travel cities around the world.  Will use request specs to test all routes and exceptions.

## User Stories
- [x] As a user, I want to GET and POST reviews about city destinations.
- [x] As a user, I want to GET reviews by city.
- [ ] As a user, I want to see the most popular travel destinations by number of reviews.
- [ ] As a user, I want to look up random destinations just for fun.
- [ ] As a user, I want to PUT and DELETE reviews, but only if I wrote them. (Start by requiring a user_name param to match the user_name of the author on the message. You can always try authentication later.)


### API build instructions (assuming Mac OS)
* Clone repository and move to the home repository folder `Computer:travel_api_again user$`.
* Run `$ gem install rails`.
* Verify that you are using ruby-2.4.1 in your terminal(s).
* Run `$ bundle install` to install Ruby gems packages related to the Gemfile in the top level.
* Rspec setup (Unit Testing and Models): In the terminal, run the following command `$ bundle exec rails generate rspec:install`. Files will be generated in the spec folder. In the home repository folder run `$ rspec` to view tests passing or failing.
* Database setup: Run `$ rake db:create` to generate a database. Run `$ rails generate migration action_name` generate a migration file for table manipulation. After generating the necessary tables, run `$ rake db:migrate` to prepare the database. Run `$ rake db:test:prepare` to create the Active Record schema.rb file. To run a seed to populate a database, run `$ rake db:seed`.
* Rails server: Run `$ rails server` to start the Rails server. Navigate to `http://localhost:3000`. Refresh the page to reload any changes to the source files.
* FactoryBot instructions: In the spec folder, create a `spec/factories.rb` file.

````
FactoryBot.define do
  factory(:review) do
    city('Mexico City')
    comment('Very big and exciting city. Ole!')
  end
end
````
* API token based authentication with Ruby on Rails 5: Follow the instructions in the link below...
Link: https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api
Warning: there's a typo in the Encoding and decoding JWT (JSON web token) section (aka `lib/json_web_token.rb` ). Use the code below...  Use Postman POST to acquire the auth_token, then in Postman GET place the Authorization/auth_token in the header section of `http://localhost:3000/reviews`

````
class JsonWebToken
 class << self
   def encode(payload, exp = 36.hours.from_now)
     payload[:exp] = exp.to_i
    #  JWT.encode(payload, Rails.application.secrets.secret_key_base)
     JWT.encode(payload, Rails.application.secret_key_base)
   end

   def decode(token)
    #  body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
     body = JWT.decode(token, Rails.application.secret_key_base)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
 
end
````

#### Clipboard stuff
* http://localhost:3000/reviews?city=East
