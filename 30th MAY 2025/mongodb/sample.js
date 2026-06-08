// Create and switch database
// use retail_db

// Create collection
db.createCollection("customers")

// Insert one document
db.customers.insertOne({
    customer_id: 1,
    name: "Rahul Sharma",
    city: "Chennai",
    phone: "9444257249",
    membership: "Silver"
})

// Insert many documents
db.customers.insertMany([
{
    customer_id: 2,
    name: "Priya Nair",
    city: "Bengaluru",
    phone: "9876543210",
    membership: "Gold"
},
{
    customer_id: 3,
    name: "Arjun Mehta",
    city: "Mumbai",
    phone: "9123456780",
    membership: "Platinum"
},
{
    customer_id: 4,
    name: "Sneha Reddy",
    city: "Hyderabad",
    phone: "9988776655",
    membership: "Silver"
}
])

// Display all customers
db.customers.find()

// Find customers from Hyderabad
db.customers.find({
    city: "Hyderabad"
})

// Find customers where customer_id > 2
db.customers.find({
    customer_id: { $gt: 2 }
})

// Find customers where customer_id <= 2
db.customers.find({
    customer_id: { $lte: 2 }
})

// Find customers from Hyderabad or Bangalore
db.customers.find({
    city: {
        $in: ["Hyderabad", "Bangalore"]
    }
})

// Find customers from Hyderabad OR membership Gold
db.customers.find({
    $or: [
        { city: "Hyderabad" },
        { membership: "Gold" }
    ]
})

// Display only name and city without _id
db.customers.find(
    {},
    {
        _id: 0,
        name: 1,
        city: 1
    }
)

// Sort customer_id ascending
db.customers.find().sort({
    customer_id: 1
})

// Sort customer_id descending
db.customers.find().sort({
    customer_id: -1
})

// Limit output to first 3 documents
db.customers.find().limit(3)