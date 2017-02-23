class Notification < ApplicationRecord
    belongs_to :notifyable, :polymorphic => true
    
    belongs_to :notify_from, class_name: "User"
    
    belongs_to :notify, class_name: "User"
end
