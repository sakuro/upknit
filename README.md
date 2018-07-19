# Upknit

Adding this gem to a Rails application with PostgreSQL automatically enables UUID primary key.

## Usage

Add this gem to your Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'upknit'

And then execute:

    $ bundle

## Internals

This gem does two things to enable UUID primary key.

1. Enable PostgreSQL's extension for calculation of UUID(v4).
2. Configure generators to use UUID
    * as primary key for newly generated tables.
    * as type of references.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
