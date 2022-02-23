import 'dart:io';

List<Map<String, dynamic>> db = [
  {
    "id": 1,
    "name":"Youssef Nour",
    "age": 21,
    "faculty": "FCAI-CU",
  },
  {
    "id": 2,
    "name":"Fawzy Mohammed",
    "age": 20,
    "faculty": "FCAI-AU"
  },
  {
    "id": 3,
    "name":"Moaaz Salama",
    "age": 20,
    "faculty": "FCI-HU"
  },
  {
    "id": 4,
    "name":"Salma Mostafa",
    "age": 19,
    "faculty": "FCAI-CU"
  },
];

bool addMember(){
  print("# enter member id");
  int? id = int.tryParse(stdin.readLineSync()!);
  print("# enter member name");
  String name = stdin.readLineSync()!;
  print("# enter member age");
  int? age = int.tryParse(stdin.readLineSync()!);
  print("# enter member faculty");
  String faculty = stdin.readLineSync()!;
  if(id != null || age != null)
  {
    Map<String, dynamic> member = {
      "id": id,
      "name" : name,
      "age": age,
      "faculty": faculty
    };
  
    for(var element in db) {
      if (element["id"] == id || element["name"] == name) {
        return false;
      }
    };
    db.add(member);
    return true;
  }
  else
  {
    return false;
  }
}

void printList(){
  print("All Members: \n=======================");
  db.forEach((member) { 
    print("ID: ${member["id"]}\nName: ${member["name"]}\nAge: ${member["age"]}\nFaculty: ${member["faculty"]}\n=======================\n\n");
   });
}
void deleteMember(){
  print("enter member id");
  int? id = int.tryParse(stdin.readLineSync()!);
  db.removeWhere((element) => element["id"] == id);
  printList();
}

void printAtIndex(int index){
  print("\nID: ${db[index]["id"]}\nName: ${db[index]["name"]}\nAge: ${db[index]["age"]}\nFaculty: ${db[index]["faculty"]}\n");
}

void searchByName(){
  print("enter member name");
  String name = stdin.readLineSync()!;
  bool f = false;
  for(int i = 0; i < db.length ; i++) { 
    if (db[i]["name"].toLowerCase() == name.toLowerCase() || db[i]["name"].toLowerCase().contains(name.toLowerCase())) {      
      printAtIndex(i);
      f = true;
    }else{
      f = false;
    }
   };
   f? " ": print("Sorry! This member doesn't exist");
}
void searchById(){
  print("enter member id");
  int? id = int.tryParse(stdin.readLineSync()!);
  var flag = 0;
  int? index;
  for(int i = 0; i < db.length ; i++) { 
    if (db[i]["id"] == id) {
      flag = 1;
      index = i;
      break;
    }else{
      flag = 0;
    }
   };
   flag ==  1? printAtIndex(index!): print("Sorry! This member doesn't exist");
}
void sortByName(){
  db.sort((member1, member2) {
  var flag = member1["name"].split(' ')[0].compareTo(member2["name"].split(' ')[0]);
  if (flag != 0) return flag;
  return member1["name"].split(' ')[1].compareTo(member2["name"].split(' ')[1]);
});
}

void main(){
  print("Welcome to Minders\n\n");
  print("Choose an operation: \n");
  var options = 
  '''
1- ADD NEW MEMBER
2- DELETE MEMBER
3- SEARCH BY ID
4- SEARCH BY NAME
5- DISPLAY ALL MEMBERS UNSORTED 
6- DISPLAY ALL MEMBERS SORTED BY NAME
7- EXIT
 ''';
  print(options);
 var choice = stdin.readLineSync()!;
  loop1:
  while (choice != 7) {
    switch (choice) {
      case "1": 
        {
          if (addMember()) {
            print("Added Successfully\n");
            printList();
          } 
          else 
            print("Member can't be added");;
          break;
        }
      case "2": 
        deleteMember();
        break;
      case "3":
        searchById();
        break;
      case "4":
        searchByName();
        break;
      case "5":
        printList();
      break;
      case "6":
      {
        sortByName();
        printList();
      }
      break;
      case "7":
        print("See U later ^_^");
        break loop1;
      default:
      print("Wrong Choice");
    }
    print("\n$options");
    choice = stdin.readLineSync()!;
  }
}
