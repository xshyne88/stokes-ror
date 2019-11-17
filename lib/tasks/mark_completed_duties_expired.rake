
desc 'checks expired at for all fields and updates the expired fields accordingly'
namespace :completed_duties do
  task :mark_expired => :environment do
    CompletedDuty.where('expires_at > now()').update(expired: true)
  end
end
