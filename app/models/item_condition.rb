class ItemCondition < ActiveHash::Base
  self.data = [
    { id: 1, item_condition: '---' },
    { id: 2, item_conditions: '新品' },
    { id: 3, item_condition: '未使用' },
    { id: 4, item_condition: '未使用に近い' },
    { id: 5, item_condition: '目立った傷や汚れなし' },
    { id: 6, item_condition: 'やや傷や汚れあり' },
    { id: 7, item_condition: '傷や汚れあり' },
    { id: 8, item_condition: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end