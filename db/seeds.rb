puts "============= Seeding Data Start ============="

item1 = Item.create(
                    title: "Vanillisimo",
                    description: "The secret to the richer and creamier vanilla
                    flavor is the French custard base in this ice cream.",
                    price: 2.99,
                    status: 1)

item2 = Item.create(title:       "Fudge Vanilla",
                    description: " Our delicious traditional vanilla ice cream
                    with a chocolate fudge sauce rippled throughout.",
                    price:       2.49,
                    status:      1)

item3 = Item.create(title:       "Chocolate",
                    description: "A hit with the kids and one of our Top 10
                    flavors, our rich chocolate is made with real cocoa
                    powder.",
                    price:       1.99,
                    status:      1)

item4 = Item.create(title:       "Chocolate Almond",
                    description: "Our popular chocolate ice cream with fresh
                    roasted almonds pieces sprinkled throughout.",
                    price:       2.49,
                    status:      1)

item5 = Item.create(title:       "Rocky Road",
                    description: "Similar to Chocolate Almond ice cream, Rocky
                    Road also has mini marshmallows mixed in.",
                    price:       2.49,
                    status:      1)

item6 = Item.create(title:       "Chocolate Marshmallow",
                    description: "This chocolate based ice cream has a
                    marshmallow sauce gently folded in.",
                    price:       2.49,
                    status:      1)

item7 = Item.create(title:       "Chocolate Peanut Butter",
                    description: "One of our Top 10 flavors, this chocolate ice
                    cream features a dense peanut butter ripple throughout.",
                    price:       2.49,
                    status:      1)

item8 = Item.create(title:       "Chocolate Chip",
                    description: " A classic flavor, this vanilla ice cream has
                    dark chocolate shavings in it.",
                    price:       2.49,
                    status:      1)

item9 = Item.create(title:       "Mint Chocolate Chip",
                    description: "This refreshing light green mint ice cream is
                    one of our Top 10 flavors and has slivers of rich dark
                    chocolate all through it.",
                    price:       2.49,
                    status:      1)

item10 = Item.create(title:      "Peppermint Stick",
                    description: "Available year-round, this pink peppermint
                    ice cream has tiny pieces of peppermint candies sprinkled
                    in.",
                    price:       2.49,
                    status:      1)

item11 = Item.create(title:      "Buckeye",
                    description: " One of our Top 10 flavors, we take peanut
                    butter ice cream and ripple in chocolate sauce and mini
                    buckeye candies.",
                    price:       2.49,
                    status:      1)

item12 = Item.create(title:      "Moose Tracks",
                    description: "Similar to Buckeye and a Top 10 favorite,
                    this vanilla based flavor has a chocolate ripple and mini
                    peanut butter cups in it.",
                    price:       2.49,
                    status:      1)

item13 = Item.create(title:      "Cookies 'N' Cream",
                    description: "We add lots of sandwich cookie pieces to our
                    vanilla ice cream to create this classic flavor.",
                    price:       2.49,
                    status:      1)

item14 = Item.create(title:      "Peanut Butter",
                    description: "This creamy flavor has lots of peanut butter
                    sauce and our famous crushed nuts in it, to give it a rich
                    peanutty taste.",
                    price:       2.49,
                    status:      1)

item15 = Item.create(title:      "Cookie Dough",
                    description: "We start with cookie dough flavored ice cream
                    and mix in bits of chocolate chip cookie dough and mini
                    chocolate morsels.",
                    price:       2.49,
                    status:      1)

item16 = Item.create(title:      "Toffee Caramel Crunch",
                    description: "Another one of our Top 10 flavors, this
                    toffee based ice cream has a rich caramel swirl with
                    slivers of almond and chocolate toffee pieces in it.",
                    price:       2.49,
                    status:      1)

item17 = Item.create(title:      "Coffee",
                    description: "This one will give you a caffeine kick since
                    it’s flavored with fresh ground coffee.",
                    price:       2.49,
                    status:      1)

item18 = Item.create(title:      "Strawberry",
                    description: "With ripe chunks of strawberries blended
                    throughout, this fruity flavor is a big seller year round.",
                    price:       2.49,
                    status:      1)

item19 = Item.create(title:      "Strawberry Cheescake",
                    description: "A cheesecake flavored ice cream with our
                    chunky strawberry sauce marbled in.",
                    price:       2.49,
                    status:      1)

item20 = Item.create(title:      "Lemon Custard",
                    description: "This French custard based ice cream has a
                    tangy lemon flavor.",
                    price:       2.49,
                    status:      1)

category1 = Category.create(
                            title:       "Rockanillas",
                            description: "Yellow is the new black")

category2 = Category.create(title:       "Chocolate Yumm Yumm",
                            description: "The flavor of love")

category3 = Category.create(title:       "Strawbellisima",
                            description: "Pink for you")

category4 = Category.create(title:       "Animalism!",
                            description: "Flavors from the farm")

category5 = Category.create(title:       "Badass",
                            description: "Just for real rockstars")

category1.items << item1
category1.items << item2
category1.items << item3
category1.items << item4
category2.items << item5
category2.items << item6
category2.items << item7
category2.items << item8
category3.items << item9
category3.items << item10
category3.items << item11
category3.items << item12
category4.items << item13
category4.items << item14
category4.items << item15
category4.items << item16
category5.items << item17
category5.items << item18
category5.items << item19
category5.items << item20


# Create the users
#
# user1 = User.create(first_name:      "Jeff",
#                     last_name:       "Casimir",
#                     email:           "jeff@jumpstartlab.com"
#                     username:        "jeff",
#                     password_digest: "",
#                     salt:            "",
#                     address_id:      "",
#                     role:            "")
#

# user1 = User.create(first_name:      "Jorge",
#                     last_name:       "Tellez",
#                     email:           "jorge@jumpstartlab.com"
#                     username:        "jorge",
#                     password_digest: "",
#                     salt:            "",
#                     address_id:      "",
#                     role:            "")
#
admin_josh = User.create(first_name:     "Josh",
                  last_name:             "Cheek",
                  email:                 "josh@jumpstartlab.com",
                  username:              "josh",
                  password:              "password",
                  password_confirmation: "password",
                  role:                   "admin")

admin_rachel = User.create(first_name:     "Rachel",
                  last_name:             "Warbelow",
                  email:                 "rachel@jumpstartlab.com",
                  password:              "password",
                  password_confirmation: "password",
                  role:                   "default",
                  street:                 "1510 Blake St",
                  city:                   "Denver",
                  state:                  "CO",
                  zipcode:                "80202")

order1 = User.find(2).orders.create(status: "paid", receiving: "Delivery")
order2 = User.find(2).orders.create(status: "paid", receiving: "Delivery")
order3 = User.find(2).orders.create(status: "ordered", receiving: "Delivery")
order4 = User.find(2).orders.create(status: "completed", receiving: "Delivery")
order5 = User.find(2).orders.create(status: "completed", receiving: "Delivery")
order6 = User.find(2).orders.create(status: "cancelled", receiving: "Delivery")
order7 = User.find(2).orders.create(status: "cancelled", receiving: "Delivery")
order7 = User.find(2).orders.create(status: "ordered", receiving: "Delivery")


order1.cart_items.create(item_id: 1)
order1.cart_items.create(item_id: 1)
order1.cart_items.create(item_id: 2)
order1.cart_items.create(item_id: 4)
order2.cart_items.create(item_id: 4)
order2.cart_items.create(item_id: 7)

puts "============= Seeding Data End ============="
