namespace :subscription do
  desc "send prior notification for replenishment items"
  task prior_notify: :environment do |t, args|
    Spree::Subscription.eligible_for_subscription.find_in_batches do |batches|
      batches.map(&:send_prior_notification)
    end
  end
end
