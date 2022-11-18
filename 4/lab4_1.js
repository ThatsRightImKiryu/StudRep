var summa=0
function add(){

   var ttr=document.createElement("tr");
   var ttd1=document.createElement("td");
   var ttd2=document.createElement("td");
 
   ttd2.addEventListener("mouseover",() => change1(ttd2))
   ttd2.addEventListener("mouseout",() => change2(ttd2))
   let price = document.getElementById("price").value;
   let name =document.getElementById("name").value;
   
   if(Number.parseFloat(price) && price!="" && name!="" && price>0){
      ttd1.innerHTML=name;
      ttd2.innerHTML=price;
      ttr.appendChild(ttd1);
      ttr.appendChild(ttd2);
      summa+=Number.parseFloat(ttd2.innerHTML);
      console.log(summa)

      
   }
   else alert("Неверный ввод")

   document.getElementById("t").appendChild(ttr)}

function sum(){
   document.getElementById("sum").innerHTML=summa;
}

function change1(el){
   el.style.backgroundColor="green"
}
function change2(el){
   el.style.backgroundColor="white"
}