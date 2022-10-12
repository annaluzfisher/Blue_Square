# README

This project was my first time working with React, and there were a lot of lessons learned. It is a clone Black Diamond's E-commerce website. 
The features provided to the user are:
Full User Authentication
Search feature 
Full CRUD features for Reviews
Full CRUD features for their cart

The main challenges I faced were dealing with sizes of items, rendering the write-review/edit review form conditionally, designing the database allowing for categories with parent categories and collections. I will elaborate below.

Items in the cart should be listed only once, and the quantity should be updated if more of the same item are added. This could be solved with a uniquenes contraint on the cart_id and the item_id if not for the fact that two items with two different sizes can exist in the same cart and should be rendered as separate items. 
On a database level I considered creating a index on size and item, but two different carts can have those same fields match. The decision was to use active record to find the item, should it exist, and update the quantity only if the size, item_id, and cart_id matched the params.If not, then the controller works as normal and creates the new cart Item. A helper method in the model for counting the various quanitties in a cart helps the jbuilder file return the number of items every cart. It was a fun challenge in designing a non-unque controller that either creates or updates based on the database. Fun!!

