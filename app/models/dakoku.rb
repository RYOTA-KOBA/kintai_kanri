class Dakoku < ApplicationRecord
  belongs_to :attendance
  attr_accessor :syukkin, :taikin, :kyukei_start, :kyukei_end

  enum dakoku_type: {
    syukkin: 0, taikin: 1, kyukei_start: 2, kyukei_end: 3
  }
end
