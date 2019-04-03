# README

# INSTALL RUBY 2.6.1

The first step is to install some dependencies for Ruby and Rails.

To make sure we have everything necessary for Webpacker support in Rails, we're first going to start by adding the Node.js and Yarn 
repositories to our system before installing them.
run the next commands in you terminal

`curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`

`sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn`

Next we're going to be installing Ruby version 2.6.1 using RVM
in your terminal run

`cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL`

`git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL`

`rbenv install 2.6.1
rbenv global 2.6.1
ruby -v`

The last step for complete install Ruby is to install Bundler

`gem install bundler`

# INSTALL RAILS
First step install NodeJS, we're going to add it using the official repository:

`curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs`

And now, without further adieu:

`gem install rails -v 5.2.2`

If you're using rbenv, you'll need to run the following command to make the rails executable available:

`rbenv rehash`

Now that you've installed Rails, you can run the rails -v command to make sure you have everything installed correctly:
`rails -v
Rails 5.2.2`

# Setting Up PostgreSQL

`sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.5 libpq-dev`

`sudo -u postgres createuser bian -s
sudo -u postgres psql
postgres=# \password bian`

# Final Steps

Move into the application directory
`cd fedaby_api`

Create the DB 
`rails db:create`

Run the migration
`rails db:migrate`

Run the server
`rails s`
