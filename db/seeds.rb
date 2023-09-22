# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@admin",
  password: "testtest"
)

taro = User.find_or_create_by!(email: "taro@impasse.com") do |user|
  user.name = "運転太郎"
  user.password = "password"
end

hanako = User.find_or_create_by!(email: "hanako@impasse.com") do |user|
  user.name = "道花子"
  user.password = "password"
end

sota = User.find_or_create_by!(email: "sota@impasse.com") do |user|
  user.name = "曲角颯太"
  user.password = "password"
end

ayaka = User.find_or_create_by!(email: "ayaka@impasse.com") do |user|
  user.name = "袋小路綾香"
  user.password = "password"
end

hattori = Road.find_or_create_by!(address: "日本、〒561-0851 大阪府豊中市服部元町１丁目３−１") do |road|
  road.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/istockphoto-1185199335-612x612.jpg"), filename:"istockphoto-1185199335-612x612.jpg")
  road.lat = 34.7629192370446
  road.lng = 135.47643967441283
  road.car_model = "ノア"
  road.situation = "道幅が狭いうえに業者の路上駐車も多いです。"
  road.star = 3
  road.user = taro
end

kumano_cho = Road.find_or_create_by!(address: "日本、〒560-0014 大阪府豊中市熊野町1丁目6−8") do |road|
  road.lat = 34.78813025339134
  road.lng = 135.478298679371
  road.car_model = "ミライース"
  road.situation = "公園の周りの道はバイク一台分ほどの幅しかなく、そもそも私有地の為通行不可です。"
  road.star = 5
  road.user = hanako
end

okamachi = Road.find_or_create_by!(address: "日本、〒561-0885 大阪府豊中市岡町9−5") do |road|
  road.lat = 34.78034652749242
  road.lng = 135.46605279952212
  road.car_model = "プリウス"
  road.situation = "商店街の入り口になっていて、東側の道は曲がれるものの、道が狭く商店街内に少し入るのでかなり注意が必要。"
  road.star = 2
  road.user = sota
end

sibahara_cho = Road.find_or_create_by!(address: "日本、〒560-0055 大阪府豊中市柴原町2丁目14-1") do |road|
  road.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/istockphoto-1185199335-612x612.jpg"), filename:"istockphoto-1185199335-612x612.jpg")
  road.lat = 34.79833850345676
  road.lng = 135.45906283008426
  road.car_model = "ノア"
  road.situation = "通行量の割に道幅が車一台分しかなく、カーブが激しくて対向車が見えないので、通行の際は注意が必要です。"
  road.star = 1
  road.user = taro
end

izumi_cho = Road.find_or_create_by!(address: "日本、〒564-0041 大阪府吹田市泉町２丁目３３−２") do |road|
  road.lat = 34.760023031284106
  road.lng = 135.5138928854205
  road.car_model = "ミラ"
  road.situation = "そもそもの道幅が狭いことに加え、カーブミラーがかなり道路側に出ていて、メイシアター方面に曲がる際は注意が必要です。"
  road.star = 4
  road.user = ayaka
end

toneyama = Road.find_or_create_by!(address: "日本、〒560-0044 大阪府豊中市刀根山元町1-43") do |road|
  road.lat = 34.79754128615549
  road.lng = 135.45762277845924
  road.car_model = "ミライース"
  road.situation = "四方向全ての道が車一台分しかなく、南⇔西、北⇔東を曲がるには切り返す必要があ ります。"
  road.star = 3
  road.user = hanako
end

ishibashi = Road.find_or_create_by!(address: "日本、〒563-0032 大阪府池田市石橋4丁目21-9") do |road|
  road.lat = 34.80227668377551
  road.lng = 135.44350779554327
  road.car_model = "ミライース"
  road.situation = "入ってしまうと道幅がバイク2台分ほどしかなく、バックで引き返すしかなくなります。"
  road.star = 5
  road.user = hanako
end

konoike = Road.find_or_create_by!(address: "日本、〒578-0971 大阪府東大阪市鴻池本町1-22") do |road|
  road.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/istockphoto-1185199335-612x612.jpg"), filename:"istockphoto-1185199335-612x612.jpg")
  road.lat = 34.698631955573134
  road.lng = 135.59843796926936
  road.car_model = "ノア"
  road.situation = "通行可能ではありますが、歩行者天国になっていて、道幅も狭いので車での通行は不可能です。"
  road.star = 5
  road.user = taro
end

RoadComment.find_or_create_by!(comment: "通行人は多いですか？") do |road_comment|
  road_comment.road = izumi_cho
  road_comment.user = taro
end

RoadComment.find_or_create_by!(comment: "15分に一人通るかどうかくらいです。") do |road_comment|
  road_comment.road = izumi_cho
  road_comment.user = ayaka
end

RoadComment.find_or_create_by!(comment: "ありがとうございます。") do |road_comment|
  road_comment.road = izumi_cho
  road_comment.user = taro
end

RoadComment.find_or_create_by!(comment: "子供も多そうですね。") do |road_comment|
  road_comment.road = kumano_cho
  road_comment.user = sota
end

RoadComment.find_or_create_by!(comment: "T字のどちらも進めませんか？") do |road_comment|
  road_comment.road = ishibashi
  road_comment.user = taro
end

RoadComment.find_or_create_by!(comment: "どちらも車では進めません。") do |road_comment|
  road_comment.road = ishibashi
  road_comment.user = hanako
end

RoadComment.find_or_create_by!(comment: "トラックでは通れそうにないですね。") do |road_comment|
  road_comment.road = okamachi
  road_comment.user = hanako
end

RoadComment.find_or_create_by!(comment: "道幅は何メートルくらいでしたか？") do |road_comment|
  road_comment.road = konoike
  road_comment.user = hanako
end

RoadComment.find_or_create_by!(comment: "3メートルくらいでした。") do |road_comment|
  road_comment.road = konoike
  road_comment.user = taro
end