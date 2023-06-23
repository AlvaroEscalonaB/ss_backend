# Welcome to `ss_backend` repo

## Steps to install locally

1. Make sure you have the ruby version specified in .ruby-version (2.7.4) if you use a ruby version manager like rvm execute `rvm install 2.7.4` or if you use rbenv use `rbenv install 2.7.4`
2. Clone the repository from github, then change directory to it:

```bash
git clone git@github.com:AlvaroEscalonaB/ss_backend.git
cd ss_backend
```

3. Then install the gems with `bundle` or `bundle install`
4. Once all gems are installed create a `.env` file in the root of the folder and set the next variables

```env
DB_USERNAME=postgres
DB_PASSWORD=postgres
SECRET_KEY_BASE=01b7dfacbc224a8f5bc1001563db557c31bc9303ed9958f06c535a9a284ab18bf60fb3199c0173d20ffc424521b3db6fe2ddf9f0c4a4398ee80273b86e228486
```

**Note 1**: If your postgres credentials could be different, addapt it according to your settings.

**Note 2**: You can generate a random key with `rake secret` in terminal

4. Create a `config/database.yml` (use the following that could help you when configuring the `docker-compose.yml`):

```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV.fetch("DB_USERNAME") { 'postgres' } %>
  password: <%= ENV.fetch("DB_PASSWORD") { 'postgres' } %>

development:
  <<: *default
  database: ss_backend_development

test:
  <<: *default
  database: ss_backend_test

production:
  <<: *default
  # url: <%= ENV.fetch('DATABASE_URL') { 'database' } %>
  database: ss_backend_production
  host: <%= ENV.fetch('DB_HOST') { 'localhost' } %>
```

5. Create the database with `rails db:create` then, `rails db:migrate`
6. Now ready to execute the app `rails s` in the terminal

## Docker compose

To run in developent mode in the docker compose is necessary to have the next folder structure with the same names for `ss_frontend` and `ss_backend` then

- `ss-app` (Name doesn't matter here)
  - `ss_frontend`
  - `ss_backend`
- `docker-compose.yml` (Same level of `ss-app`)

The contents of the `docker-compose.yml` are the following:

```Dockerfile
version: '3.9'
services:
  db:
    image: postgres:13
    ports:
      - 5432:5432
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=ss_backend_production
    networks:
      - app_network
  ss_frontend:
    build:
      context: ./ss_frontend
      dockerfile: Dockerfile
    ports:
      - 5173:5173
    depends_on:
      -  ssbackend
    environment:
      - VITE_BACK_API=http://0.0.0.0:3000/api/v1
    networks:
      - app_network
  ssbackend:
    build:
      context: ./ss_backend
      dockerfile: Dockerfile
    ports:
      - 3000:3000
    depends_on:
      - db
    environment:
      - RAILS_ENV=production
      - SECRET_KEY_BASE=279352f03eaab87b6930474e5392f15c13c4de80fbf079ed1c2c0541e64ae996c7aae45e451ea68c478952b199486ee476ea5156e404307eb26b26d7b53de66e
      - DB_USERNAME=postgres
      - DB_PASSWORD=postgres
      - DB_HOST=db
    networks:
      - app_network

networks:
  app_network:
```

To run effectively the migrations you should run the following command in terminal, otherwise you cant:

```bash
docker-compose run ssbackend rails db:migrate
```

Once this effectively done you can go to [`http://localhost:3000/login`](http://localhost:3000/login)

## Development quality, highlights in my opinion

1. The project (together with the frontend) were planified with a trello board with the chrome | firefox extension of card numbers, this way it was possible to organize in smaller tasks and track what things would be possible with the deadline and priorize the structural things. Also the branches were divided and has the prefix of the card number. **Note:** you can ask me for permissions of the trello if you want.
2. Serialize certain responses, although wasn't completely exhaustive through all the controllers, complex responses where serialized. This is specially good due that the frontend is in typescript, then the interfaces could be mapped easily
3. Adapt external libraries: For example is well known that adapt the common third party libraries to the project as plugins or concerns like the jwt gem or the httparty, this is one of the SOLID principles: The Liskov Substitution Principle.
4. Usage of jwt to have a extra layer of security
5. Test of models and requests were performed, with a total of 28 tests on every model and controller used.
6. A `github actions` were scheduled on every push of main branch to execute the tests. The yml file of settings is allocated in `/.github/workflows/ci.yml`
7. The project was deployed in `render.com` host, this has webhook with github to rebuild the project on every push. In particular is a branch dedicated to the server, this for the database.yml config that set the database url:

```
production:
  <<: *default
  # url: <%= ENV.fetch('DATABASE_URL') { 'database' } %>
  database: ss_backend_production
  url: <%= ENV.fetch('DATABASE_URL') { 'database' } %>
```

The base path is: [`https://ss-backend.onrender.com`](https://ss-backend.onrender.com)

## To improve

1. Use the jwt-devise gem with a strategy to have and only one token active for a particular user, also to have a better testing experience, althogh the jwt gem gives you more control.
2. Exhaustive testing and see the coverage report of all the application
3. Use a factory for testing to repeat less code

## UML

![UML](./ClassDiagram.png)
