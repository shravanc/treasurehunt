# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Ruby version
 - 2.7

# Configuration
 - export EMAIL_ID='from@domain.com'
 - export EMAIL_PSWD='password'

# Database creation
 - rails db:create

# Database initialization
 - rails db:migrate

# How to run the test suite
 - rspec

# Deployment instructions
 - rails s

# Problem Statement:
CODE CHALLENGE:
You are writing a web endpoint for a treasure hunt game. It allows participants to send requests to an endpoint, containing their current position(latitude and longitude in decimal representation) and email. Response contains a distance to the treasure expressed in meters. When players are in a 5 meter radius from the treasure an e-mail message with congratulations and exact position of the treasure is sent on the provided e-mail address.

Congratulations email is sent only once:
Treasure location: 50.051227 N, 19.945704 E

# Request format:
/treasure_hunt.json?current_location[]=:latitude&current_location[]=:longitude&email=:email

# Example request:
POST /treasure_hunt.json?current_location[]=0&current_location[]=0&email=test@example.com

# Example response:
Successful response
            { "status": "ok", "distance": 10  }

# Error response
            { "status": "error", "distance": -1, "error": "error description" } 

# Email Content: 
"Hey, you've found a treasure, congratulations!
You are [:nth] treasure hunter who has found the treasure." Replace [:nth] with the actual number of treasure hunters who successfully found a treasure before + 1."

# Bonus Points
You don't have to implement all, you can choose points you want to include in the project.
* Include unit and functional tests
* Add token - based authentication for API requests
* Allow 20 requests per hour for a given email.
* (optional) include deployment script for a platform of choice.
* Add an analytics endpoint that returns information about location of all the requests that happened in the time window provided in parameters.
* If a radius parameter is given, response should include only requests that is no further away than :radius meters from the treasure location. 
* Request format: GET /analytics.json?start_time[]=:start_time&end_time=:end_time&radius=:radius 
* Sample response: { "status": "ok", "requests": [ { "email": "test@test.com", "current_location": [1.1, 2.2] }, { "email": "test2@test.com", "current_location": [0.0, 0.0] } ] }

