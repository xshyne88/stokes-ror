desc "checks expired at for all fields and updates the expired fields accordingly"
namespace :completed_duties do
  task mark_expired: :environment do
    completed_duties = CompletedDuty.where("expires_at < now()")

    if completed_duties.count > 0
      completed_duties.update(expired: true)
      pp "Marked #{completed_duties.count} as expired. Current Time is: #{DateTime.now}"
    else
      pp "#{DateTime.now} - No expirations"
    end
  end
end
