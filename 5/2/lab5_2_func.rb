# frozen_string_literal: true

require 'time'

def max_date(str)
  str.split(' ').group_by { |s| (Date.today - Date.strptime(s, '%Y-%m-%d')).abs }.min[1][0]
rescue NoMethodError, Date::Error
  nil
end
