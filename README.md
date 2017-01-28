# Coolpics!

Coolpics! is an open source platform to create sharing image application.
It's like 9gag.com :)

![Coolpics! Screenshot](https://raw.githubusercontent.com/omkz/coolpics/master/public/screenshot.png)

## Tech Stack

- Ruby 2.3  
- Ruby on Rails 5.0  
- PostgreSQL 9.5
- jQuery
- Gem: 
    -  [devise](https://github.com/plataformatec/devise) | Authenticatio
    -  [pg](https://github.com/ged/ruby-pg) | PostgreSQL library for Ruby
    -  [carrierwave](https://github.com/carrierwaveuploader/carrierwave) | Image upload management

## Installation

### Requirements

Before you get started, the following needs to be installed:
  * **Ruby**. Version 2.3.3 is currently used and we don't guarantee everything works with other versions. If you need multiple versions of Ruby, [RVM](https://rvm.io//) is recommended.
  * [**RubyGems**](http://rubygems.org/)
  * **Bundler**: `gem install bundler`
  * [**Git**](http://help.github.com/git-installation-redirect)
  * **A database**. Only PostgreSQL 9.5 has been tested, so we give no guarantees that other databases (e.g. MySQL) work. If you're using OS X and have Homebrew installed, install it with `brew install postgresql`
  * [**Redis**](http://redis.io). Version 3.2.6 has been used successfully, but newer versions should work as well. If you're using OS X and have Homebrew installed, install it with `brew install redis`
  * [**elasticsearch**] (https://www.elastic.co/products/elasticsearch). If you're using OS X and have Homebrew installed, install it with `brew install elasticsearch`
  * [**Imagemagick**](http://www.imagemagick.org). If you're using OS X and have Homebrew installed, install it with `brew install imagemagick`
  
### Setting up the development environment

1. Get the code. Clone this git repository and check out the latest release:

  ```bash
  https://github.com/omkz/coolpics
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
Some components are created with React (see [documentation](https://github.com/sharetribe/sharetribe/blob/master/client/README.md)) and they need to be built with Webpack. We have [Foreman](http://theforeman.org/) Procfiles that can be used to run both Rails and Webpack:

  ```bash
  rails s
  ```


## MIT License

Coolpics is open source under the MIT license. See [LICENSE](LICENSE) for details.
