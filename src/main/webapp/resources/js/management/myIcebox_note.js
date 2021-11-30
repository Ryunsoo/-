const go = document.querySelector("#go");
const bg = document.querySelector("#bg");
const popup = document.querySelector("#popup");
const exit = document.querySelector("#exit");

go.addEventListener("click",function(){
bg.classList.remove("hidden");
popup.classList.remove("hidden");
});

exit.addEventListener("click",function(){
bg.classList.add("hidden");
popup.classList.add("hidden");
});

function IceBoxCategory(category){
	location.href='/management/myIcebox_note?category=' + category;
}

function modify(category){
	location.href='myIcebox_modify?category=' + category;
}