## What Is This Small Project About?

<strong>shorten_url</strong> is a small application to shorten urls you provided, simply goto the index page to create a short url, and it will lead you to the detail page also provides you the visit history.

* Access `/` to generate a shorten url with some optional descriptions.
* Find the shorten_url detail at `/shortcut/:id` page
* Show page provides `/goto/:short_url` link for the user.

## How to Run This App

* Clone this repo
* Go to the directory and run
```shell
bundle install
rake db:create db:migrate
rails s
```

## How to Run The Test

* RSpec is supported
```shell
rspec spec/controller
```

* Develop with Guard is recommended
```
cd {project_folder}
guard
```

* Be ware of Spring running behind, stop it when you did some infrastructure-wise change
```
spring stop
```

## How It Works

* `app/service/shorten_url_service.rb` is the shorten service to make a shorten token.
* The short url service should always let user uses `/goto/{short_url}` to access the original url.
* While use passed through `shortcut_controller`, user information will be recorded into a `visit` entity.

## API

* This app uses Grape to construct visioning API endpoints.
* Swagger document page: `/api/v1/swagger_doc`
* Not sure how it works? No worries, go to your `shortcut` page and find *Try out the API*

## Why I Design Like This

Ideally we don't need to expose too much information to most of the users, this app is actually designed for the organization who runs it for collecting user's information, not for those people who created the links.

Creators still can check the link status but there's nothing much they can do.

Thus, I prefer user to use `goto/:short_url` instead of `shortcut/:id` to keep information hides behind people.

## What Needs To Be Improved

* The algorithm of shorten url, the current idea is simply using partial uuid and part of the original url's md5, not a good way but should be able to handle a starting service.
* Test case for the API formatter: strangely it doesn't have test case for api endpoint, in my concept, tests for API have these important purpose:
  1. Test the request format.
  2. Test the response data format.
  3. Test and expect the different status codes.

  With more and more user feedback, and this project can start to have proper API test cases.

## System Configs

#### Ruby version:

Developed in ruby 2.3.3p222

#### System dependencies

Use sqlite currently

#### Configuration

Default settings

#### Database creation

Simply rake db create

#### Database initialization

No authentication yet, seed files are not required.

#### Deployment instructions

Currently assume running at local machine