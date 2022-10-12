# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'open-uri'


Review.delete_all
CartItem.delete_all
CategoryItem.delete_all
CollectionCategory.delete_all
Cart.delete_all
Item.delete_all
Category.delete_all
Collection.delete_all
User.delete_all

demo = User.create!(email: 'demo@email.com', password: 'password', first_name: 'Lynn', last_name: 'Hill', company_name: 'App Academy' )
democart = Cart.create!(user_id: demo.id)

climb = Category.create!(name:'Climb', image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/climb.jpg')

ski = Category.create!(name: 'Ski & Ride', image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/ski.jpg' )


rock_protection = Category.create!(name: 'Rock Protection', parent_id: climb.id,image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image6.jpg')
# shoes = Category.create!(name: 'Shoes', parent_id: climb.id)
helmets = Category.create!(name: 'Helmets', parent_id: climb.id, image_url: 'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image1.jpg')
ice_and_alpine = Category.create!(name: 'Ice & Alpine', parent_id: climb.id, image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/category7.JPG')
jackets = Category.create!(name: 'Jackets', parent_id: ski.id, image_url: 'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image4.jpg')
# packs = Category.create!(name: 'Climbing Packs & Packpacks', parent_id: climb.id, image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/packs.jpg')
packs = Category.create!(name: 'Packs', parent_id: climb.id, image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image2.jpg')
wbottoms = Category.create!(name: 'Bottoms',  image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/2016-03-13+16.59.55.jpg')
womensjackets = Category.create!(name: 'Jackets',  image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image10.JPG')
mensjackets = Category.create!(name: 'Jackets',  image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/climbhike.JPG')
accesories = Category.create!(name: 'Accessories', image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image3.jpg')
tents = Category.create!(name: 'Tents', image_url: 'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image18.jpg')
mharnesses = Category.create!(name: 'Harnesses', parent_id: climb.id, image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image9.JPG')
headlamps = Category.create!(name: 'Lighting', image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/category7.JPG')
mbottoms  = Category.create!(name: 'Bottoms',  image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/IMG_0589.jpg')
jackets = Category.create!(name: 'Jackets')
winter = Category.create!(name: 'Winter')
wharnesses = Category.create!(name: "Harnesses", image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/womanclimmb.JPG')
harnesses = Category.create!(name: "Harnesses", image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/womanclimmb.JPG')

winter1 = Collection.create!(name: 'Winter',activity: true, image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/sunset.jpg')
CollectionCategory.create!(collections_id: winter1.id, categories_id: ski.id)
CollectionCategory.create!(collections_id: winter1.id, categories_id: ice_and_alpine.id)
# CollectionCategory.create!(collections_id: winter.id, categories_id: jackets.id)

climbing = Collection.create!(name: 'Climbing', activity: true, image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image7.jpg')
CollectionCategory.create!(collections_id: climbing.id, categories_id: rock_protection.id)

CollectionCategory.create!(collections_id: climbing.id, categories_id: helmets.id)
CollectionCategory.create!(collections_id: climbing.id, categories_id: harnesses.id)



equipment = Collection.create!(name: 'Equipment', image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/bannerimages/image3.jpg')
CollectionCategory.create!(collections_id: equipment.id, categories_id: climb.id)
CollectionCategory.create!(collections_id: equipment.id, categories_id: ice_and_alpine.id)
CollectionCategory.create!(collections_id: equipment.id, categories_id: ski.id)

CollectionCategory.create!(collections_id: equipment.id, categories_id: tents.id)

CollectionCategory.create!(collections_id: equipment.id, categories_id: packs.id)
CollectionCategory.create!(collections_id: equipment.id, categories_id: harnesses.id)


mens = Collection.create!(name: "Men's", image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/climb.jpg')
CollectionCategory.create!(collections_id: mens.id, categories_id: mharnesses.id)
CollectionCategory.create!(collections_id: mens.id, categories_id: mensjackets.id)
CollectionCategory.create!(collections_id: mens.id, categories_id: mbottoms.id)



womens = Collection.create!(name: "Women's", image_url: "https://bluesquarebucket.s3.us-west-1.amazonaws.com/2016-03-13+15.50.46.jpg")
CollectionCategory.create!(collections_id: womens.id, categories_id: wharnesses.id)
CollectionCategory.create!(collections_id: womens.id, categories_id: womensjackets.id)
CollectionCategory.create!(collections_id: womens.id, categories_id: wbottoms.id)



camping = Collection.create!(name: "Camping", activity: true, image_url: "https://bluesquarebucket.s3.us-west-1.amazonaws.com/8.jpg")

CollectionCategory.create!(categories_id: tents.id, collections_id: camping.id)
CollectionCategory.create!(categories_id: packs.id, collections_id: camping.id)
CollectionCategory.create!(categories_id: accesories.id, collections_id: camping.id)

# impulse= Item.create(name:'Impulse 112 Skis',
# description:'Built for freeriders who love playful, deep-snow performance yet demand control when launching down steep, aggressive lines, the Impulse 112’s are the big guns you want on a storm day. Wide-waisted at 112-mm, these skis are floaty for deep conditions, while the playful turning radius keeps them nimble for lines that require confidence and accuracy. Their flat, solid-core construction adds torsional stiffness and provides premium power transmission, dampness and stability to hold fast while charging on harder snow. Austrian-made with pre-preg fiberglass and an engineered poplar core, The Impulse 112 is built for the progressive freerider looking to get after it.',
# price:799.95,
# image_url:'')

c4_0_3 = Item.create!(name: 'C4 #0.3',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-0.3.webp')
CategoryItem.create!(items_id: c4_0_3.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_0_3.id, categories_id: climb.id)
CategoryItem.create!(items_id: c4_0_3.id, categories_id: ice_and_alpine.id)

c4_0_4 = Item.create!(name: 'C4 #0.4',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url: 'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-0.4.webp')
CategoryItem.create!(items_id: c4_0_4.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_0_4.id, categories_id: climb.id)
CategoryItem.create!(items_id: c4_0_4.id, categories_id: ice_and_alpine.id)

c4_0_5 = Item.create!(name: 'C4 #0.5',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url: 'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-0.5.webp')
CategoryItem.create!(items_id: c4_0_5.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_0_5.id, categories_id: climb.id)
CategoryItem.create!(items_id: c4_0_5.id, categories_id: ice_and_alpine.id)

c4_0_75 = Item.create!(name: 'C4 #0.75',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url: 'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-0.75.webp')
CategoryItem.create!(items_id: c4_0_75.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_0_75.id, categories_id: climb.id)
CategoryItem.create!(items_id: c4_0_75.id, categories_id: ice_and_alpine.id)

c4_1 = Item.create!(name: 'C4 #01',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-1.webp')
CategoryItem.create!(items_id: c4_1.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_1.id, categories_id: climb.id)
CategoryItem.create!(items_id: c4_1.id, categories_id: ice_and_alpine.id)

c4_2 = Item.create!(name: 'C4 #02',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-2.webp')
CategoryItem.create!(items_id: c4_2.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_2.id, categories_id: climb.id)
CategoryItem.create!(items_id: c4_2.id, categories_id: ice_and_alpine.id)

c4_3 = Item.create!(name: 'C4 #03',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-3.webp')
CategoryItem.create!(items_id: c4_3.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_3.id, categories_id: climb.id)
CategoryItem.create!(items_id: c4_3.id, categories_id: ice_and_alpine.id)

c4_4 = Item.create!(name: 'C4 #04',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-4.webp')
CategoryItem.create!(items_id: c4_4.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_4.id, categories_id: climb.id)


c4_5 = Item.create!(name: 'C4 #05',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-5.webp')
CategoryItem.create!(items_id: c4_5.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_5.id, categories_id: climb.id)


c4_6 = Item.create!(name: 'C4 #06',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-6.webp')
CategoryItem.create!(items_id: c4_6.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_6.id, categories_id: climb.id)


c4_7 = Item.create!(name: 'C4 #07',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-7.webp')
CategoryItem.create!(items_id: c4_7.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_7.id, categories_id: climb.id)


c4_8 = Item.create!(name: 'C4 #08',
description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
price:79.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-8.webp')
CategoryItem.create!(items_id: c4_8.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: c4_8.id, categories_id: climb.id)


screwup = Item.create!(name: 'Ice Screw Up',
description:"Protect and organize your winter rack with the Blue Square Ice ScrewUp. This lightweight, convenient roll-up pouch protects the threads and teeth of your ice screws and saves space when they're stored in your pack.",
price:21.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/IceScrewUp.webp')

CategoryItem.create!(items_id: screwup.id, categories_id: climb.id)
CategoryItem.create!(items_id: screwup.id, categories_id: ice_and_alpine.id)

sabre = Item.create!(name: 'Sabretooth Crampons',
description:"From moderate local ice flows to classic mountaineering routes and technical alpine faces, the Blue Square Sabretooth Crampon is our best all-around crampon for the spectrum of frozen objectives. The Sabretooth’s redesigned stainless steel construction incorporates a strong, yet light design with durable horizontal front points and increased rocker in the front rail to accommodate modern mountain boots. The dual secondary points are optimized for technical precision, while still maintaining a balanced, stable platform on descents and lower angle terrain.",
price:199.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/SabretoothCramons.webp')

CategoryItem.create!(items_id: sabre.id, categories_id: climb.id)
CategoryItem.create!(items_id: sabre.id, categories_id: ice_and_alpine.id)



slinger = Item.create!(name: 'Slinger Leash',
description:"A single, lightweight piolet-specific version of our popular Spinner Leash, the Blue Square Slinger Leash is a stretchy tethering system for keeping your piolet attached without a wrist leash. We've upgraded the leash with a locking carabiner for added security when clipped to your axe's head or spike, we've added extension to the elastic webbing, and we've updated the webbing to polyester which absorbs less water than standard nylon.",
price:29.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/SlingerLeash.webp')
CategoryItem.create!(items_id: slinger.id, categories_id: rock_protection.id)
CategoryItem.create!(items_id: slinger.id, categories_id: climb.id)
CategoryItem.create!(items_id: slinger.id, categories_id: ice_and_alpine.id)

swift = Item.create!(name: 'Swift Ice Axe',
description:"With an adjustable pommel and a T rating, the Blue Square Swift takes mountaineering piolets into the 21st century. One-piece hot forged stainless steel head construction, ergonomic shaft and technical profile for performance in technical snow sections and the FlickLock™ pommel adds adjustability for varying terrain.",
price:199.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/SwiftIceAxe.webp')

CategoryItem.create!(items_id: swift.id, categories_id: climb.id)
CategoryItem.create!(items_id: swift.id, categories_id: ice_and_alpine.id)

ulice = Item.create!(name: 'Ultralight Ice Screw',
description:"Designed for ski mountaineering, glacial travel and high-end alpinism, the Ultralight Ice Screw says it all in the name. Weighing in at 45% lighter than our Express Screws, the Ultralight Screw combines a steel tip with an aluminum body and forged aluminum hanger that features two clip-in points. The innovative wire-gate Express handle shaves more weight and also clicks open and closed. The Ultralights are also easily identified by length with the classic BD color scheme.",
price:84.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/ULIce.webp')

CategoryItem.create!(items_id: ulice.id, categories_id: climb.id)
CategoryItem.create!(items_id: ulice.id, categories_id: ice_and_alpine.id)

viperice = Item.create!(name: 'Viper Ice Tool',
description:"A durable, easy-to-swing tool built for a full season of winter climbing objectives, the redesigned Blue Square Viper Ice Tool provides all-around performance for the ice and alpine climber. The Viper’s hydroformed shaft extends through the grip for maximum rigidity and a responsive feel, and our Natural Pick is included to beef up durability on scrappy mountain terrain. The adjustable FlickLock® pommel acts as a secondary grip position for ice climbing and cragging and easily slides up the shaft for choking up on low-angle snow slopes. The modular head allows for easy changing of picks and swapping between hammer and adze.",
price:259.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/ViperIceTool.webp')

CategoryItem.create!(items_id: viperice.id, categories_id: climb.id)
CategoryItem.create!(items_id: viperice.id, categories_id: ice_and_alpine.id)

impulse112 = Item.create!(name: 'IMPULSE 112 SKIS',
description: 'Built for freeriders who love playful, deep-snow performance yet demand control when launching down steep, aggressive lines, the Impulse 112’s are the big guns you want on a storm day. Wide-waisted at 112-mm, these skis are floaty for deep conditions, while the playful turning radius keeps them nimble for lines that require confidence and accuracy. Their flat, solid-core construction adds torsional stiffness and provides premium power transmission, dampness and stability to hold fast while charging on harder snow. Austrian-made with pre-preg fiberglass and an engineered poplar core, The Impulse 112 is built for the progressive freerider looking to get after it.',
price: 799.95,
image_url: 'https://bluesquarebucket.s3.us-west-1.amazonaws.com/skis/Impulse.webp')
CategoryItem.create!(items_id:impulse112.id, categories_id: winter.id )
CategoryItem.create!(items_id: impulse112.id, categories_id: ski.id)

impulse104 = Item.create!(name: 'IMPULSE 104 SKIS',
  description:'Looking for a ski that will carve smooth arcs on the hill and then float through pow on the other side of the rope? You’re welcome. The Impulse 104 is an all-mountain charger, featuring a 104-mm waist that provides nimble turnability when needed, and playful, floaty performance in deep powder. The ski’s flat, solid-core construction and full ABS sidewalls add torsional stiffness and provides premium power transmission, dampness and stability to hold fast while charging on harder snow. Austrian-made with pre-preg fiberglass and an engineered poplar core, The Impulse 104 is a freerider’s one-ski quiver built to rip.',
  price: 799.95,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/skis/impulse104.webp")
  CategoryItem.create!(items_id: impulse104.id, categories_id: ski.id)
CategoryItem.create!(items_id:impulse104.id, categories_id: winter.id )

  impulse98 = Item.create!(name:'IMPULSE 98 SKIS',
  description: "Built to carve playfully through chalky powder yet open up and rip when conditions get steep and technical, the Impulse 98 features a moderate, 98-mm waist that’s versatile for all-mountain skiers. A flat, solid-core construction for added torsional stiffness provides premium power transmission and the dampness and stability to hold fast while charging on harder snow. Austrian-made with pre-preg fiberglass and an engineered poplar core, The Impulse 98 is the daily driver for all-mountain skiers who need playful planks that can charge on command.",
price: 699.95,
image_url: "https://bluesquarebucket.s3.us-west-1.amazonaws.com/skis/impulse98.webp")
  CategoryItem.create!(items_id: impulse98.id, categories_id: ski.id)
CategoryItem.create!(items_id:impulse98.id, categories_id: winter.id )

  helio1042 = Item.create!(name: 'HELIO CARBON 104 SKIS 2ND',
  description: "Our Helio Carbon 104 is built for dawn-to-dusk backcountry missions where slashing powder stashes is the name of the game. Balancing playful, soft-snow performance with a lightweight build and technical precision for when conditions are variable, the Helio 104 features a pre-preg carbon fiber layup with full-perimeter ABS sidewalls for improved dampness and a smooth ride, while the engineered paulownia wood core keeps it lightweight for big vert days in the backcountry. The Helio also maintains a smooth flex and torsional stiffness for reliable, responsive skiing on the way down. Early rise in the tip and tail improves flotation and trail-breaking efficiency, and an ABS tail protector also has an integrated skin-clip tab to keep your skins from sliding off. These Skis feature minor cosmetic flaws that in no way affect their performance use or safety; typically there is a blemish in the top sheet.",
    price: 879.95,
  image_url: "https://bluesquarebucket.s3.us-west-1.amazonaws.com/skis/helioc.webp")
  CategoryItem.create!(items_id: helio1042.id, categories_id: ski.id)
  CategoryItem.create!(items_id:helio1042.id, categories_id: winter.id )


  helio104 = Item.create!(name: 'HELIO CARBON 104 SKIS 2ND',
    description: "Our Helio Carbon 104 is built for dawn-to-dusk backcountry missions where slashing powder stashes is the name of the game. Balancing playful, soft- snow performance with a lightweight build and technical precision for when conditions are variable, the Helio 104 features a pre-preg carbon fiber layup with full-perimeter ABS sidewalls for improved dampness and a smooth ride, while the engineered paulownia wood core keeps it lightweight for big vert days in the backcountry. The Helio also maintains a smooth flex and torsional stiffness for reliable, responsive skiing on the way down. Early rise in the tip and tail improves flotation and trail-breaking efficiency, and an ABS tail protector also has an integrated skin-clip tab to keep your skins from sliding off.",
  price: 899.95,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/skis/helioc104.webp")
CategoryItem.create!(items_id: helio104.id, categories_id: ski.id)
CategoryItem.create!(items_id:helio104.id, categories_id: winter.id )

cirque = Item.create!(name: 'CIRQUE 84 SKIS',
  description: "Designed for moving fast and light in the mountains, the Cirque 84 can hustle. With its 84-mm waist, this ultralight machine can pick off technical couloirs while maintaining a smooth ride, thanks to its ultralight pre-preg carbon fiber layup and engineered paulownia wood core. Partial ABS sidewalls add dampness while keeping the weight to a minimum. A smooth flex combined with torsional stiffness keeps you solid with precise edge control on high-speed speed descents, and the ABS tail protector also has an integrated skin-clip tab to keep your skins secure when gunning for the summit. The tip is notched to allow for a variety of lightweight skin attachment methods.",
  price:"799.95",
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/skis/cirque.webp")
CategoryItem.create!(items_id:cirque.id, categories_id: winter.id )
CategoryItem.create!(items_id: cirque.id, categories_id: ski.id)

cardif = Item.create!(name:"BD X CARDIFF CO-LAB SPLITBOARD",
description:"Five years of testing and refinement, ten different iterations, and an untold number of days, mountain ranges, and descents. The Goat—a big-mountain charger that pro rider Bjorn Leines called the best board he's ever ridden—is the original Cardiff board design and is now better than ever. The Blue Square x Cardiff Co-lab is a durable splitboard that can engage on icy sidehills, make surfy, high-speed turns, and take you up and down big, intimidating lines the world over. Original artwork by Kyson Dana, portraying the fearless mountain denizen who inspired this board.",
price: 1199.95,
image_url: "https://bluesquarebucket.s3.us-west-1.amazonaws.com/skis/cardif.webp")
CategoryItem.create!(items_id:cardif.id, categories_id: ski.id )
CategoryItem.create!(items_id:cardif.id, categories_id: winter.id )

mission4p = Item.create!(name: "MISSION 4P TENT",
description:"The Mission 4P is a fast pitching double wall tent built for mountaineering and expedition style pursuits. The hoop and hub exterior pole architecture of the Mission combined with the pre-attached fly allows the tent to be easily pitched in even the worst conditions. This unique hybrid dome/tunnel design is engineered to withstand high wind loads from all directions, while the scalloped perimeter and large vents provide ample airflow. The 30d high tenacity polyester fabric is seam-sealed, durable and does not sag in wet environments. An extended front vestibule with twin doors not only allows for leeward access but also provides space for cooking in inclement weather. From basecamp layovers to high altitude storms the Mission tent is the place to be when the weather hits.",
price: 1199.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/tents/mission4p.webp")
  CategoryItem.create!(items_id: mission4p.id, categories_id: tents.id)


mission3p = Item.create!(name: "MISSION 3P TENT",
description:"The Mission 3P is a fast pitching double wall tent built for mountaineering and expedition style pursuits. The hoop and hub exterior pole architecture of the Mission combined with the pre-attached fly allows the tent to be easily pitched in even the worst conditions. This unique hybrid dome/tunnel design is engineered to withstand high wind loads from all directions, while the scalloped perimeter and large vents provide ample airflow. The 30d high tenacity polyester fabric is seam-sealed, durable and does not sag in wet environments. Twin doors and double vestibules allow leeward access in strong weather, making the Mission a bomber shelter for basecamp layovers or high-altitude adventures.",
price:999.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/tents/mission3.webp")
 CategoryItem.create!(items_id: mission3p.id, categories_id: tents.id)

firstlight2p = Item.create!(name: "FIRSTLIGHT 2P TENT",
description:"A compact two-person, four-season tent built for weight-conscious climbers, the Blue Square FirstLight is based on the I-Tent's expedition-specific design with steep walls and a simple floor shape to optimize living space and increase headroom. For durability, all seams are double sewn, and the stress points are reinforced. With two equal length DAC Featherlite poles that fit inside the tent with hook-and-loop wraps, it's easy to set up-even from inside. For cross ventilation, both the small rear window and the door are covered with no-see-um mesh. The canopy is constructed with water resistant, breathable NanoShield fabric. For interior organization, the FirstLight has two interior mesh pockets.",
price: 449.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/tents/firstlight2p.webp")
 CategoryItem.create!(items_id: firstlight2p.id, categories_id: tents.id)


firstlight3p = Item.create!(name: "FIRSTLIGHT 3P TENT",
description:"A compact three-person, four-season tent built for weight-conscious climbers, the Blue Square FirstLight is based on the I-Tent's expedition-specific design with steep walls and a simple floor shape to optimize living space and increase headroom. For durability, all seams are double sewn, and the stress points are reinforced. With two equal length DAC Featherlite poles that fit inside the tent with hook-and-loop wraps, it's easy to set up-even from inside. For cross ventilation, both the small rear window and the door are covered with no-see-um mesh. The canopy is constructed with water resistant, breathable NanoShield fabric. For interior organization, the FirstLight has three interior mesh pockets.",
price: 499.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/tents/firstlight3p.webp")
CategoryItem.create!(items_id: firstlight3p.id, categories_id: tents.id)

ahwa = Item.create!(name: "AHWAHNEE TENT VESTIBULE",
description:"The Blue Square Ahwahnee Vestibule is constructed with lightweight, waterproof SilPoly fabric and adds 1.2 square meters (13 sq ft) of storage space to the Ahwahnee tent.",
price: 199.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/tents/awhan.jpeg")
CategoryItem.create!(items_id: ahwa.id, categories_id: tents.id)


mensvisionhybrid = Item.create!(name:"VISION HYBRID HOODY - MEN'S",
description: "Optimized for movement in the mountains, the Vision Hybrid Hoody is an active insulation layer that breathes and moves with you while keeping you warm. Featuring Japanese liquid crystal polymer ripstop construction in high abrasion areas, this hoody is ultra-durable, while the body-mapped construction adds breathability and stretch to the underarms and back panels. The 60g PrimaLoft Gold Insulation with Cross Core technology includes NASA-developed Aerogel, which is used in space suits and remains hyper-light while maintaining the industry’s best warmth-to-weight ratio. Two harness-compatible zippered hand pockets are combined with a right-hand stow pocket and zippered chest pocket to stash essentials while adventuring. It also features an internal drop pocket which provides warm shelter for gloves or beanies. An integrated hem gasket and elastic cuffs keeps drafts out while the helmet-compatible hood adds extra protection from wind and snow.",
price: 295.00,
size: true,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/mensjackets/visionhybridmens.webp")
CategoryItem.create!(items_id: mensvisionhybrid.id, categories_id: jackets.id)
CategoryItem.create!(items_id: mensvisionhybrid.id, categories_id: mensjackets.id)


approach = Item.create!(name: "APPROACH DOWN VEST - MEN'S",
description: "The Approach Down Vest easily layers over a hoody on brisk multi-pitch rock routes or under a shell on ice climbs and alpine missions. The vest’s ultralight nylon ripstop shell features Green Theme Technology’s Empel revolutionary Breathable Water Protection Technology—an environmentally friendly, PFC-free DWR that’s superior in performance and substantially more durable than other DWR solutions. Inside, premium 800-fill, RDS-certified HyperDRY™ goose down insulation offers high-lofting, incredibly packable warmth that resists inclement weather.",
price: 240.00,
size: true,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/mensjackets/approach.webp")
CategoryItem.create!(items_id: approach.id, categories_id: mensjackets.id)
CategoryItem.create!(items_id: approach.id, categories_id: jackets.id)

recon = Item.create!(name:"RECON STRETCH SKI SHELL - MEN'S",
description:"Designed for the skier who demands performance and comfort, the Recon Strech Ski Shell combines a durable 4-way stretch fabric with our waterproof/breathable solution, BD.dry™, to deliver a jacket ready for both in and out-of-bounds missions. With one chest pocket to hold essentials and two mesh internal drop pockets for skins or extra layers, the Recon features ample storage, while the jacket’s removable powder skirt adds versatility for variable conditions. The Recon also has pit zip vents for easy temperature regulation on the skin-track, a waterproof front zipper and a ski-helmet compatible hood for added protection on storm days.",
price:300.00,
size: true,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/mensjackets/receon.webp")
CategoryItem.create!(items_id: recon.id, categories_id: mensjackets.id)
CategoryItem.create!(items_id: recon.id, categories_id: jackets.id)
CategoryItem.create!(items_id:recon.id, categories_id: winter.id )

parka = Item.create!(name:"VISION DOWN PARKA - MEN'S",
description:"The Vision Down Parka is our warmest insulated jacket, stuffed with high-lofting 800-fill, RDS-certified HyperDRY™ goose down insulation that resists moisture and offers sleeping bag-level warmth in seriously cold conditions. The Vision Down Parka's ultralight shell fabric features a proprietary Japanese fabric made ultra-tear resistant thanks to its liquid crystal polymer ripstop construction, which has been proven to be tough as nails in our Vision Harness. The adjustable insulated hood seals in warmth while wearing a helmet, while the two-way front zipper allows access to your belay device. Oversized hand, chest and internal drop pockets store gloves, water bottles and other on-route essentials.",
price:465.00,
size: true,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/mensjackets/parka.webp")
CategoryItem.create!(items_id: recon.id, categories_id: mensjackets.id)
CategoryItem.create!(items_id: recon.id, categories_id: jackets.id)
CategoryItem.create!(items_id:recon.id, categories_id: winter.id )

alpine = Item.create!(name:"ALPINE START HOODY - MEN'S",
  description: "An ultralight softshell designed to shield weight-conscious climbers from ridgeline gusts and light weather, the Blue Square Alpine Start Hoody features Schoeller stretch-woven fabric to provide highly breathable and highly packable weather resistance. A gusseted construction offers unrestricted freedom of movement, while the adjustable hood fits over a climbing helmet. The jacket also stuffs into its own chest pocket, which features an internal carabiner clip loop for attaching to your harness.",
  price:165.00,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/mensjackets/alpine.webp")
CategoryItem.create!(items_id: alpine.id, categories_id: mensjackets.id)
CategoryItem.create!(items_id: alpine.id, categories_id: jackets.id)
CategoryItem.create!(items_id:alpine.id, categories_id: winter.id )

belay = Item.create!(name:"BELAY PARKA - MEN'S",
  description:"Redesigned for 2019 to endure bail-worthy belay conditions on single-pitch winter routes and huge alpine faces alike, the Blue Square Belay Parka lets you hunker down while your partner battles it out on the sharp end. Our warmest synthetic jacket, the updated Stance features a new, more durable shell fabric with a PFC-free DWR finish and two layers of lofty ThermoLite® insulation that provides serious warmth even when wet. A two-way zipper allows access to your belay device, and oversized hand, chest and internal drop pockets store gloves, water bottles and other on-route essentials.",
  price:199.95,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/mensjackets/belay.webp")
CategoryItem.create!(items_id: belay.id, categories_id: mensjackets.id)
CategoryItem.create!(items_id: belay.id, categories_id: jackets.id)
CategoryItem.create!(items_id:belay.id, categories_id: winter.id)

wvision = Item.create!(name:"VISION HYBRID HOODY - WOMEN'S",
  description:"Optimized for movement in the mountains, the Vision Hybrid Hoody is an active insulation layer that breathes and moves with you while keeping you warm. Featuring Japanese liquid crystal polymer ripstop construction in high abrasion areas, this hoody is ultra-durable, while the body-mapped construction adds breathability and stretch to the underarms and back panels. The 60g PrimaLoft Gold Insulation with Cross Core technology includes NASA-developed Aerogel, which is used in space suits and remains hyper-light while maintaining the industry’s best warmth-to-weight ratio. Two harness-compatible zippered hand pockets are combined with a right-hand stow pocket and zippered chest pocket to stash essentials while adventuring. It also features an internal drop pocket which provides warm shelter for gloves or beanies. An integrated hem gasket and elastic cuffs keep drafts out while the helmet-compatible hood adds extra protection from wind and snow.",
  price:295.00,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/wjackets/wvision.webp")
  CategoryItem.create!(items_id: wvision.id, categories_id: womensjackets.id)
CategoryItem.create!(items_id: wvision.id, categories_id: jackets.id)
CategoryItem.create!(items_id:wvision.id, categories_id: winter.id)


 approach = Item.create!(name:"APPROACH DOWN HOODY - WOMEN'S",
  description:"Inspired by “no pack and a pared down rack” kind of days, the Approach Down Hoody easily layers over a sun hoody on brisk multi-pitch rock routes or under a shell on ice climbs and alpine missions. The Approach Hoody’s ultralight nylon ripstop shell features Green Theme Technology’s revolutionary Empel DWR—an environmentally friendly, PFC-free DWR that’s superior in performance and substantially more durable than other DWR solutions. Inside, premium 800-fill, RDS-certified HyperDRY™ goose down insulation offers high-lofting, incredibly packable warmth that resists inclement weather. A feminine cut with stylish baffle lines and longer length make the jacket stylish when not charging in the mountains, and when it’s time to move, the jacket stuffs into its hand pocket and secures to your harness with a carabiner clip loop.",
  price:360.00,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/wjackets/approach.webp")
    CategoryItem.create!(items_id: approach.id, categories_id: womensjackets.id)
CategoryItem.create!(items_id: approach.id, categories_id: jackets.id)

wparka =  Item.create!(name:"BELAY PARKA - WOMEN'S",
  description:"From frigid belays at the ice park to big multi-day climbs on alpine peaks, the Blue Square Belay Parka lets you hunker down while your partner battles it out on the sharp end. Our warmest insulated jacket, the Stance features two layers of lofty ThermoLite insulation that provides serious warmth even when wet. A two-way zipper allows access to your belay device, and oversized hand, chest and internal drop pockets store gloves, water bottles and other on-route essentials.",
  price:300.00,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/wjackets/parka.webp")
  CategoryItem.create!(items_id: wparka.id, categories_id: womensjackets.id)
CategoryItem.create!(items_id: wparka.id, categories_id: jackets.id)
CategoryItem.create!(items_id:wparka.id, categories_id: winter.id)

  distance =  Item.create!(name:"DISTANCE WIND SHELL - WOMEN'S",
    description:"Engineered to provide ultimate lightweight weather protection in the mountains, the Distance Wind Shell combines superior weather resistance and breathability with an ultralight design, so you are always ready for what the mountains throw at you. Launching in partnership with Green Theme International, the Distance Wind Shell features GTI’s revolutionary Breathable Water Protection Technology, an environmentally friendly PFC-free water-repellant finish that is superior in performance compared to any other C-6, C-8, or C-0 DWR. This performance is only exceeded by its durability, as the GTI technology is permanently hyper-fused to the individual fabric fibers, and there is no need to ever refresh the jacket with an additional spray or wash-in finish. The Distance Wind Shell is ultra-packable, making it a perfect emergency piece for mountain missions with a chest pocket that doubles as a stuff sack and clips to a harness with a carabiner clip loop. With its air permeable qualities designed for high-output activities, and robust weather resistance, the Distance Wind Shell is tailor-made for fast and light mountain adventures.",
    price:140.00,
    size: true,
    image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/wjackets/distance.webp") 
    CategoryItem.create!(items_id: distance.id, categories_id: womensjackets.id)
    CategoryItem.create!(items_id: distance.id, categories_id: jackets.id)

Review.create!(title:'This is the best shell!',
  content: "I've gone through so many light-weight jackets that either don't do the job or that aren't breathable. This is actually the only one I've found that does both!",
  rating: 5,
  name: 'Sarah K.',
  item_id: distance.id)


  wrecon  = Item.create!(name:"RECON STRETCH SKI SHELL - WOMEN'S",
  description:"Designed for the skier who demands performance and comfort, the Recon Stretch Ski Shell combines a durable 4-way stretch fabric with our waterproof/breathable solution, BD.dry™, to deliver a jacket ready for both in and out-of-bounds missions. With one chest pocket to hold essentials and two mesh internal drop pockets for skins or extra layers, the Recon features ample storage, while the jacket’s removable powder skirt adds versatility for variable conditions. The Recon also has pit zip vents for easy temperature regulation on the skin-track, a waterproof front zipper and a ski-helmet compatible hood for added protection on storm days.",
price:300.00,
size: true,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/wjackets/14945_source_1655877736.png")
  CategoryItem.create!(items_id: wrecon.id, categories_id: womensjackets.id)
CategoryItem.create!(items_id: wrecon.id, categories_id: jackets.id)
CategoryItem.create!(items_id:wrecon.id, categories_id: winter.id)

Review.create!(title:'Love this Jacket!',
  content: "I've gone through so many ski jackets This is my abosolute favourite.",
  rating: 5,
  user_id: demo.id,
  name: demo.first_name,
  item_id: wrecon.id)


strap = Item.create!(name: "SKI STRAP 15 IN",
description: "The Blue Square Ski Strap has always been a tried-and-true BD classic; effectively holding together any pair of skis. This stretchy strap now has a facelift, and is still likely our most versatile piece of gear—use it to strap a camera tripod to the outside of your pack, or lash skis and poles together for a makeshift backcountry emergency sled. Snag a few and stash them in your ski packs and in your car. Trust us: they always come in handy.",
price: 5.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/accessories/strap.webp")
CategoryItem.create!(items_id:strap.id, categories_id: winter.id)
CategoryItem.create!(items_id:strap.id, categories_id: ski.id)
CategoryItem.create!(items_id:strap.id, categories_id: accesories.id)

wax = Item.create!(name: "GLOP STOPPER SKIN WAX",
description:"Smooth the plush, increase the glide—use Glop Stopper Wax on your skin fabric to keep waterlogged snow from sticking and weighing down your skins. A must for spring tours or temperature inversions.",
price: 14.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/accessories/wax.webp")
CategoryItem.create!(items_id:wax.id, categories_id: winter.id)
CategoryItem.create!(items_id:wax.id, categories_id: accesories.id)

jivewire = Item.create!(name: "JIVEWIRE ACCESSORY CARABINER",
description:"Brightly colored plastic mini accessory carabiners strong enough for keys or coffee mugs.",
price: 2.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/accessories/juve.png")
CategoryItem.create!(items_id:jivewire.id, categories_id: climb.id)
CategoryItem.create!(items_id:jivewire.id, categories_id: accesories.id)

cord = Item.create!(name: "6.0 STATIC ACCESSORY CORD",
description:"The BD 6.0 is a versatile tagline or escape cord. Keep it in your pack until the descent and then whip it out for the rappel by pairing it with your climbing rope. Or, use it to tag gear while you go to work on a wall. When it comes to getting it done, this static line is your hard-hitting partner.",
price: 9.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/accessories/accessory.webp")
CategoryItem.create!(items_id:cord.id, categories_id: accesories.id)
CategoryItem.create!(items_id:cord.id, categories_id: climb.id)


tips =  Item.create!(name: "TREKKING POLE TIP PROTECTORS",
description: "For added grip and noise and terrain scarring reduction. Works on all BD poles except the First Strike, Distance Series Z-Poles, aluminum ski poles, and Helio Fixed Length Carbon ski poles. Sold in pairs.",
price: 10.95,
image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/accessories/poletips.webp")
CategoryItem.create!(items_id:tips.id, categories_id: accesories.id)


tadapter = Item.create!(name: "DISTANCE TENT UNIV. ADAPTER",
  description: "Sold separately as an accessory. Compatible with our Distance Tent With Adapter as a replacement or extra.",
  price: 19.95,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/accessories/tentadpat.webp")

CategoryItem.create!(items_id:tadapter.id, categories_id: accesories.id)
CategoryItem.create!(items_id:tadapter.id, categories_id: tents.id)

menmomentum = Item.create!(name: "MOMENTUM HARNESS - MEN'S",
description: "For all-around climbers who know that time spent fiddling with leg loops and adjusting a pinching waistbelt is time wasted, the Black Diamond Momentum delivers a time-saving design for all styles of climbing. A pre-threaded Speed Adjust waistbelt buckle saves time and eliminates error when tying in, while Dual Core Construction™ puts an emphasis on comfort, even when you're posted up at a hanging belay. TrakFIT leg-loops easily adjust for cool fall days at the crag or blazing summer days on long multi-pitches, and four pressure-molded gear loops and a haul loop make this our most popular all-rounder.",
price: 64.95,
size: true,
image_url: "https://bluesquarebucket.s3.us-west-1.amazonaws.com/harnesses/momentum.webp")

CategoryItem.create!(items_id: menmomentum.id, categories_id: harnesses.id)
CategoryItem.create!(items_id: menmomentum.id, categories_id: mharnesses.id)
CategoryItem.create!(items_id: menmomentum.id, categories_id: climb.id)

wmentum = Item.create(name: "MOMENTUM HARNESS - WOMEN'S", description: "For all-around female climbers who know that time spent fiddling with leg loops and adjusting a pinching waistbelt is time wasted, the Women's Black Diamond Momentum Harness delivers a time-saving design for all styles of climbing. A pre-threaded Speed Adjust waistbelt buckle saves time and eliminates error when tying in, while Dual Core Construction™ puts an emphasis on comfort, even when you're posted up at a hanging belay. TrakFIT leg-loops easily adjust for cool fall days at the crag or blazing summer days on long multi-pitches, and four pressure-molded gear loops and a haul loop make this our most popular all-rounder.",
  price:64.95,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/harnesses/momentumw.webp"
)
CategoryItem.create!(items_id: wmentum.id, categories_id: harnesses.id)
CategoryItem.create!(items_id: wmentum.id, categories_id: wharnesses.id)
CategoryItem.create!(items_id: wmentum.id, categories_id: climb.id)

wmentum2 = Item.create(name: "MOMENTUM HARNESS - WOMEN'S PACKAGE", description: "With everything you need to get started in the gym or at the crag, the Women's Black Diamond Momentum Package is a complete, convenient package for all-around female climbers, featuring our most popular harness for all-around use.",
  price:99.95,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/harnesses/package.webp"
)
CategoryItem.create!(items_id: wmentum2.id, categories_id: harnesses.id)
CategoryItem.create!(items_id: wmentum2.id, categories_id: wharnesses.id)
CategoryItem.create!(items_id: wmentum2.id, categories_id: climb.id)

menmomentum2 = Item.create!(name: "MOMENTUM HARNESS - MEN'S PACKAGE",
description: "With everything you need to get started in the gym or at the crag, the Black Diamond Momentum Package is a complete, convenient package for all-around climbers, featuring our most popular harness for all-around use, the Momentum.",
price: 99.95,
size: true,
image_url: "https://bluesquarebucket.s3.us-west-1.amazonaws.com/harnesses/7453_source_1647584436.webp")
CategoryItem.create!(items_id: menmomentum2.id, categories_id: harnesses.id)

CategoryItem.create!(items_id: menmomentum2.id, categories_id: mharnesses.id)
CategoryItem.create!(items_id: menmomentum2.id, categories_id: climb.id)

wzone = Item.create!(name: "ZONE HARNESS - WOMEN'S", description: "Designed for the lightweight sport climbing redpoint ice route or alpine mission, the Black Diamond Zone Harness is a versatile powerhouse. High performance, lightweight and breathable, the redesigned Zone now features our patented seamless Infinity Belay Loop, which is durable, low profile, and eliminates the dreaded belay-loop-shift when the loop-seam catches while dogging a route. Fusion Comfort Technology ensures that you'll have ample support when on the wall, while the stretch woven outer fabric adds breathability. Finally, the contoured, women’s specific fit maximizes comfort for the inevitable big whips that come from pushing your limits.",
  price:99.95,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/harnesses/zonew.webp"
)
CategoryItem.create!(items_id: wzone.id, categories_id: harnesses.id)
CategoryItem.create!(items_id: wzone.id, categories_id: wharnesses.id)
CategoryItem.create!(items_id: wzone.id, categories_id: climb.id)

mzone = Item.create!(name: "ZONE HARNESS - MEN'S", description: "Designed for the lightweight sport climbing redpoint ice route or alpine mission, the Black Diamond Zone Harness is a versatile powerhouse. High performance, lightweight and breathable, the redesigned Zone now features our patented seamless Infinity Belay Loop, which is durable, low profile, and eliminates the dreaded belay-loop-shift when the loop-seam catches while dogging a route. Fusion Comfort Technology ensures that you'll have ample support when on the wall, while the stretch woven outer fabric adds breathability. Finally, the contoured, women’s specific fit maximizes comfort for the inevitable big whips that come from pushing your limits.",
  price:99.95,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/harnesses/zmone.webp"
)
CategoryItem.create!(items_id: mzone.id, categories_id: harnesses.id)
CategoryItem.create!(items_id: mzone.id, categories_id: mharnesses.id)
CategoryItem.create!(items_id: mzone.id, categories_id: climb.id)

couloir = Item.create(name: "COULOIR LT", description: "Designed as a minimalistic mountaineering, and ski-mo racing harness, the Couloir LT combines a techy and breathable monofilament Dynex waist and leg webbing construction with low-profile fixed leg loops that are streamlined for weight and mobility. One adjustable speed buckle on the waist dials in the fit, and the dedicated Dynex single tie-in point makes roping up simple. The Couloir LT also has two gear loops for taking the bare essentials of your rack into the mountains.",
  price:79.95,
  size: true,
  image_url:"https://bluesquarebucket.s3.us-west-1.amazonaws.com/harnesses/culoir.webp"
)
CategoryItem.create!(items_id: couloir.id, categories_id: harnesses.id)
CategoryItem.create!(items_id: couloir.id, categories_id: wharnesses.id)
CategoryItem.create!(items_id: couloir.id, categories_id: climb.id)
CategoryItem.create!(items_id: couloir.id, categories_id: mharnesses.id)
CategoryItem.create!(items_id: couloir.id, categories_id: ice_and_alpine.id)


theo = Item.create!(name: 'THEOREM 30 PACK',
description:'A 30-liter daypack that blends functionality with unparalleled style, the Theorem 30 holds everything you need for life’s multi-purpose missions. The internal organizer features a key-leash and zippered mesh pockets, while the electronics sleeve can be accessed both internally and externally. Two external stretchy side pockets hold water bottles, climbing shoes or any other gear you need, while a front-mounted daisy chain adds attachment options. the main pack body is built from 100% recycled fabrics.',
price: 99.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/packss/thorem.webp')
CategoryItem.create!(items_id: theo.id, categories_id: packs.id)
CategoryItem.create!(items_id: theo.id, categories_id: climb.id)


screek = Item.create!(name: 'STREET CREEK 24 PACK',
description:"With best-in-class durability thanks to its haulbag inspired design, and urban features that make commutes a breeze, the Street Creek 24 is the ultimate everyday pack. The Street Creek’s dedicated 15” laptop sleeve adds versatility for the working stiff, while the burly haulbag construction holds up to day-in, day-out commutes. And when the weather goes south, an integrated rain cover pocket houses the protection you need when caught in a storm. The quick access main compartment is reminiscent of its haulbag-inspired design, while an internal security pocket stashes your keys and wallet safely. The Street Creek 24 also features a front zippered organizational pocket for your daily essentials, and the pack’s EVA padded shoulder straps and back panel provide maximum comfort while commuting.",
price: 199.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/packss/street24.webp')

CategoryItem.create!(items_id: screek.id, categories_id: packs.id)
CategoryItem.create!(items_id: screek.id, categories_id: climb.id)

s22 = Item.create!(name: 'SPEED 22',
description:'Our tried-and-true on-route alpine pack, proven everywhere from the Canadian Rockies to the Fitz Roy massif, the Black Diamond Speed is designed for lightweight performance on rock, snow and ice objectives the world over. Featuring an updated BD X-rip 210d fabric with UTS™ coating, the new Speed is built to withstand season after season of mountain abuse. The pack is also fully strippable with a removable waistbelt, lid and frame-sheet, for minimalizing your set-up. We’ve improved the comfort as well with a moisture-wicking, updated back-panel and redesigned shoulder straps of dual-density foam for better load distribution on the approach while remaining streamlined on route. Ice tool PickPockets™ now feature a new custom metal dogbone ice tool attachment, boosting ice tool security, plus the snag-free crampon straps and a tuck-away rope strap secure gear to the outside. Surface-mounted glove-friendly main hood-buckles are a new addition and the drawcord skirt provides easy access and keeps out spindrift and light precip.',
price: 129.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/packss/speed22.webp')

CategoryItem.create!(items_id: s22.id, categories_id: packs.id)


jet = Item.create!(name: 'JETFORCE PRO 35L AVALANCHE AIRBAG PACK',
description:"Featuring the latest progression of our innovative JetForce Technology, the new JetForce Pro avalanche airbag with PIEPS technology is lighter, smaller and now features Bluetooth capabilities. Our revolutionary JetForce Technology is still rechargeable and travel-friendly, and features multiple deployments, with automatic deflation to create an air pocket, and has an automated self-diagnosis, but now the updated, lower-profile system is positioned lower, which improves the way the pack carries. With the addition of Bluetooth connectivity, you can update the software directly through the PIEPS app on your smartphone, as well as personalize settings. The 35-liter pack features a dedicated avy-tool pocket and plenty of storage for extra layers, water and additional gear, plus the pack is modular, giving you the option of purchasing a 10-liter, 25-liter, and 25-liter splitboard booster pack, which you can attach to the JetForce system for more versatility. The pack's ice-tool attachment secures your essential gear, while the tuck-away ski attachment system allows the airbag to deploy when skis are attached. The deploy trigger features status lights and can be switched to either the left or right shoulder strap and you can adjust the height for personal preference. ",
size: true,
price: 1499.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/packss/jet.webp')
CategoryItem.create!(items_id: jet.id, categories_id: packs.id)
CategoryItem.create!(items_id: jet.id, categories_id: ski.id)

wtech = Item.create!(name: "TECHNICIAN ALPINE PANTS - WOMEN'S",
description:'The rock jock version of our technical climbing pants, the Technician Alpine Pants are durable, abrasion-resistant, stretch synthetic pants engineered for sending at the crag. Articulated knees and adjustable drawcord hems are climb-specific features for unencumbered movement, while a ladder-lock waist belt lets you dial in the fit. The hand pockets are harness compatible while the zippered thigh pocket stashes topos and on-route essentials. Finally, the reflective logos are added touchpoints for visibility when you’re defying the dark.',
size: true,
price: 115.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/wtech.webp')

CategoryItem.create!(items_id: wtech.id, categories_id: wbottoms.id)

wdawnp = Item.create!(name: "WOMEN'S DAWN PATROL PANTS",
description:"For all-day tours and day-in, day-out backcountry use, the Black Diamond Dawn Patrol Pants are breathable enough to move with you and durable enough to make the journey. Designed with four-way stretch, double weave fabric with a DWR finish, the Dawn Patrol Pants provide high-level breathability without sacrificing durability. Providing superior temperature control on the uphill, mesh-backed vents cool you down while keeping unforeseen flurries out. Snow gaiters, boot-access zippers and Keprotec instep patches, they cover all of the needs of a mountain traveler with no excess.",
price: 215.95,
size: true,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/wdawnp.jpeg')

CategoryItem.create!(items_id: wdawnp.id, categories_id: wbottoms.id)

wrise = Item.create!(name: "RISE TIGHTS - WOMEN'S",
description:"Rise to the occasion and send in the BD Rise Tight, designed for indoor gym comfort and no-slip coverage. With a high waist tailor-made for harness compatibility, the Rise features a four-way stretch fabric that balances durability with moisture-wicking performance. Lightweight and minimal.",
price: 90.95,
size: true,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/wrise.webp')
CategoryItem.create!(items_id: wrise.id, categories_id: wbottoms.id)

wzonep = Item.create!(name: "ZONE DENIM PANTS - WOMEN'S",
description:"Designed to keep you crushing year-round, our Zone Denim Pants are a technical take on classic climbing denim. Featuring innovative Sorbtek technology, the Zone Pants have in-yarn moisture-wicking fibers that dry three times faster than other fibers. This technology keeps you cool, dry and comfortable during the cragging day. Plus, we’ve added a touch of stretch for mobility while sending, and the classic 5-pocket design is harness compatible. The fit is slim for climbing",
price: 119.95,
size: true,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/wzonep.webp')
CategoryItem.create!(items_id: wzonep.id, categories_id: wbottoms.id)

mtech = Item.create!(name: "TECHNICIAN ALPINE PANTS  - MEN'S",
description:"The cragging version of our technical climbing pants, the Technician Alpine Pants are durable, abrasion-resistant, stretch synthetic pants engineered for the send. Articulated knees and adjustable drawcord hems are climb-specific features for unencumbered movement, while a ladder-lock waist belt lets you dial in the fit. The hand pockets are harness compatible while the zippered thigh pocket stashes topos and on-route essentials. Finally, the reflective logos are added touchpoints for visibility when you’re defying the dark.",
size: true,
price: 115.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/mtech.webp')
CategoryItem.create!(items_id: mtech.id, categories_id: mbottoms.id)

notion = Item.create!(name: "NOTION SHORTS - MEN'S",
description:"Ideal for long nights in the training cave and warm summer days in the actual cave, the Black Diamond Notion Shorts have a light, stretchy design with a drawstring elastic waist that fits comfortably under a harness. The movement-specific construction allows for full range of motion during high-steps, stems and heel hooks, while the two hand pockets and two rear pockets store your essential items on post-climb trips into town.",
size: true,
price: 75.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/notion.webp')
CategoryItem.create!(items_id: notion.id, categories_id: mbottoms.id)

rocklock = Item.create!(name: "MEN'S ROCKLOCK CLIMB PANTS",
description:"The perfect pant for working the crux until you got it on lock, the Rocklock Climb Pants are a pair of comfortable organic cotton cragging bottoms featuring ripstop for added durability. Articulated knees combined with a gusseted inseam provide mobility, while the elastic waist with an interior drawcord gives you adjustability on the fit.",
price: 115.95,
size: true,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/rocklcok.webp')
CategoryItem.create!(items_id: rocklock.id, categories_id: mbottoms.id)

wool = Item.create!(name: "MISSION WOOL DENIM PANTS - MEN'S",
description:"One of the best things about climbing is that you can still send in a pair of jeans. And now, thanks to Black Diamond’s Performance Wool Denim, when the temps drop, you can keep ‘em on and not freeze. Featuring a unique blend of cotton and certified non-mulesed wool, these jeans are like wolves in sheep’s clothing (pun intended) and maintain that cool Sharma style. Cut for mobility, the articulated knees combined with comfort stretch fabric allows for execution of tricky drop knees and high stepping, all while adding an increased level of warmth thanks to the wool. The fabric is treated with a DWR for added protection and each pocket placement is harness compatible.",
size: true,
price: 160.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/wool.webp')
CategoryItem.create!(items_id: wool.id, categories_id: mbottoms.id)

vaporH = Item.create!(name: "VAPOR HELMET - HAZEL FINDLAY EDITION",
description:"Providing ultralight, low-profile protection, unparalleled ventilation and a secure and super-comfortable fit, the Black Diamond Vapor helmet is a go-anywhere cragging lid that proves helmets aren't just for multi-pitch trad climbs and big alpine faces. We engineered a sheet of Kevlar and a series of carbon rods in between co-molded EPS foam and a polycarbonate shell to keep the weight at a minimum while keeping you protected. The Vapor's ratcheting suspension tucks into the helmet for compact storage in your pack or haul bag, and removable headlamp clips secure your light on pre-dawn starts or when rapping after dark.",
size: true,
price: 139.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/helmet/9539_source_1610126642.webp')
CategoryItem.create!(items_id: vaporH.id, categories_id: helmets.id)

wvapor = Item.create!(name: "VAPOR HELMET - WOMEN'S",
description:"Providing ultralight, low-profile protection, unparalleled ventilation and a secure and super-comfortable fit, the Black Diamond Vapor helmet is a go-anywhere cragging lid that proves helmets aren't just for multi-pitch trad climbs and big alpine faces. We engineered a sheet of Kevlar and a series of carbon rods in between co-molded EPS foam and a polycarbonate shell to keep the weight at a minimum while keeping you protected. The Vapor's ratcheting suspension tucks into the helmet for compact storage in your pack or haul bag, and removable headlamp clips secure your light on pre-dawn starts or when rapping after dark.",
price: 139.95,
size:true,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/helmet/wvapor.webp')
CategoryItem.create!(items_id: wvapor.id, categories_id: helmets.id)

foam = Item.create!(name: "HALF DOME HELMET REPLACEMENT COMFORT FOAM PADS",
description:"Replacement pads for our Half Dome Helmet",
price: 4.95,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/helmet/foam.webp')
CategoryItem.create!(items_id: foam.id, categories_id: helmets.id)

mips = Item.create!(name: "CAPITAN HELMET - MIPS",
description:"The Capitan MIPS is Black Diamond’s bomber, ultra-durable helmet, featuring added coverage on both the sides and back and MIPS tech, while maintaining a sleek, cradle fit for all-day comfort. The added MIPS (Multidirectional Impact Protection System) technology. The MIPS system is designed to protect against the rotational motion (or kinematics) transmitted to the brain from angled impacts to the head. This added protection system has been proven to reduce the rotational violence to the brain by absorbing and redirecting oblique impacts to the helmet. With a 2-piece ABS shell construction, a fusion of EPP foam and an EPS foam puck, the Capitan meets the proposed UIAA increased side and back protection requirements, while the vents provide ample breathability when temps heat up. A low-profile suspension system dials in the fit, and the integrated headlamp clips with an elastic keeper on the back secure your light so you can push through the night.",
price: 99.95,
size: true,
image_url:'https://bluesquarebucket.s3.us-west-1.amazonaws.com/pants/helmet/mips.webp')
CategoryItem.create!(items_id: mips.id, categories_id: helmets.id)






##142 joe rogan
# c4_0_3 = Item.create!(name: 'C4 #0.3',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file1 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-0.3.webp')
# c4_0_3.photo.attach(io: file1, filename:'C4-0.3.webp')

# c4_0_4 = Item.create!(name: 'C4 #0.4',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file2 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-0.4.webp')
# c4_0_4.photo.attach(io: file2, filename:'C4-0.4.webp')

# c4_0_5 = Item.create!(name: 'C4 #0.5',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file3 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-0.5.webp')
# c4_0_5.photo.attach(io: file3, filename:'C4-0.5.webp')

# c4_0_75 = Item.create!(name: 'C4 #0.75',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file4 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-0.75.webp')
# c4_0_75.photo.attach(io: file4, filename:'C4-0.75.webp')

# c4_1 = Item.create!(name: 'C4 #01',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file5 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-1.webp')
# c4_1.photo.attach(io: file5, filename:'C4-1.webp')

# c4_2 = Item.create!(name: 'C4 #02',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file6 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-2.webp')
# c4_2.photo.attach(io: file6, filename:'C4-2.webp')

# c4_3 = Item.create!(name: 'C4 #03',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file8 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-3.webp')
# c4_3.photo.attach(io: file8, filename:'C4-3.webp')

# c4_4 = Item.create!(name: 'C4 #04',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file9 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-4.webp')
# c4_4.photo.attach(io: file9, filename:'C4-4.webp')

# c4_5 = Item.create!(name: 'C4 #05',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file10 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-5.webp')
# c4_5.photo.attach(io: file10, filename:'C4-5.webp')

# c4_6 = Item.create!(name: 'C4 #06',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file11 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-6.webp')
# c4_6.photo.attach(io: file11, filename:'C4-6.webp')

# c4_7 = Item.create!(name: 'C4 #07',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file12 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-7.webp')
# c4_7.photo.attach(io: file12, filename:'C4-7.webp')

# c4_8 = Item.create!(name: 'C4 #08',
# description:'The world’s best-selling, most trusted cam just got better. The new, redesigned Camalot C4 has now upped the ante, considering it’s 10% lighter yet just as durable as before. Plus, it features a modern design that improves on the old tried-and-true Camalots. The cam’s lobes are lighter and more sculpted, optimized for strength to weight, while the slings have a visual update for easier differentiation when racking. And speaking of racking, we’re introducing a new innovative trigger keeper on sizes #4, #5, #6, #7, and #8 that keeps the big guys contracted for compact racking and immediately release when you’re ready to place. We’ve also widened the trigger as well for better handling.',
# price:79.95)
# file13 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/c4/C4-8.webp')
# c4_8.photo.attach(io: file13, filename:'C4-8.webp')

# screwup = Item.create!(name: 'Ice Screw Up',
# description:"Protect and organize your winter rack with the Blue Square Ice ScrewUp. This lightweight, convenient roll-up pouch protects the threads and teeth of your ice screws and saves space when they're stored in your pack.",
# price:21.95)
# file14 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/IceScrewUp.webp')
# screwup.photo.attach(io: file14, filename:'IceScrewUp.webp')

# sabre = Item.create!(name: 'Sabretooth Crampons',
# description:"From moderate local ice flows to classic mountaineering routes and technical alpine faces, the Black Diamond Sabretooth Crampon is our best all-around crampon for the spectrum of frozen objectives. The Sabretooth’s redesigned stainless steel construction incorporates a strong, yet light design with durable horizontal front points and increased rocker in the front rail to accommodate modern mountain boots. The dual secondary points are optimized for technical precision, while still maintaining a balanced, stable platform on descents and lower angle terrain.",
# price:199.95)
# file15 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/SabretoothCramons.webp')
# sabre.photo.attach(io: file15, filename:'SabretoothCramons.webp')



# slinger = Item.create!(name: 'Slinger Leash',
# description:"A single, lightweight piolet-specific version of our popular Spinner Leash, the Black Diamond Slinger Leash is a stretchy tethering system for keeping your piolet attached without a wrist leash. We've upgraded the leash with a locking carabiner for added security when clipped to your axe's head or spike, we've added extension to the elastic webbing, and we've updated the webbing to polyester which absorbs less water than standard nylon.",
# price:29.95)
# file16 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/SlingerLeash.webp')
# slinger.photo.attach(io: file16, filename:'SlingerLeash.webp')


# swift = Item.create!(name: 'Swift Ice Axe',
# description:"With an adjustable pommel and a T rating, the Black Diamond Swift takes mountaineering piolets into the 21st century. One-piece hot forged stainless steel head construction, ergonomic shaft and technical profile for performance in technical snow sections and the FlickLock™ pommel adds adjustability for varying terrain.",
# price:199.95)
# file17 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/SwiftIceAxe.webp')
# sabre.photo.attach(io: file17, filename:'SwiftIceAxe.webp')

# ulice = Item.create!(name: 'Ultralight Ice Screw',
# description:"Designed for ski mountaineering, glacial travel and high-end alpinism, the Ultralight Ice Screw says it all in the name. Weighing in at 45% lighter than our Express Screws, the Ultralight Screw combines a steel tip with an aluminum body and forged aluminum hanger that features two clip-in points. The innovative wire-gate Express handle shaves more weight and also clicks open and closed. The Ultralights are also easily identified by length with the classic BD color scheme.",
# price:84.95)
# file18 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/ULIce.webp')
# ulice.photo.attach(io: file18, filename:'ULIce.webp')

# viperice = Item.create!(name: 'Viper Ice Tool',
# description:"A durable, easy-to-swing tool built for a full season of winter climbing objectives, the redesigned Black Diamond Viper Ice Tool provides all-around performance for the ice and alpine climber. The Viper’s hydroformed shaft extends through the grip for maximum rigidity and a responsive feel, and our Natural Pick is included to beef up durability on scrappy mountain terrain. The adjustable FlickLock® pommel acts as a secondary grip position for ice climbing and cragging and easily slides up the shaft for choking up on low-angle snow slopes. The modular head allows for easy changing of picks and swapping between hammer and adze.",
# price:259.95)
# file19 = URI.open('https://bluesquarebucket.s3.us-west-1.amazonaws.com/iceandalpine/IceAlpine/ViperIceTool.webp')
# viperice.photo.attach(io: file19, filename:'ViperIceTool.webp')

