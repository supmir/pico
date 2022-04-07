# README

- Ruby version
  2.7.5

- How to run the test suite

  > `bin/rails test`

- Run development server

  > ```
  > bundle install
  > rails server
  > ```

- Deployment instructions
  With heroku installed and logged in, clone this repository and cd into it
  > ```
  > heroku create
  > git push heroku main
  > heroku run rake db:migrate
  > ```
- Push instructions
  > ```
  > git push heroku main
  > heroku run rake db:migrate
  > heroku open
  > ```
