# ss_backend repo

## Steps to install locally

1. Make sure you have the ruby version specified in .ruby-version (2.7.7) if you use a ruby version manager like rvm execute `rvm install 2.7.7` or if you use rbenv use `rbenv install 2.7.7`
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

**Note**: You can generate a random key with `rake secret` in terminal

4. Create a `config/database.yml` file with the configuration of your postgresql database
5. Create the database with `rails db:create` then, `rails db:migrate`

## Docker
