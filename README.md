# Game Shop Stock Manager | Solo Project

A basic Ruby-on-Rails web application to manage inventory across different video game shops. Includes basic CRUD (Create, Read, Update, Delete) functionality. 

Uses Ruby version 2.7.4, Rails version 5.2.7, and PostgreSQL.

[Database design table](https://dbdesigner.page.link/MXDMP3tZhFNrPUJJ9)

## Getting started - Setting up Ruby 2.7.4 and Rails 5.2.7 using Rbenv; Installing PostgreSQL using Homebrew

### Requires a Mac computer

1. Make sure you have HomeBrew (directions for installation [here](https://brew.sh/))
2. Make sure you have Rbenv (directions for installation [here](https://github.com/rbenv/rbenv))
3. In the terminal, run `rbenv install 2.7.4` to install the proper Ruby version
4. run `gem install rails 5.2.7` to install the proper Rails version
5. run `brew install postgresql` to install PSQL, and then `brew services start postgresql` to start the service.
6. `cd` to the directory in which you intend to store the project
7. run `rbenv local 2.7.4` to set the current directory's Ruby version to 2.7.4

## Setting up the database, initializing the Rails server

1. Start by cloning the repo with `git clone https://github.com/B-gann21/game_shop_stock_manager`
2. run `rails db:migrate` to create the GameShops and VideoGames tables in the database
3. **optional**: run `rails db:seed` if you wish to pre-load the `GameShop` and `VideoGame` objects that can be found in the seed file
4. Finally, run `rails s` to start up the rails server. **note: leave your terminal open for the next steps!**

## Interacting with the website

1. Navigate to Google Chrome (or Safari - note that this app hasn't been tested on any other browsers)
2. in the URL bar, type `localhost:3000/` to be brought to the welcome page. 
3. Start clicking links and filling out forms to create your own GameShops and VideoGames! 


