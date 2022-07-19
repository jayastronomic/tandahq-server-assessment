# README

Hello. Welcome To G2 Crowd Team Roster Backend. This projet is intended to be used in development mode on a single machine that ports to localhost:

# How to Get Started

- Ruby version

The ruby and Rails version being used in this project:

```
ruby '2.7.0'
gem 'rails', '~> 5.2.3'
```

- System dependencies

Run bundle command to install dependencies:

```
bundle install
```

- Database creation and initialization

Create and migrate the database.

Run the commands:

```
rails db:create
rails db:migrate
```

To check to see if migrations were created, run the command:

```
rails db:migrate:status
```

Database should be good to go!
To spin the server, just run the following command

```
rails s
```

The server is configured to connect to port 3001.
Now you can start the client side app to TandaHQ!

Here is the link to get the client side up and running on your local machine "https://github.com/jayastronomic/tandahq-client-assessment"
It is highly suggested to get the backend up and running first, but not mandatory.
