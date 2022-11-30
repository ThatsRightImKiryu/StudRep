# frozen_string_literal:false

# Docs
class Twin < ApplicationRecord
  validates_uniqueness_of :input, :twins
  validates_format_of :input, with: /\A\d+\z/
end
