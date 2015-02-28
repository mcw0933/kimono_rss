# README

KimonoRSS is a tool for easily consuming JSON APIs from [KimonoLabs](https://www.kimonolabs.com) either in a ruby environment or as an RSS feed of entry history.

## Developing

You will need Postgres 9.3 or higher.  [Get Postgres.app](http://postgresapp.com/) and then use [the guide](http://postgresapp.com/documentation/cli-tools.html) to get set up.

Then clone the repo, `bundle install`, `rake db:create db:migrate` and you're all set!

## Debugging

KimonoRSS uses the `pry` gem as a console - you can easily debug by calling `binding.pry` anywhere you would like to launch a pry REPL.

## Data Model

### Endpoint
An endpoint is a consumable JSON service with a known (or initially known) schema.  It presumably updates periodically but its update schedule may or may not be known and is not necessarily relevant.

### Schema Version
A schema version is a point-in-time schema that describes the content of an endpoint.  Over time, an endpoint has one or more schema versions, but only one at a time.

### Feed
A feed is the primary model element for the application.  It represents the collected content of an endpoint over time, regardless of schema versions.  A feed has one endpoint.  An endpoint can have multiple feeds, most likely because each feed is filtering/transforming the endpoint data differently.

### Schedule
A schedule configures a feed to poll its endpoint periodically to check for new or updated data.  A feed has a single schedule which specifies a poll interval.

### Entry
An entry is a snapshot of an endpoint's data at a given point in time.  A feed contains multiple entries over time.

### Failure
A failure tracks an attempted poll of an endpoint that did not succeed.  They are useful for producing notifications to feed consumers that something is amiss; the endpoint schema has changed and requires a new version, or the endpoint is down/intermittent, or the data could not be processed, etc.

## Other

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
