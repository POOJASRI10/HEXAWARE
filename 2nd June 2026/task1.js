use("food_delivery_capstone_db");

// COLLECTION CREATION & DATA INSERTION
// customers
db.customers.insertMany([
  { customer_id: 1, name: "Rahul Sharma",  city: "Hyderabad", membership: "Gold",   phone: "9876543210" },
  { customer_id: 2, name: "Priya Reddy",   city: "Bangalore",  membership: "Silver", phone: "9876543211" },
  { customer_id: 3, name: "Amit Kumar",    city: "Mumbai",     membership: "Gold",   phone: null         },
  { customer_id: 4, name: "Sneha Patel",   city: "Chennai",    membership: "Bronze", phone: "9876543213" },
  { customer_id: 5, name: "Arjun Verma",   city: "Delhi",      membership: "Silver", phone: "9876543214" }
]);

// restaurants
db.restaurants.insertMany([
  { restaurant_id: 101, name: "Spice Hub",      city: "Hyderabad", cuisine: "Indian",     rating: 4.5 },
  { restaurant_id: 102, name: "Pizza Corner",   city: "Bangalore",  cuisine: "Italian",    rating: 4.2 },
  { restaurant_id: 103, name: "Green Bowl",     city: "Chennai",    cuisine: "Healthy",    rating: 4.7 },
  { restaurant_id: 104, name: "Burger Street",  city: "Mumbai",     cuisine: "Fast Food",  rating: 3.9 },
  { restaurant_id: 105, name: "Royal Tandoor",  city: "Delhi",      cuisine: "Indian",     rating: 4.8 }
]);

// delivery_partners
db.delivery_partners.insertMany([
  { partner_id: 201, partner_name: "FastMove Logistics", city: "Hyderabad", rating: 4.4 },
  { partner_id: 202, partner_name: "QuickShip",          city: "Bangalore",  rating: 4.1 },
  { partner_id: 203, partner_name: "SpeedKart",          city: "Mumbai",     rating: 4.6 },
  { partner_id: 204, partner_name: "DoorDash India",     city: "Delhi",      rating: 4.0 }
]);

//  orders
db.orders.insertMany([
  {
    order_id: 1001, customer_id: 1, restaurant_id: 101, partner_id: 201,
    items: [
      { item_name: "Biryani",  quantity: 2, price: 250 },
      { item_name: "Kebab",    quantity: 1, price: 180 }
    ],
    order_amount: 680,
    payment: { mode: "UPI",  status: "Success" },
    order_status: "Delivered",
    delivery_time_minutes: 35,
    order_rating: 5
  },
  {
    order_id: 1002, customer_id: 2, restaurant_id: 102, partner_id: 202,
    items: [
      { item_name: "Pizza",        quantity: 1, price: 500 },
      { item_name: "Garlic Bread", quantity: 1, price: 150 }
    ],
    order_amount: 650,
    payment: { mode: "Card", status: "Success" },
    order_status: "Delivered",
    delivery_time_minutes: 42,
    order_rating: 4
  },
  {
    order_id: 1003, customer_id: 3, restaurant_id: 104, partner_id: 203,
    items: [
      { item_name: "Burger", quantity: 2, price: 180 },
      { item_name: "Fries",  quantity: 1, price: 120 }
    ],
    order_amount: 480,
    payment: { mode: "Cash", status: "Pending" },
    order_status: "Pending",
    delivery_time_minutes: null,
    order_rating: null
  },
  {
    order_id: 1004, customer_id: 4, restaurant_id: 103, partner_id: null,
    items: [
      { item_name: "Salad Bowl", quantity: 1, price: 350 }
    ],
    order_amount: 350,
    payment: { mode: "UPI", status: "Failed" },
    order_status: "Cancelled",
    delivery_time_minutes: null,
    order_rating: null
  },
  {
    order_id: 1005, customer_id: 5, restaurant_id: 105, partner_id: 204,
    items: [
      { item_name: "Tandoori Chicken", quantity: 1, price: 600 },
      { item_name: "Naan",             quantity: 2, price: 60  }
    ],
    order_amount: 720,
    payment: { mode: "UPI", status: "Success" },
    order_status: "Delivered",
    delivery_time_minutes: 50,
    order_rating: 5
  },
  {
    order_id: 1006, customer_id: 1, restaurant_id: 101, partner_id: 201,
    items: [
      { item_name: "Paneer Curry", quantity: 1, price: 300 },
      { item_name: "Roti",         quantity: 4, price: 25  }
    ],
    order_amount: 400,
    payment: { mode: "Card", status: "Success" },
    order_status: "Delivered",
    delivery_time_minutes: 30,
    order_rating: 4
  }
]);


// BASIC MONGODB QUERIES

// Q1. Display all customers
db.customers.find();

// Q2. Display all restaurants
db.restaurants.find();

// Q3. Display only customer name, city and membership
db.customers.find({}, { name: 1, city: 1, membership: 1, _id: 0 });

// Q4. Find all customers from Hyderabad
db.customers.find({ city: "Hyderabad" });

