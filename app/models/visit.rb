class Visit < ActiveRecord::Base
  belongs_to :tab   , counter_cache: true
  belongs_to :artist, counter_cache: true
  belongs_to :user  , counter_cache: true
end