class ListBookmark < ApplicationRecord
  belongs_to :list
  belongs_to :bookmark
end
