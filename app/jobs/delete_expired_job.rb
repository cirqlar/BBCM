class DeleteExpiredJob < ActiveJob::Base
  queue_as :deleters

  def perform()
    ans = Announcement.where("expires_at < ?", Date.today)
    ans.each do |an|
      an.destroy
    end
  end
end
