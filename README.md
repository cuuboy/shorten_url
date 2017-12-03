## What Is This Small Project About?

<strong>shorten_url</strong> is a small application to shorten urls you provided, simply goto the index page to create a short url, and it will lead you to the detail page also provides you the visit history.

## How to Run This App

* Clone this repo
* Go to the directory and run
```shell_script
bundle install
rake db:create db:migrate
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