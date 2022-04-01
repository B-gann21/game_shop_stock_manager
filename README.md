# Game Shop Stock Manager | Solo Project

A Ruby-on-Rails web application to manage inventory across different video game shops. Includes basic CRUD (Create, Read, Update, Delete) functionality. 

Uses Ruby version 2.7.4, Rails version 5.2.7, and PostgreSQL.

### This project has a Heroku app [here](http://game-shop-manager.herokuapp.com/) if you are not interested in running the code from your local machine

[Database design table](https://dbdesigner.page.link/MXDMP3tZhFNrPUJJ9)

## How to get the app and test suites running on your machine

## Setting up Ruby 2.7.4 and Rails 5.2.7 using Rbenv; Installing PostgreSQL using Homebrew

### Requires a Mac computer

1. Make sure you have HomeBrew (directions for installation [here](https://brew.sh/))
2. Make sure you have Rbenv (directions for installation [here](https://github.com/rbenv/rbenv))

### Terminal commands should be ran in this order:
4. `rbenv install 2.7.4` to install the proper Ruby version
5. `gem install rails 5.2.7` to install the proper Rails version
6. `brew install postgresql` to install PSQL, and then `brew services start postgresql` to start the service.
7. `cd` to the directory in which you intend to store the project
8. `rbenv local 2.7.4` to set the current directory's Ruby version to 2.7.4

## Setting up the database, initializing the Rails server, interacting with the website

1. Start by cloning the repo with `git clone https://github.com/B-gann21/game_shop_stock_manager` and then run the following terminal commands:
2. `bundle install` to install the proper Ruby gems
3. `rails db:create` to create a `development` and `test` database on your machine
4. `rails db:migrate` to create the GameShops and VideoGames tables in the database
5. `rails g rspec:install` to bootstrap RSpec to the Rails app
6. **optional**: use `rails db:seed` if you wish to pre-load the `GameShop` and `VideoGame` objects that can be found in the seed file
7. `rails s` to start up the rails server. **note: leave your terminal open for the next steps!**

### Interacting with the website

9. Navigate to Google Chrome (or Safari - note that this app hasn't been tested on any other browsers)
10. in the URL bar, type `localhost:3000/` to be brought to the welcome page. 
11. Start clicking links and filling out forms to create your own GameShops and VideoGames! 

## Running the test suite - **make sure to use `bundle exec` before each of your RSpec commands**

### This project uses RSpec - all tests are held inside of the `/spec` folder

- You can run the full suite with `bundle exec rspec`

- To run a specific spec folder or file, specify the path in your command: `bundle exec rspec spec/features/`, `bundle exec rspec spec/models/video_game`

- To run a single test, specify the line where the `it` block starts: `bundle exec rspec spec/features/game_shops/index_spec.rb:50`