// Q5. Find all Gold members
db.customers.find({ membership: "Gold" });

// Q6. Find restaurants with rating greater than 4.5
db.restaurants.find({ rating: { $gt: 4.5 } });

// Q7. Find orders with amount greater than ₹500
db.orders.find({ order_amount: { $gt: 500 } });

// Q8. Find delivered orders
db.orders.find({ order_status: "Delivered" });

// Q9. Find cancelled orders
db.orders.find({ order_status: "Cancelled" });

// Q10. Find customers where phone is null
db.customers.find({ phone: null });


//  OPERATORS

// Q11. Find orders where amount is between ₹400 and ₹700
db.orders.find({ order_amount: { $gte: 400, $lte: 700 } });

// Q12. Find customers from Hyderabad, Delhi or Mumbai
db.customers.find({ city: { $in: ["Hyderabad", "Delhi", "Mumbai"] } });

// Q13. Find restaurants whose cuisine is Indian or Fast Food
db.restaurants.find({ cuisine: { $in: ["Indian", "Fast Food"] } });

// Q14. Find orders where payment status is not Success
db.orders.find({ "payment.status": { $ne: "Success" } });

// Q15. Find orders where delivery time is null
db.orders.find({ delivery_time_minutes: null });

// Q16. Find orders where rating is greater than or equal to 4
db.orders.find({ order_rating: { $gte: 4 } });

// Q17. Find restaurants not located in Bangalore or Chennai
db.restaurants.find({ city: { $nin: ["Bangalore", "Chennai"] } });


//  ARRAY QUERIES

// Q18. Find orders containing item Biryani
db.orders.find({ "items.item_name": "Biryani" });

// Q19. Find orders containing item Pizza
db.orders.find({ "items.item_name": "Pizza" });

// Q20. Find orders where any item quantity is greater than 1
db.orders.find({ "items.quantity": { $gt: 1 } });

// Q21. Find orders where item price is greater than ₹300
db.orders.find({ "items.price": { $gt: 300 } });

// Q22. Display only order ID and items
db.orders.find({}, { order_id: 1, items: 1, _id: 0 });


// SORTING AND LIMIT

// Q23. Sort restaurants by rating descending
db.restaurants.find().sort({ rating: -1 });

// Q24. Display top 3 highest rated restaurants
db.restaurants.find().sort({ rating: -1 }).limit(3);

// Q25. Sort orders by order amount descending
db.orders.find().sort({ order_amount: -1 });

// Q26. Display top 2 highest value orders
db.orders.find().sort({ order_amount: -1 }).limit(2);

// Q27. Sort delivery partners by rating descending
db.delivery_partners.find().sort({ rating: -1 });


// UPDATE OPERATIONS

// Q28. Update customer 1 membership to Platinum
db.customers.updateOne(
  { customer_id: 1 },
  { $set: { membership: "Platinum" } }
);

// Q29. Update restaurant 104 rating to 4.1
db.restaurants.updateOne(
  { restaurant_id: 104 },
  { $set: { rating: 4.1 } }
);

// Q30. Update order 1003 status to Delivered
db.orders.updateOne(
  { order_id: 1003 },
  { $set: { order_status: "Delivered" } }
);

// Q31. Set delivery time of order 1003 to 45
db.orders.updateOne(
  { order_id: 1003 },
  { $set: { delivery_time_minutes: 45 } }
);

// Q32. Add field active: true to all customers
db.customers.updateMany(
  {},
  { $set: { active: true } }
);

// Q33. Remove field active from all customers
db.customers.updateMany(
  {},
  { $unset: { active: "" } }
);

// Q34. Add a new item to order 1006
db.orders.updateOne(
  { order_id: 1006 },
  { $push: { items: { item_name: "Curd Rice", quantity: 1, price: 120 } } }
);


//  DELETE OPERATIONS

// Q35. Delete cancelled orders
db.orders.deleteMany({ order_status: "Cancelled" });

// Q36. Delete restaurants with rating less than 4.0
db.restaurants.deleteMany({ rating: { $lt: 4.0 } });


// COUNT AND DISTINCT

// Q37. Count total customers
db.customers.countDocuments();

// Q38. Count total orders
db.orders.countDocuments();

// Q39. Count delivered orders
db.orders.countDocuments({ order_status: "Delivered" });

// Q40. Count failed payments
db.orders.countDocuments({ "payment.status": "Failed" });

// Q41. Display distinct customer cities
db.customers.distinct("city");

// Q42. Display distinct restaurant cuisines
db.restaurants.distinct("cuisine");

// Q43. Display distinct payment modes
db.orders.distinct("payment.mode");


//  AGGREGATION

// Q44. Revenue by Payment Mode
db.orders.aggregate([
  {
    $group: {
      _id: "$payment.mode",
      total_revenue: { $sum: "$order_amount" }
    }
  },
  {
    $project: {
      _id: 0,
      payment_mode: "$_id",
      total_revenue: 1
    }
  },
  { $sort: { total_revenue: -1 } }
]);

