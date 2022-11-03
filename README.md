# WEATHER-APP ALPHA

In this project, we will build a weather app using the OpenWeatherMap API(?). The app will allow users to search for a city and view the current weather conditions for that city.

Here's what you need to do to get started:

1. install postgres, either [manually](https://www.postgresql.org/download/macosx/) or using brew:
```
brew install postgresql@15
```
- to add postgresql to PATH, run:
```
echo 'export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"' >> ~/.zshrc
```
- to source it, run:
```
source ~/.zshrc
```
- to start postgresql, run:
```
brew services start postgresql@15
```
- to create a new role, run:
```
createuser -P -d appname
```
(You're gonna have to enter a password for the role)

2. install redis, either [manually](https://redis.io/download) or using brew:
```
brew install redis
```

3. clone this repo to your local machine
- In the terminal navigate to the location where you want to clone the repo, then run:
```
git clone https://github.com/JamieShifter/weather-app.git
```
4. In the terminal navigate to the repository location, you should see something like this:
```
➜  weather-app git:(main) 
```
- run:
```
bundle install
```
5. Go to database.yml and change the username and password to the ones you created in step 1, where **appname** is the name of the role you created.
You can do it like this:
```yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: appname
  password: password
```
6. To check if everything works as expected, in the terminal run:
```
bin/setup
```
- then run:

```
rails server --binding=127.0.0.1
```
7. In the browser of your choice, visit localhost:3000, you should see something like this:

![This is an image](https://user-images.githubusercontent.com/73684/146308451-07ac525e-1e29-4360-969e-fc84fe8f369c.png)

Boom, you're done!


<!-- * Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
