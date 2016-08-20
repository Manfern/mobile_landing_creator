# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Page.destroy_all
Offer.destroy_all
Advantage.destroy_all
Feedback.destroy_all
p "Cleared database before loading seeds data"


pages_list=[
    [
    "Интернет магазин женских часов - крашений",
      "РАСПРОДАЖА ИНТЕРНЕТ МАГАЗИНА ЖЕНСКИХ ЧАСОВ - УКРАШЕНИЙ",
     "Распродажа  -70%",
     "Политика конфиденциальности ",
    1
    ]
]
offers_list=[
    [
        "Браслет Pandora",
        50,
        5635,
        1690,
        "Перейти в корзину"
    ],
    [
        "Браслет Swarovski",
        50,
        3180,
        1590,
        "Перейти в корзину"
    ],
    [
        "Cерьги Dior пуссеты",
        50,
        3720,
        1750,
        "Перейти в корзину"
    ]
]

feedbacks_list=[
    [
        "«Заказала по скидке браслет пандора, очень понравилось общение с оператором и быстрая доставка! Рекомендую! Когда еще будут скидки?»",
        "Ирина Чукалина, г. Тюмень"
    ],
    [
        "«Заказал жене украшение Swarovski. Теперь не расстаётся с ним)) Спасибо огромное вашей компании за предоставленную возможность!»",
        "Максим Зюзин, г. Москва"
    ],
    [
        "«Были опасения по качеству товара, в связи с такими огромными скидками, но всё оказалось в порядке, буду тут и дальше покупать, спасибо вам!)»",
        "Мария Краснова г. Ижевск"
    ]
]
advantages_list=['Доставка почтой, бандеролями 1‑го класса, в течение 5‑10 рабочих дней. Стоимость доставки товара от 350 р.','Никаких предоплат! Оплата заказов осуществляется непосредственно по факту получения заказа.', 'Вы вправе отказаться от покупки в течение 14 дней с момента получения заказа, независимо от причины возврата.']

  pages_list.each do |name, title, offer, footer_text, design|
    Page.create( name: name,title: title, offer: offer, footer_text: footer_text, design: design)
  end
  offers_list.each do |name, discount, price_old, price, button_text|
    Offer.create( name: name,discount: discount, price_old: price_old, price: price, button_text: button_text, page_id: 1)
  end
  feedbacks_list.each do |description, author|
    Feedback.create( description: description, author: author, page_id: 1)
  end
  advantages_list.each do |description|
    Advantage.create( description: description, page_id: 1)
  end

p "Created #{Page.count} pages"
p "Created #{Offer.count} offers"
p "Created #{Advantage.count} advantage blocks"
p "Created #{Feedback.count} feedback blocks"

Admin.create!(
    email: "sergei@gmail.com",
    password: "admin123"
)
Admin.create!(
    email: "m1kha1l@hotmail.com",
    password: "qwert2613"
)

p "Created #{Admin.count} admins"

# Different style of seeds.rb
# Page.create(
#     [
#                  {
#                 name: "Интернет магазин женских часов/украшений",
#                 title: "РАСПРОДАЖА ИНТЕРНЕТ МАГАЗИНА ЖЕНСКИХ ЧАСОВ/УКРАШЕНИЙ",
#                 offer: "Распродажа  -70%",
#                 footer_text: "Политика конфиденциальности"
#                }
#     ]
# )

# Offer.create([
#                   {
#                    name: "Браслет Pandora",
#                    discount:"-50%",
#                    price: "5635р",
#                    price_old: "1690р",
#                    button_text: "Перейти в корзину",
#                    page_id: 1
#                   },
#                   {
#                       name: "Браслет Swarovski",
#                       discount:"-50%",
#                       price: "3180",
#                       price_old: "1590",
#                       button_text: "Перейти в корзину",
#                       page_id: 1
#                   },
#                   {
#                       name: "Cерьги Dior пуссеты",
#                       discount:"-50%",
#                       price: "3720р",
#                       price_old: "1750р",
#                       button_text: "Перейти в корзину",
#                       page_id: 1
#                   }
#               ]
# )

# Advantage.create!([{
#                         description: "«Заказала по скидке браслет пандора, очень понравилось общение с оператором и быстрая доставка! Рекомендую! Когда еще будут скидки?»",
#                         author:"Ирина Чукалина, г. Тюмень"
#                   },
#                    {
#                        description: "«Заказал жене украшение Swarovski. Теперь не расстаётся с ним)) Спасибо огромное вашей компании за предоставленную возможность!»",
#                        author: "Максим Зюзин, г. Москва"
#                    },
#                    {
#                        description: "«Были опасения по качеству товара, в связи с такими огромными скидками, но всё оказалось в порядке, буду тут и дальше покупать, спасибо вам!)»",
#                        author: "Мария Краснова г. Ижевск"
#                    }
#                   ])