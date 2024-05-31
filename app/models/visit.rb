class Visit < ApplicationRecord
    belongs_to :user
    
    validates :page_url, presence: true
    validates :ip_address, presence: true
    validates :user_agent, presence: true
    validates :duration, presence: true
end
