## Ruby Version
- **Ruby version**: 3.1.2

## Rails Version
- **Rails version**: 7.2.2.1

---

## 1. Configuration

1. Change the DB Username and Password
   - Update the database username and password in the `.env` file:
     ```bash
     DB_USERNAME=your_db_username
     DB_PASSWORD=your_db_password
     ```

2. Install Ruby Gems
   - Run the command to install the Ruby gems in the `Gemfile`:
     ```bash
     bundle install
     ```

---

## 2. Database Creation

- Run the command to create the database and apply migrations:
  ```bash
  rails db:create && rails db:migrate

## 3. Start the Rails Server

-	After setting up the database, run the command to start the Rails server:

    rails server

    The server should now be running locally at http://localhost:3000.

## 4. Automating the Setup

I have created a script file to automate these steps. After config your database in the .env file, you can run the script to execute all the commands.

    To execute the script, run:

		./setup.sh  

		If it says something like PERMISSION DENIED, run following command and retry the script
		
		chmod +x setup.sh

## 5. API

I have implemented two endpoints:

    POST /encode

    GET /decode/{short-code}


The /encode endpoint requires the following form data:  

	{
		"original_url": "https://test-url.com"
	}

The response will return the shortened URL.

You can add the short-code into the /decode/{short-code} to get the original_url

## 6. Test
1. Run the following commands to setup the test database:

		rails db:create RAILS_ENV=test
		rails db:migrate RAILS_ENV=test

2. Run the following command to test with RSpec

		bundle exec rspec spec/requests/url_requests_spec.rb