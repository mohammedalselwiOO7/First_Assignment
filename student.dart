import 'dart:io';

int counter = 0;
List<Map<String, dynamic>> students = [];

void main() {
String appName = "student Managment";
print(appName);
bool work = true;
while (work) {
show_Message();
stdout.write("Choose Number: ");
String number = stdin.readLineSync() ?? "";
switch (number) {
case "1":
addStudent();
break;

case "2":
removeStudent();
break;
case "3":
showStudent();
break;
case "4":
findStudent();
break;
case "5":
work = false;
break;
}
}
}

void show_Message() {
print("Choose 1 to Add Student");
print("Choose 2 to Remove Student");
print("Choose 3 to Show Student");
print("Choose 4 to Find Student");
print("Choose 5 to Stop Student");
}

void addStudent() {
stdout.write("Choose Name: ");
String name = stdin.readLineSync() ?? "";

stdout.write("Choose Level: ");
int level = int.tryParse(stdin.readLineSync() ?? "") ?? 1;

stdout.write("Choose Department: ");
String department = stdin.readLineSync() ?? "";

stdout.write("Choose mark: ");
double gpa = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;
students.add({
"id": counter++,
"name": name,
"department": department,
"level": level,
"gpa": gpa,
});
print("Add Sucessfull");
}

void removeStudent() {
stdout.write("Choose ID: ");
int? id = int.tryParse(stdin.readLineSync() ?? "");
if (id == null) {
print("Invalid");
return;
students.removeWhere((student) => student['id'] == id);
print("Remov Done");
}
}

void showStudent() {
print("kjk");
if (students.isEmpty) {
print("The List is empty");
return;
}
for (var student in students) {
print(
"ID: {student["name"]} | Level: {student['department']} | mark: $`{student['gpa']} ",
);
}
}

void findStudent() {
stdout.write("Choose ID: ");
int? id = int.tryParse(stdin.readLineSync() ?? "");
if (id == null) {
print("Invalid");
return;
}
for (var student in students) {
if (student['id'] == id) {
print(
"ID: ${student["id"]} | Name: ${student["name"]} | Level: ${student['level']} | Department: ${student['department']} | mark: `${student['gpa']} ",
);

return;
}
}
print("Student Is not found");
}