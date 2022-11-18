var sum=0
function set(){
    h2=document.createElement("h2");
    h2.innerHTML="Сумма заказа:";
    p=document.createElement("p");
    
    div=document.createElement("div")

    div.appendChild(h2)
    div.appendChild(p)

    row=document.getElementsByClassName("row")[0];
    row.appendChild(div);

    p.id="order";

    btns=document.getElementsByTagName("input");
    for(let i=0;i< btns.length;i++){
        btns[i].onclick= ()=>add(i+1);
    }
    
}

function add(el){
    price=Number.parseFloat(el.children[1].innerHTML)
    console.log(el.children[0].innerHTML)
    trs=document.getElementById("list").getElementsByTagName("tr")

    good=el.children[0].innerHTML

    inlist=1
    pos=0
    for(j=0;j<trs.length;j++)
    {
        if(trs[j].children[0].innerHTML==good){
            if(inlist==1) pos=j;
            inlist+=1;
        }
    }
    if(inlist==1){

        tr=document.createElement("tr")
        td1=document.createElement("td")
        td2=document.createElement("td")
        td3=document.createElement("td")

        tr.appendChild(td1)
        tr.appendChild(td2)
        tr.appendChild(td3)

        td1.innerHTML=good
        td2.innerHTML=price
        td3.innerHTML=1

        document.getElementById("list").appendChild(tr)
    }
    else trs[pos].children[2].innerHTML=Number.parseFloat(trs[pos].children[2].innerHTML)+1;
    sum+=price
    
    document.getElementById("order").innerHTML=sum;
}

function change1(el)
{
    el.style.backgroundColor="green"
}

function change2(el){
el.style.backgroundColor="white"
}
