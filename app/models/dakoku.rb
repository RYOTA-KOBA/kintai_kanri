class Dakoku < ApplicationRecord
  enum dakoku_type: {
    syukkin: 0, taikin: 1, kyukei_start: 2, kyukei_end: 3
  }
end
