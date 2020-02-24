FROM ruby as build-stage
WORKDIR /app/
COPY . /app
RUN gem install bundler
RUN bundle update --bundler
RUN bundle install
RUN bundle exec jekyll build

FROM nginx:1.15
COPY --from=build-stage /app/_site/ /usr/share/nginx/html
