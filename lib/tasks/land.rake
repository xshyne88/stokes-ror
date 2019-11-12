
desc 'hi there'
namespace :land do
  task :update => :environment do
    LandScheduler.run
  end
end
