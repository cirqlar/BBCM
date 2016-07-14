class AnnounceJob < ActiveJob::Base
  queue_as :mailers

  rescue_from(ActiveJob::DeserializationError) do |exception|
    # return true (we rescued) if the error causing the deserialization
    # error was a record not being found
    exception.original_exception == ActiveRecord::RecordNotFound
  end

  def perform(an)
    subers = Subscriber.all
    subers.each do |suber|
      AnnouncementsMailer.announce(suber, an).deliver_later
    end
  end
end
