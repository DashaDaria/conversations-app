# README

## About The Project

A simple messenger api that can enable a web app to build a lightweight messenger application.

### Built With

- Ruby 
- Rails 
- ActionCable for WebSockets integration
- Rspec for testing
- Postgresql for db
- Bootstrap for better UI readability

## Getting Started

Make sure you have Ruby, Rails and Postgresql installed.
- Ruby v3.0.0
- Rails v.6.1.3
- Node v15.11.0
- Yarn v1.17.3

### Installation

Simply clone the repo and install its dependencies:

```sh
$ git clone git@github.com:DashaDaria/conversations-app.git
$ cd conversations-app/
$ bundle
$ yarn install
$ brew services start postgresql
$ rails db:setup
```

### Run the Server

Just type:

```sh
$ rails s
```

and visit [localhost:3000](http://localhost:3000).

### Test the App

```sh
$ rspec
```

This tests the models and api endpoints.

For testing the chat behavior, two browser windows can be opened and if a message is submitted in one it will appear in both windows.

## Usage

- Since there is no authentication, the users are hardcoded
- The home route displays a list of all of the user's (in this case user 'Dasha') conversations
- A link to each conversation displays a list of all the messages between 'Dasha' and another user
- A message can be submitted and it is displayed without any page reload
- A limit of 100 messages is displayed
- A filter is available to see only the messages for the last 30 days

## Roadmap / Current Limitations

- There is no authentication/authorization or a way to sign up to become a user. For this reason user1 (in the seed file) is assumed to be the "authorized" user
- Additionally, the api endpoint `/api/v1/users/:user_one_id/users/:user_two_id/messages` that provides messages between 2 users is verbose, and can be abridged with the use of an authorized user
- There is no way to see messages submitted by multiple users

## Api design

- There are only 2 tables: Users and Messages
- A user can be a sender and/or recipient and the join happens on the message which is shared
- A message belongs to a user
- `/api/v1/users/:user_id/conversations`: provides the list of all conversations for a given user
- `/api/v1/users/:user_one_id/users/:user_two_id/messages`: provides a list of all the messages between 2 users
