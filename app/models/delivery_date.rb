class DeliveryDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1日~2日で発送' },
    { id: 3, name: '2日~3日で発送' },
    { id: 4, name: '3日~4日で発送' }
  ]
end
