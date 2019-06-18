# Coolpics!

Coolpics is an open source platform for creating photo-sharing site that allows its users to share pictures on the app, as well as through a variety of other social networking platforms, such as Facebook, Twitter, Tumblr, and etc.
It's like 9gag.com :)

![Coolpics! Screenshot](https://raw.githubusercontent.com/omkz/coolpics/master/public/screenshot.png)

## Tech Stack

- Ruby 2.5.1  
- Ruby on Rails 5.2.1  
- PostgreSQL 9.5
- jQuery
- Twitter Bootstrap 3
- Gem: 
    -  [devise](https://github.com/plataformatec/devise) | Authenticatio
    -  [pg](https://github.com/ged/ruby-pg) | PostgreSQL library for Ruby
    -  [carrierwave](https://github.com/carrierwaveuploader/carrierwave) | Image upload management

## Installation

### Requirements

Before you get started, the following needs to be installed:
  * **Ruby**. Version 2.5.5 is currently used and we don't guarantee everything works with other versions. If you need multiple versions of Ruby, [rbenv](https://rbenv.org) is recommended.
  * [**RubyGems**](http://rubygems.org/)
  * **Bundler**: `gem install bundler`
  * [**Git**](http://help.github.com/git-installation-redirect)
  * **A database**. Only PostgreSQL 9.5 has been tested, so we give no guarantees that other databases (e.g. MySQL) work. If you're using OS X and have Homebrew installed, install it with `brew install postgresql`
  * [**Redis**](http://redis.io). Version 3.2.6 has been used successfully, but newer versions should work as well. If you're using OS X and have Homebrew installed, install it with `brew install redis`
  * [**elasticsearch**] (https://www.elastic.co/products/elasticsearch). If you're using OS X and have Homebrew installed, install it with `brew install elasticsearch`
  * [**Imagemagick**](http://www.imagemagick.org). If you're using OS X and have Homebrew installed, install it with `brew install imagemagick`
  
### Setting up the development environment

1. Get the code. Clone this git repository:

  ```bash
  git clone git://github.com/omkz/coolpics.git
  cd coolpics
  ```

1. Install the required gems by running the following command in the project root directory:

  ```bash
  bundle install
  ```

1. Create and initialize the database:

  ```bash
  bundle exec rake db:migrate
  ```

1. Start the development server:

  ```bash
  rails s
  ```
### Setting up the development environment using Docker (BETA)

Our docker implementation is incomplete and may not work smoothly. Please kindly report any issues and any contribution is welcomed!

1. Install `docker` and `docker-compose`
1. `git clone git@github.com:omkz/coolpics.git`
1. run `docker-compose build`
1. run `docker-compose run web rails db:setup`
1. run `docker-compose up`
1. That's it! Navigate to `localhost:3000`

## If you want to contribute

The best way to contribute is to do one of the following :
* Creating tests
* Refactoring
* Coding features
* Correcting logged issues
* Correcting my English! (I'm an Indonesian, so don't hesitate to fix my sentences or whole paragraphs.)

## License

Coolpics is open source under the MIT license. See [LICENSE](LICENSE) for details.
