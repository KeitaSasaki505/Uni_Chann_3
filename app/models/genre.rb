class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'お知らせ' },
    { id: 2, name: '地域行事' },
    { id: 3, name: 'ワークショップ' },
    { id: 4, name: 'ヘルプ' },
    { id: 5, name: 'スポーツ' },
    { id: 6, name: 'グルメ' },
    { id: 7, name: '観光' },
    { id: 8, name: 'その他' },
  ]
end