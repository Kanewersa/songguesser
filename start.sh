export RAILS_SERVE_STATIC_FILES=true
RAILS_ENV=production rails assets:precompile
yarn build:css
RAILS_ENV=production rails server -b 0.0.0.0 -p 3000
