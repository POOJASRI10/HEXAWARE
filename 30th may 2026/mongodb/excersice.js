// Create and switch to database
// use food_delivery_assessment_db

// Insert restaurant dataset
db.restaurants.insertMany([
{
    restaurant_id: 1,
    name: "Spice Hub",
    city: "Hyderabad",
    cuisine: "Indian",
    rating: 4.5,
    avg_order_value: 450,
    delivery_available: true,
    tags: ["biryani", "north indian", "family"],
    contact: {
        phone: "9876543210",
        email: "spicehub@mail.com"
    }
},
{
    restaurant_id: 2,
    name: "Pizza Corner",
    city: "Bangalore",
    cuisine: "Italian",
    rating: 4.2,
    avg_order_value: 600,
    delivery_available: true,
    tags: ["pizza", "fast food", "cheese"],
    contact: {
        phone: "9876543211",
        email: "pizza@mail.com"
    }
},
{
    restaurant_id: 3,
    name: "Green Bowl",
    city: "Chennai",
    cuisine: "Healthy",
    rating: 4.7,
    avg_order_value: 350,
    delivery_available: false,
    tags: ["salad", "vegan", "healthy"],
    contact: {
        phone: null,
        email: "greenbowl@mail.com"
    }
},
{
    restaurant_id: 4,
    name: "Burger Street",
    city: "Hyderabad",
    cuisine: "Fast Food",
    rating: 3.9,
    avg_order_value: 300,
    delivery_available: true,
    tags: ["burger", "fries", "fast food"],
    contact: {
        phone: "9876543213",
        email: null
    }
},
{
    restaurant_id: 5,
    name: "Royal Tandoor",
    city: "Delhi",
    cuisine: "Indian",
    rating: 4.8,
    avg_order_value: 800,
    delivery_available: true,
    tags: ["tandoor", "north indian", "premium"],
    contact: {
        phone: "9876543214",
        email: "royal@mail.com"
    }
},
{
    restaurant_id: 6,
    name: "Tea Tales",
    city: "Pune",
    cuisine: "Cafe",
    rating: 4.1,
    avg_order_value: 200,
    delivery_available: false,
    tags: ["tea", "snacks", "cafe"],
    contact: {
        phone: "9876543215",
        email: "tea@mail.com"
    }
},
{
    restaurant_id: 7,
    name: "Ocean Grill",
    city: "Mumbai",
    cuisine: "Seafood",
    rating: 4.6,
    avg_order_value: 900,
    delivery_available: true,
    tags: ["fish", "grill", "premium"],
    contact: {
        phone: "9876543216",
        email: "ocean@mail.com"
    }
},
{
    restaurant_id: 8,
    name: "Dosa Point",
    city: "Chennai",
    cuisine: "South Indian",
    rating: 4.3,
    avg_order_value: 250,
    delivery_available: true,
    tags: ["dosa", "idli", "breakfast"],
    contact: {
        phone: null,
        email: null
    }
}
])


// 1. Display all restaurants
db.restaurants.find()

// 2. Display only name, city, cuisine (without _id)
db.restaurants.find({}, { _id: 0, name: 1, city: 1, cuisine: 1 })

// 3. Find all restaurants from Hyderabad
db.restaurants.find({ city: "Hyderabad" })

// 4. Find all Indian cuisine restaurants
db.restaurants.find({ cuisine: "Indian" })

// 5. Find restaurants where delivery is available
db.restaurants.find({ delivery_available: true })

// 6. Find restaurants with rating greater than 4.5
db.restaurants.find({ rating: { $gt: 4.5 } })

// 7. Find restaurants where average order value is less than 400
db.restaurants.find({ avg_order_value: { $lt: 400 } })

// 8. Find restaurants where rating is between 4.0 and 4.7
db.restaurants.find({
    rating: { $gte: 4.0, $lte: 4.7 }
})

// 9. Find restaurants where average order value >= 600
db.restaurants.find({
    avg_order_value: { $gte: 600 }
})

// 10. Hyderabad restaurants with delivery available
db.restaurants.find({
    city: "Hyderabad",
    delivery_available: true
})

// 11. Chennai OR cuisine is Indian
db.restaurants.find({
    $or: [
        { city: "Chennai" },
        { cuisine: "Indian" }
    ]
})

// 12. Delivery not available
db.restaurants.find({
    delivery_available: false
})

