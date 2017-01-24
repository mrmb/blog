class Video < ActiveRecord::Base
    validates :title, presence: true, length:{ minimum: 10, maximum: 300}
    validates :description, presence: true, length:{ minimum: 10, maximum: 300}
end