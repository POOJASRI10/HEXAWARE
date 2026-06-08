

use("edtech_capstone_db");

// COLLECTION CREATION & DATA INSERTION

//  learners
db.learners.insertMany([
  { learner_id: 1, name: "Rahul Sharma", city: "Hyderabad", experience_years: 2, goal: "Data Engineer",  phone: "9876543210" },
  { learner_id: 2, name: "Priya Reddy",  city: "Bangalore",  experience_years: 4, goal: "AI Engineer",    phone: "9876543211" },
  { learner_id: 3, name: "Amit Kumar",   city: "Mumbai",     experience_years: 1, goal: "Data Analyst",   phone: null         },
  { learner_id: 4, name: "Sneha Patel",  city: "Chennai",    experience_years: 6, goal: "ML Engineer",    phone: "9876543213" },
  { learner_id: 5, name: "Farhan Ali",   city: "Delhi",      experience_years: 3, goal: "Cloud Engineer", phone: "9876543214" },
  { learner_id: 6, name: "Meera Nair",   city: "Pune",       experience_years: 0, goal: "AI Engineer",    phone: null         }
]);

// instructors
db.instructors.insertMany([
  { instructor_id: 101, instructor_name: "Abdullah Khan", expertise: ["AI", "Data Engineering", "Cloud"],  rating: 4.9 },
  { instructor_id: 102, instructor_name: "Neha Singh",    expertise: ["Power BI", "SQL", "Analytics"],     rating: 4.6 },
  { instructor_id: 103, instructor_name: "Ravi Kumar",    expertise: ["Python", "Machine Learning"],       rating: 4.7 }
]);

//courses
db.courses.insertMany([
  {
    course_id: 201, course_name: "Data Engineering with Azure",
    category: "Data Engineering", instructor_id: 101, price: 15000, level: "Intermediate",
    tools: ["SQL", "Python", "Azure Data Factory", "Databricks"]
  },
  {
    course_id: 202, course_name: "AI Engineer Roadmap",
    category: "Artificial Intelligence", instructor_id: 101, price: 20000, level: "Beginner",
    tools: ["Python", "OpenAI", "Vector DB", "LangChain"]
  },
  {
    course_id: 203, course_name: "Power BI for Business",
    category: "Analytics", instructor_id: 102, price: 8000, level: "Beginner",
    tools: ["Power BI", "Excel", "SQL"]
  },
  {
    course_id: 204, course_name: "Machine Learning Practical",
    category: "Machine Learning", instructor_id: 103, price: 12000, level: "Intermediate",
    tools: ["Python", "Scikit-learn", "Pandas"]
  },
  {
    course_id: 205, course_name: "Cloud AI Engineer",
    category: "Cloud", instructor_id: 101, price: 18000, level: "Advanced",
    tools: ["Azure", "AWS", "GCP", "AI Services"]
  }
]);

// enrollments
db.enrollments.insertMany([
  {
    enrollment_id: 1001, learner_id: 1, course_id: 201,
    enrollment_date: ISODate("2026-01-10"),
    payment: { amount: 15000, mode: "UPI",  status: "Success" },
    progress: { completed_modules: 8,  total_modules: 10, completion_percent: 80  },
    quiz_scores: [75, 82, 88],
    status: "Active"
  },
  {
    enrollment_id: 1002, learner_id: 2, course_id: 202,
    enrollment_date: ISODate("2026-01-15"),
    payment: { amount: 20000, mode: "Card", status: "Success" },
    progress: { completed_modules: 10, total_modules: 10, completion_percent: 100 },
    quiz_scores: [90, 92, 95],
    status: "Completed"
  },
  {
    enrollment_id: 1003, learner_id: 3, course_id: 203,
    enrollment_date: ISODate("2026-02-01"),
    payment: { amount: 8000,  mode: "Cash", status: "Pending" },
    progress: { completed_modules: 3,  total_modules: 8,  completion_percent: 37.5 },
    quiz_scores: [60, 65],
    status: "Active"
  },
  {
    enrollment_id: 1004, learner_id: 4, course_id: 204,
    enrollment_date: ISODate("2026-02-10"),
    payment: { amount: 12000, mode: "UPI",  status: "Success" },
    progress: { completed_modules: 6,  total_modules: 12, completion_percent: 50  },
    quiz_scores: [78, 80, 85],
    status: "Active"
  },
  {
    enrollment_id: 1005, learner_id: 5, course_id: 205,
    enrollment_date: ISODate("2026-03-05"),
    payment: { amount: 18000, mode: "Card", status: "Failed" },
    progress: { completed_modules: 0,  total_modules: 12, completion_percent: 0   },
    quiz_scores: [],
    status: "Payment Failed"
  },
  {
    enrollment_id: 1006, learner_id: 6, course_id: 202,
    enrollment_date: ISODate("2026-03-12"),
    payment: { amount: 20000, mode: "UPI",  status: "Success" },
    progress: { completed_modules: 2,  total_modules: 10, completion_percent: 20  },
    quiz_scores: [55],
    status: "Active"
  }
]);


