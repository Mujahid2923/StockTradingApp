## Initial Setup

---
### Prerequisites

The setups steps expect following tools installed on the system.

- Git
- Ruby 3.0.6
- Rails 6.1.7.6
- PostgreSQL

##### 1. Check out the repository and install the needed gem

```bash
# CLONE THE REPO
git clone https://github.com/mujahid-ism/StockTradingApp.git
# CD INTO THE DIRECTORY
cd StockTradingApp
# install gem 
bundle install
```

##### 2. Create and setup the database

```bash
bundle exec rake db:create db:migrate
```

##### 3 Run rake task for seed and update for Authorization

```bash
rake seed:permissions
rake update:permissions
```

##### 4. Run test and make sure all tests pass

```bash
rspec
```

##### 5. Start server and try your REST services!

```bash
rails s
```

##### 6. Build and Start the Docker

```bash
sudo docker-compose build && sudo docker-compose up
```

##### 7. env
JWT_SECRET_KEY  
RAILS_ENV  
POSTGRES_HOST  
POSTGRES_DB  
POSTGRES_USER  
POSTGRES_PASSWORD  
RAILS_MASTER_KEY  

## ER Diagram of the Application

![erd](https://github.com/mujahid-ism/StockTradingApp/assets/108412058/1776bbf0-3915-4f3c-aa4a-9c62f7f810f5)

