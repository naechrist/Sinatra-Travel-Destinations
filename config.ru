require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run Rack::MethodOverride #allows us to use 'patch' and 'delete' requests
use TravelDestinationsController #mounting the other controller classes 
use UsersController
run ApplicationController