//  BASIC FIND QUERIES

// Q1. Display all learners
db.learners.find();

// Q2. Display all courses
db.courses.find();

// Q3. Display learner name, city, and goal only
db.learners.find({}, { name: 1, city: 1, goal: 1, _id: 0 });

// Q4. Find learners from Hyderabad
db.learners.find({ city: "Hyderabad" });

// Q5. Find learners whose goal is AI Engineer
db.learners.find({ goal: "AI Engineer" });

// Q6. Find courses in the Data Engineering category
db.courses.find({ category: "Data Engineering" });

// Q7. Find courses priced above ₹10,000
db.courses.find({ price: { $gt: 10000 } });

// Q8. Find beginner-level courses
db.courses.find({ level: "Beginner" });

// Q9. Find enrollments with successful payments
db.enrollments.find({ "payment.status": "Success" });

// Q10. Find learners where phone is null
db.learners.find({ phone: null });


//  OPERATORS

// Q11. Find learners having experience greater than 2 years
db.learners.find({ experience_years: { $gt: 2 } });

// Q12. Find courses priced between ₹8,000 and ₹18,000
db.courses.find({ price: { $gte: 8000, $lte: 18000 } });

// Q13. Find courses where level is either Beginner or Intermediate
db.courses.find({ level: { $in: ["Beginner", "Intermediate"] } });

// Q14. Find enrollments where completion percent is >= 80
db.enrollments.find({ "progress.completion_percent": { $gte: 80 } });

// Q15. Find enrollments where payment status is not Success
db.enrollments.find({ "payment.status": { $ne: "Success" } });

// Q16. Find learners from Hyderabad, Bangalore, or Pune
db.learners.find({ city: { $in: ["Hyderabad", "Bangalore", "Pune"] } });

// Q17. Find courses not in the Cloud category
db.courses.find({ category: { $ne: "Cloud" } });


//  ARRAY QUERIES

// Q18. Find instructors having expertise in AI
db.instructors.find({ expertise: "AI" });

// Q19. Find instructors having expertise in SQL
db.instructors.find({ expertise: "SQL" });

// Q20. Find courses using tool Python
db.courses.find({ tools: "Python" });

// Q21. Find courses using tool Databricks
db.courses.find({ tools: "Databricks" });

// Q22. Find enrollments where quiz score contains 95
db.enrollments.find({ quiz_scores: 95 });

// Q23. Find enrollments where any quiz score is greater than 85
db.enrollments.find({ quiz_scores: { $gt: 85 } });


// SORTING AND LIMIT

// Q24. Sort courses by price descending
db.courses.find().sort({ price: -1 });

// Q25. Display top 3 most expensive courses
db.courses.find().sort({ price: -1 }).limit(3);

// Q26. Sort learners by experience years descending
db.learners.find().sort({ experience_years: -1 });

// Q27. Display top 2 most experienced learners
db.learners.find().sort({ experience_years: -1 }).limit(2);

// Q28. Sort instructors by rating descending
db.instructors.find().sort({ rating: -1 });


// UPDATE OPERATIONS

// Q29. Update learner 1 city to Secunderabad
db.learners.updateOne(
  { learner_id: 1 },
  { $set: { city: "Secunderabad" } }
);

// Q30. Update course 203 price to 9000
db.courses.updateOne(
  { course_id: 203 },
  { $set: { price: 9000 } }
);

// Q31. Update enrollment 1006 completion percent to 30
db.enrollments.updateOne(
  { enrollment_id: 1006 },
  { $set: { "progress.completion_percent": 30 } }
);

// Q32. Change enrollment 1005 status to Inactive
db.enrollments.updateOne(
  { enrollment_id: 1005 },
  { $set: { status: "Inactive" } }
);

// Q33. Add field active: true to all learners
db.learners.updateMany(
  {},
  { $set: { active: true } }
);

// Q34. Remove field active from all learners
db.learners.updateMany(
  {},
  { $unset: { active: "" } }
);

// Q35. Add tool MongoDB to course 201
db.courses.updateOne(
  { course_id: 201 },
  { $push: { tools: "MongoDB" } }
);


// DELETE OPERATIONS

// Q36. Delete enrollments where payment status is Failed
db.enrollments.deleteMany({ "payment.status": "Failed" });

// Q37. Delete learners whose experience years is 0
db.learners.deleteMany({ experience_years: 0 });


// COUNT AND DISTINCT

// Q38. Count total learners
db.learners.countDocuments();

// Q39. Count total courses
db.courses.countDocuments();

// Q40. Count successful enrollments
db.enrollments.countDocuments({ "payment.status": "Success" });

// Q41. Display distinct learner cities
db.learners.distinct("city");

// Q42. Display distinct course categories
db.courses.distinct("category");

// Q43. Display distinct payment modes
db.enrollments.distinct("payment.mode");


// AGGREGATION