// Q45. Revenue by Order Status
db.orders.aggregate([
  {
    $group: {
      _id: "$order_status",
      total_revenue: { $sum: "$order_amount" }
    }
  },
  {
    $project: {
      _id: 0,
      order_status: "$_id",
      total_revenue: 1
    }
  },
  { $sort: { total_revenue: -1 } }
]);

// Q46. Average Delivery Time for delivered orders
db.orders.aggregate([
  { $match: { order_status: "Delivered", delivery_time_minutes: { $ne: null } } },
  {
    $group: {
      _id: null,
      avg_delivery_time: { $avg: "$delivery_time_minutes" }
    }
  },
  {
    $project: {
      _id: 0,
      avg_delivery_time: 1
    }
  }
]);

// Q47. Orders by Customer
db.orders.aggregate([
  {
    $group: {
      _id: "$customer_id",
      total_orders: { $sum: 1 },
      total_amount: { $sum: "$order_amount" }
    }
  },
  {
    $project: {
      _id: 0,
      customer_id: "$_id",
      total_orders: 1,
      total_amount: 1
    }
  },
  { $sort: { customer_id: 1 } }
]);

// Q48. Orders by Restaurant
db.orders.aggregate([
  {
    $group: {
      _id: "$restaurant_id",
      total_orders: { $sum: 1 },
      total_revenue: { $sum: "$order_amount" }
    }
  },
  {
    $project: {
      _id: 0,
      restaurant_id: "$_id",
      total_orders: 1,
      total_revenue: 1
    }
  },
  { $sort: { restaurant_id: 1 } }
]);

// Q49. Average Rating by Restaurant
db.orders.aggregate([
  { $match: { order_rating: { $ne: null } } },
  {
    $group: {
      _id: "$restaurant_id",
      avg_order_rating: { $avg: "$order_rating" }
    }
  },
  {
    $project: {
      _id: 0,
      restaurant_id: "$_id",
      avg_order_rating: { $round: ["$avg_order_rating", 2] }
    }
  },
  { $sort: { restaurant_id: 1 } }
]);

// Q50. High Revenue Customers (total spending > ₹700)
db.orders.aggregate([
  {
    $group: {
      _id: "$customer_id",
      total_spending: { $sum: "$order_amount" }
    }
  },
  { $match: { total_spending: { $gt: 700 } } },
  {
    $project: {
      _id: 0,
      customer_id: "$_id",
      total_spending: 1
    }
  },
  { $sort: { total_spending: -1 } }
]);


// LOOKUP 

// Q51. Orders with Customer Details
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customer_id",
      foreignField: "customer_id",
      as: "customer_info"
    }
  },
  { $unwind: "$customer_info" },
  {
    $project: {
      _id: 0,
      order_id: 1,
      customer_name: "$customer_info.name",
      city: "$customer_info.city",
      order_amount: 1,
      order_status: 1
    }
  }
]);

// Q52. Orders with Restaurant Details
db.orders.aggregate([
  {
    $lookup: {
      from: "restaurants",
      localField: "restaurant_id",
      foreignField: "restaurant_id",
      as: "restaurant_info"
    }
  },
  { $unwind: "$restaurant_info" },
  {
    $project: {
      _id: 0,
      order_id: 1,
      restaurant_name: "$restaurant_info.name",
      cuisine: "$restaurant_info.cuisine",
      order_amount: 1
    }
  }
]);

// Q53. Orders with Delivery Partner Details
db.orders.aggregate([
  {
    $lookup: {
      from: "delivery_partners",
      localField: "partner_id",
      foreignField: "partner_id",
      as: "partner_info"
    }
  },
  {
    $project: {
      _id: 0,
      order_id: 1,
      partner_name: { $arrayElemAt: ["$partner_info.partner_name", 0] },
      delivery_time_minutes: 1,
      order_status: 1
    }
  }
]);

// Q54. Full Order Report
db.orders.aggregate([
  {
    $lookup: {
      from: "customers",
      localField: "customer_id",
      foreignField: "customer_id",
      as: "customer_info"
    }
  },
  {
    $lookup: {
      from: "restaurants",
      localField: "restaurant_id",
      foreignField: "restaurant_id",
      as: "restaurant_info"
    }
  },
  {
    $lookup: {
      from: "delivery_partners",
      localField: "partner_id",
      foreignField: "partner_id",
      as: "partner_info"
    }
  },
  {
    $project: {
      _id: 0,
      order_id: 1,
      customer_name:    { $arrayElemAt: ["$customer_info.name",          0] },
      restaurant_name:  { $arrayElemAt: ["$restaurant_info.name",        0] },
      cuisine:          { $arrayElemAt: ["$restaurant_info.cuisine",      0] },
      partner_name:     { $arrayElemAt: ["$partner_info.partner_name",   0] },
      order_amount: 1,
      payment_mode:     "$payment.mode",
      payment_status:   "$payment.status",
      order_status: 1,
      delivery_time_minutes: 1,
      order_rating: 1
    }
  }
]);