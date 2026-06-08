salaries = [45000, 55000, 65000, 75000, 85000]
#1
print(salaries)
#2
print(max(salaries))
print(min(salaries))
#3
print(sum(salaries))
#4 
s = sum(salaries)
n = len(salaries)
avg = s/n 
print(avg)
#5
salaries.append(95000)
salaries.append(105000)
print(salaries)
#6 
salaries.remove(55000)
print(salaries)
#7
salaries.sort()
#8 
salaries.sort(reverse = True)
print(salaries)
#9
print(salaries[1])
#10
for i in salaries:
    if i>70000:
        print(i)
        

##Tuple

employee = (
101,
"Rahul Sharma",
"Data Engineering",
75000
)
#11
print(employee)
#12
print(employee[1])
#13
print(employee[2])
#14
eid, name, dept, sal = employee
print(name)
print(dept)
print(eid)
print(sal)
#15
print(len(employee))
print(employee[0])
print(employee[-1])

#Set

batch_a = {
"Rahul",
"Priya",
"Amit",
"Sneha",
"Farhan"
}
batch_b = {
"Priya",
"Sneha",
"Neha",
"Arjun",
"Farhan"
}
#16
common = batch_a.intersection(batch_b)
print(common)

#17
A = batch_a.difference(batch_b)
print(A)
#18

B = batch_b.difference(batch_a)
print(B)

#19
unique = batch_a.union(batch_b)
print(unique)

#20

not_common = batch_a.symmetric_difference(batch_b)
print(not_common)

#Dictionary

employee_info = {
"employee_id": 101,
"name": "Rahul Sharma",
"department": "Data Engineering",
"salary": 75000,
"city": "Hyderabad"
}

#21
print(employee_info["name"])
#22
print(employee_info["department"])

print(employee_info["city"])
#23
employee_info["experience"] = 5
print(employee_info)
#24
employee_info["salary"] = 85000
print(employee_info)
#25
employee_info.pop("city")
print(employee_info)
#26
print(employee_info.keys())
#27
print(employee_info.values())
#28
print(employee_info.items())


#List of Dictionaries


employees = [
{
"id": 101,
"name": "Rahul",
"department": "IT",
"salary": 50000
},
{
"id": 102,
"name": "Priya",
"department": "HR",
"salary": 70000
},
{
"id": 103,
"name": "Amit",
"department": "IT",
"salary": 60000
},
{
"id": 104,
"name": "Sneha",
"department": "Finance",
"salary": 80000
},
{
"id": 105,
"name": "Farhan",
"department": "IT",
"salary": 90000
}
]
#29
for i in employees:
    print(i['name'])
#30
for i in employees:
    if i["department"] == "IT":
        print(i)

#31
highest = employees[0]
for i in employees:
    if i["salary"]>highest["salary"]:
        highest = i
print(highest)


#32
lowest = employees[0]
for emp in employees:
    if emp["salary"] < lowest["salary"]:
        lowest = emp
print(lowest)

#33
total = 0
for emp in employees:
    total = total + emp["salary"]
average = total / len(employees)
print(average)

#34
print(total)

#35
for emp in employees:
    if emp["salary"] > 70000:
        print(emp)
#36

count = 0
for emp in employees:
    if emp["department"] == "IT":
        count = count + 1
print(count)

#37
employees.sort(reverse=True, key=dict.get)

for emp in employees:
    print(emp["name"], emp["salary"])
#38

second_highest = employees[1]
print(second_highest)


#39
departments = set()
for emp in employees:
    departments.add(emp["department"])
print(departments)








        