// Q44. Revenue by Payment Mode
db.enrollments.aggregate([
  { $match: { "payment.status": "Success" } },
  {
    $group: {
      _id: "$payment.mode",
      total_revenue: { $sum: "$payment.amount" }
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

// Q45. Revenue by Course
db.enrollments.aggregate([
  { $match: { "payment.status": "Success" } },
  {
    $group: {
      _id: "$course_id",
      total_revenue: { $sum: "$payment.amount" }
    }
  },
  {
    $project: {
      _id: 0,
      course_id: "$_id",
      total_revenue: 1
    }
  },
  { $sort: { total_revenue: -1 } }
]);

// Q46. Count Learners by Goal
db.learners.aggregate([
  {
    $group: {
      _id: "$goal",
      learner_count: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      goal: "$_id",
      learner_count: 1
    }
  },
  { $sort: { learner_count: -1 } }
]);

// Q47. Average Course Price by Category
db.courses.aggregate([
  {
    $group: {
      _id: "$category",
      avg_price: { $avg: "$price" }
    }
  },
  {
    $project: {
      _id: 0,
      category: "$_id",
      avg_price: { $round: ["$avg_price", 2] }
    }
  },
  { $sort: { avg_price: -1 } }
]);

// Q48. Average Completion Percentage by Course
db.enrollments.aggregate([
  {
    $group: {
      _id: "$course_id",
      avg_completion_percent: { $avg: "$progress.completion_percent" }
    }
  },
  {
    $project: {
      _id: 0,
      course_id: "$_id",
      avg_completion_percent: { $round: ["$avg_completion_percent", 2] }
    }
  },
  { $sort: { course_id: 1 } }
]);

// Q49. Count Enrollments by Status
db.enrollments.aggregate([
  {
    $group: {
      _id: "$status",
      count: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      enrollment_status: "$_id",
      count: 1
    }
  },
  { $sort: { count: -1 } }
]);

// Q50. Courses having revenue greater than ₹15,000
db.enrollments.aggregate([
  { $match: { "payment.status": "Success" } },
  {
    $group: {
      _id: "$course_id",
      total_revenue: { $sum: "$payment.amount" }
    }
  },
  { $match: { total_revenue: { $gt: 15000 } } },
  {
    $project: {
      _id: 0,
      course_id: "$_id",
      total_revenue: 1
    }
  },
  { $sort: { total_revenue: -1 } }
]);


//  LOOKUP 

// Q51. Enrollments with Learner Details
db.enrollments.aggregate([
  {
    $lookup: {
      from: "learners",
      localField: "learner_id",
      foreignField: "learner_id",
      as: "learner_info"
    }
  },
  { $unwind: "$learner_info" },
  {
    $project: {
      _id: 0,
      enrollment_id: 1,
      learner_name: "$learner_info.name",
      city: "$learner_info.city",
      course_id: 1,
      status: 1
    }
  }
]);

// Q52. Enrollments with Course Details
db.enrollments.aggregate([
  {
    $lookup: {
      from: "courses",
      localField: "course_id",
      foreignField: "course_id",
      as: "course_info"
    }
  },
  { $unwind: "$course_info" },
  {
    $project: {
      _id: 0,
      enrollment_id: 1,
      course_name: "$course_info.course_name",
      category: "$course_info.category",
      amount: "$payment.amount",
      payment_status: "$payment.status"
    }
  }
]);

// Q53. Courses with Instructor Details
db.courses.aggregate([
  {
    $lookup: {
      from: "instructors",
      localField: "instructor_id",
      foreignField: "instructor_id",
      as: "instructor_info"
    }
  },
  { $unwind: "$instructor_info" },
  {
    $project: {
      _id: 0,
      course_name: 1,
      category: 1,
      instructor_name: "$instructor_info.instructor_name",
      instructor_rating: "$instructor_info.rating"
    }
  }
]);

// Q54. Full Enrollment Report
db.enrollments.aggregate([
  {
    $lookup: {
      from: "learners",
      localField: "learner_id",
      foreignField: "learner_id",
      as: "learner_info"
    }
  },
  {
    $lookup: {
      from: "courses",
      localField: "course_id",
      foreignField: "course_id",
      as: "course_info"
    }
  },
  {
    $lookup: {
      from: "instructors",
      localField: "course_info.instructor_id",
      foreignField: "instructor_id",
      as: "instructor_info"
    }
  },
  {
    $project: {
      _id: 0,
      enrollment_id: 1,
      learner_name:       { $arrayElemAt: ["$learner_info.name",                0] },
      city:               { $arrayElemAt: ["$learner_info.city",                0] },
      goal:               { $arrayElemAt: ["$learner_info.goal",                0] },
      course_name:        { $arrayElemAt: ["$course_info.course_name",          0] },
      category:           { $arrayElemAt: ["$course_info.category",             0] },
      instructor_name:    { $arrayElemAt: ["$instructor_info.instructor_name",  0] },
      payment_amount:     "$payment.amount",
      payment_status:     "$payment.status",
      completion_percent: "$progress.completion_percent",
      enrollment_status:  "$status"
    }
  }
]);