# Use the official Ruby image as the base image
FROM ruby:2.7.4

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y libxml2-dev libxslt1-dev


# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install project dependencies
RUN bundle install --jobs 4 --retry 3
# RUN bundle config set force_ruby_platform true

# Copy the rest of the application code into the container
COPY . .

RUN rm -f /app/tmp/pids/*.pid

# Precompile assets
# RUN bundle exec rails assets:precompile

# Set environment variables
ENV RAILS_ENV=production
# ENV DB_HOST=0.0.0.0

# RUN bundle exec rails db:migrate
CMD bundle exec rails s -b 0.0.0.0

# Start the Rails server
# CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]








