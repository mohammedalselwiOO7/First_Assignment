import 'dart:io';

List<Person> ListOFPersons = [];

abstract class Person{
  static int _counter = 1;

  final int id;
  late String name;
  late String department;

  Person({required this.id, required this.name, required this.department});

  void printDetail();

  static int generateID(){
    return _counter++;
  }

  bool hasID(int PersonID){
    return this.id == PersonID;
  }
}

class Student extends Person{
  late int level;
  late double _gpa;

  double get gpa => _gpa;

  set setGpa(double StudentGPA){
    if(StudentGPA >=0 && StudentGPA <=100){
      _gpa = StudentGPA;
    }else{
      throw Exception("GPA must be between 0 and 100");
    }
  }

  Student({
    required super.id,
    required super.name,
    required super.department,
    required this.level,
    required double StudentGPA
  }){
    this.setGpa = StudentGPA;
  }

  Student.Guest() : this.level =1 , this._gpa = 0, super( id: 0 , name : 'Unknown' , department : 'Unknown' );

  @override
  void printDetail(){
    print('Student: ID: ${super.id} | Name: ${super.name} | Department: ${super.department} | Level: ${this.level} | GPA: ${this._gpa}');
  }
}

class Doctors extends Person{
  late int Salary;

  Doctors({
    required super.id,
    required super.name,
    required super.department,
    required this.Salary
  });

  @override
  void printDetail(){
    print('Doctor: ID: ${super.id} | Name: ${super.name} | Department: ${super.department} | Salary: ${this.Salary}');
  }
}

void main(){
  String appName= "Student Managment";
  print(appName);

  bool work = true;
  while(work){
    showMessage();
    stdout.write("Choose Number:");
    String number = stdin.readLineSync() ?? "";
    switch(number){
      case "1":
        addStudent();
        break;
      case "2":
        removePerson();
        break;
      case "3":
        showPerson();
        break;
      case "4":
        findPerson();
        break;
      case "5":
        addGuestStudent();
        break;
      case "6":
        addDoctor();
        break;
      case "7":
        work = false;
        break;
      default:
        print("invalid Number");
        break;
    }
  }
}

void showMessage(){
  print("Choose 1 to Add Student");
  print("Choose 2 to Remove Student");
  print("Choose 3 to Show Students");
  print("Choose 4 to Find Student");
  print("Choose 5 to Add Guest Student");
  print("Choose 6 to Add Doctor");
  print("Choose 7 to Stop The System");
}

void addStudent(){
  stdout.write("Enter Name:");
  String fullName = stdin.readLineSync() ?? "";

  stdout.write("Enter Level:");
  int studentLevel = int.tryParse(stdin.readLineSync() ?? "") ?? 1;

  stdout.write("Enter Department:");
  String studentDepartment = stdin.readLineSync() ?? "";

  stdout.write("Enter GPA:");
  double studentGpa = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

  try{
    ListOFPersons.add(
      Student(
        id: Person.generateID(),
        name: fullName,
        level: studentLevel,
        department: studentDepartment,
        StudentGPA: studentGpa
      )
    );
    print('Students Add Successful');
  }catch (e){
    print(e);
  }
}

void addDoctor(){
  stdout.write("Enter Name:");
  String fullName = stdin.readLineSync() ?? "";
  stdout.write("Enter Department:");
  String doctorDepartment = stdin.readLineSync() ?? "";
  
  stdout.write("Enter Salary:");
  int doctorSalary = int.tryParse(stdin.readLineSync() ?? "") ?? 1;

  ListOFPersons.add(
    Doctors(
      id: Person.generateID(),
      name: fullName,
      department: doctorDepartment,
      Salary: doctorSalary
    )
  );
  print('Doctor Add Successful');
}

void addGuestStudent(){
  ListOFPersons.add(Student.Guest());
  print('Guest Student Add Successful');
}

void removePerson(){
  stdout.write("Enter ID:");
  int? id = int.tryParse(stdin.readLineSync() ?? "");
  if(id==null){
    print("Invalid");
    return;
  }

  ListOFPersons.removeWhere((person)=>person.hasID(id));
  print("Remove Done");
}

void showPerson(){
  if(ListOFPersons.isEmpty){
    print("The List is empty");
    return;
  }

  for(Person student in ListOFPersons){
    student.printDetail();
  }
}

void findPerson(){
  if(ListOFPersons.isEmpty){
    print("The List is empty");
    return;
  }

  stdout.write("Enter ID:");
  int? id = int.tryParse(stdin.readLineSync() ?? "");
  if(id==null){
    print("Invalid");
    return;
  }

  for(Person student in ListOFPersons){
    if(student.hasID(id)){
      student.printDetail();
      return;
    }
  }
  print("Student Is not found");
}
