class Book < ApplicationRecord
    belongs_to :user
    has_one :book_issues
end