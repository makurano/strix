# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'soseki@natsume.com',
  password: 'soseki1',
  password_confirmation: 'soseki1',
  last_name: '夏目',
  last_name_en: 'Natusme',
  first_name: '漱石',
  first_name_en: 'Soseki',
  birthday: '1867-2-9'
)

prof = Profile.new(
  degree: "文学士",
  affiliation: "小説家",
  research_fields: "小説\n俳句\n漢詩\n評論\n随筆",
  contact: "#### soseki@natsume.com\n雑司ヶ谷霊園",
  education: "帝国大学英文科",
  academic_affiliations: "- 余裕派\n- 反自然主義文学",
  user_id: User.find_by(email: 'soseki@natsume.com').id
)
if prof.save
  prof.image.attach(io: File.open('./db/fixtures/images/soseki.jpg'), filename: 'soseki.jpg')
end

User.create(
  email: 'ougai@mori.com',
  password: 'ougai1',
  password_confirmation: 'ougai1',
  last_name: '森',
  last_name_en: 'Mori',
  first_name: '鷗外',
  first_name_en: 'Ougai',
  birthday: '1862-2-17'
)

prof = Profile.new(
  degree: "医学博士\n文学博士",
  affiliation: "陸軍軍医",
  research_fields: "- 小説\n- 翻訳\n- 史伝",
  contact: "#### ougai@mori.com\n禅林寺",
  education: "東京大学医学部",
  academic_affiliations: "- ロマン主義\n- 高踏派",
  user_id: User.find_by(email: 'ougai@mori.com').id
)
if prof.save
  prof.image.attach(io: File.open('./db/fixtures/images/ougai.jpg'), filename: 'ougai.jpg')
end

User.create(
  email: 'junichirou@tanizaki.com',
  password: 'tanizaki1',
  password_confirmation: 'tanizaki1',
  last_name: '谷崎',
  last_name_en: 'Tanizaki',
  first_name: '潤一郎',
  first_name_en: 'Junichirou',
  birthday: '1886-7-24'
)

prof = Profile.new(
  degree: "",
  affiliation: "",
  research_fields: "",
  contact: "#### junichirou@tanizaki.com",
  education: "旧制一高英法科卒業",
  academic_affiliations: "- 耽美派\n- 悪魔主義\n- 古典回帰",
  user_id: User.find_by(email: 'junichirou@tanizaki.com').id
)
if prof.save
  prof.image.attach(io: File.open('./db/fixtures/images/tanizaki.jpg'), filename: 'tanizaki.jpg')
end

User.create(
  email: 'atsushi@nakajima.com',
  password: 'nakajima1',
  password_confirmation: 'nakajima1',
  last_name: '中島',
  last_name_en: 'Nakajima',
  first_name: '敦',
  first_name_en: 'Atsushi',
  birthday: '1909-5-5'
)

prof = Profile.new(
  degree: "文学士",
  affiliation: "小説家",
  research_fields: "- 中国古代武人の苦悩と運命\n- 戦時下の知識人の孤独と苦悩",
  contact: "#### atsushi@nakajima.com\n多摩霊園",
  education: "東京帝国大学文学部国文科",
  academic_affiliations: "",
  user_id: User.find_by(email: 'atsushi@nakajima.com').id
)
if prof.save
  prof.image.attach(io: File.open('./db/fixtures/images/AtsushiNakajima.jpg'), filename: 'AtsushiNakajima.jpg')
end