// 13. Restaurants from Hyderabad, Delhi, Mumbai
db.restaurants.find({
    city: {
        $in: ["Hyderabad", "Delhi", "Mumbai"]
    }
})

// 14. Cuisine is Indian, Italian, Cafe
db.restaurants.find({
    cuisine: {
        $in: ["Indian", "Italian", "Cafe"]
    }
})

// 15. Restaurants not in Hyderabad or Bangalore
db.restaurants.find({
    city: {
        $nin: ["Hyderabad", "Bangalore"]
    }
})

// 16. Name starts with P
db.restaurants.find({
    name: /^P/
})

// 17. Name contains Point
db.restaurants.find({
    name: /Point/
})

// 18. Cuisine contains Food
db.restaurants.find({
    cuisine: /Food/
})

// 19. Contact phone is null
db.restaurants.find({
    "contact.phone": null
})

// 20. Contact email is null
db.restaurants.find({
    "contact.email": null
})

// 21. Either phone or email is null
db.restaurants.find({
    $or: [
        { "contact.phone": null },
        { "contact.email": null }
    ]
})

// 22. Restaurants having tag premium
db.restaurants.find({
    tags: "premium"
})

// 23. Restaurants having tag fast food
db.restaurants.find({
    tags: "fast food"
})

// 24. Restaurants having both north indian and premium
db.restaurants.find({
    tags: {
        $all: ["north indian", "premium"]
    }
})

// 25. Sort by rating descending
db.restaurants.find().sort({
    rating: -1
})

// 26. Top 3 highest rated restaurants
db.restaurants.find()
.sort({ rating: -1 })
.limit(3)

// 27. Sort by average order value ascending
db.restaurants.find()
.sort({ avg_order_value: 1 })

// 28. Top 2 expensive restaurants
db.restaurants.find()
.sort({ avg_order_value: -1 })
.limit(2)

// 29. Update Burger Street rating to 4.0
db.restaurants.updateOne(
    { name: "Burger Street" },
    { $set: { rating: 4.0 } }
)

// 30. Change Tea Tales delivery availability to true
db.restaurants.updateOne(
    { name: "Tea Tales" },
    { $set: { delivery_available: true } }
)

// 31. Add active:true to all restaurants
db.restaurants.updateMany(
    {},
    { $set: { active: true } }
)

// 32. Add tag popular to Spice Hub
db.restaurants.updateOne(
    { name: "Spice Hub" },
    { $push: { tags: "popular" } }
)

// 33. Remove active field from all restaurants
db.restaurants.updateMany(
    {},
    { $unset: { active: "" } }
)

// 34. Delete restaurant with restaurant_id 6
db.restaurants.deleteOne({
    restaurant_id: 6
})

// 35. Delete restaurants with rating < 4.0
db.restaurants.deleteMany({
    rating: { $lt: 4.0 }
})

// 36. Count total restaurants
db.restaurants.countDocuments()

// 37. Count restaurants where delivery is available
db.restaurants.countDocuments({
    delivery_available: true
})

// 38. Display distinct cities
db.restaurants.distinct("city")

// 39. Display distinct cuisines
db.restaurants.distinct("cuisine")

// 40. Count restaurants by city
db.restaurants.aggregate([
{
    $group: {
        _id: "$city",
        count: { $sum: 1 }
    }
}
])

// 41. Count restaurants by cuisine
db.restaurants.aggregate([
{
    $group: {
        _id: "$cuisine",
        count: { $sum: 1 }
    }
}
])

// 42. Average rating by cuisine
db.restaurants.aggregate([
{
    $group: {
        _id: "$cuisine",
        avgRating: { $avg: "$rating" }
    }
}
])

// 43. Average order value by city
db.restaurants.aggregate([
{
    $group: {
        _id: "$city",
        avgOrderValue: {
            $avg: "$avg_order_value"
        }
    }
}
])

// 44. Highest average order value by cuisine
db.restaurants.aggregate([
{
    $group: {
        _id: "$cuisine",
        avgOrderValue: {
            $avg: "$avg_order_value"
        }
    }
},
{
    $sort: {
        avgOrderValue: -1
    }
},
{
    $limit: 1
}
])

// 45. Cuisines having more than one restaurant
db.restaurants.aggregate([
{
    $group: {
        _id: "$cuisine",
        count: { $sum: 1 }
    }
},
{
    $match: {
        count: { $gt: 1 }
    }
}
])