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

## .env
JWT_SECRET_KEY

##### 5. ER Diagram of the Application

![erd](https://github.com/SELISEdigitalplatforms/l3-rails-ewbuchs-partnerportal/assets/108412058/b0e7ef29-a223-4f23-8ca2-1d86138c362e)

