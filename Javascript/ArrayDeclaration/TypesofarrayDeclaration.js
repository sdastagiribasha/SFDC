var arrayone=[1,2,3,4,5];
console.log(arrayone);//-->1st type

for(i=1;i<=10;i++)
{
	console.log(i);//-->2nd type
}

arrayone.forEach(arrele => console.log(arrele)); //-->3rd type

var arr;
for(arr of arrayone)
{
	console.log(arr); //--> 4th type
}


arrayone.map(item => console.log(item)); //-->5th Type using Map concept
