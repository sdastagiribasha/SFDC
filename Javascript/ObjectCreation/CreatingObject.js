class Student {
constructor (name,rollno)
{
	this.name=name;
  this.rollno=rollno;
}

displayDetails(){
console.log('Name:'+this.name );
console.log('RoleNo:'+this.rollno);

}

}

var obj = new Student('Test',12);
obj.displayDetails();

