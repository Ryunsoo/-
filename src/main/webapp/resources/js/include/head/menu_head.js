document.querySelector(".nav_title").addEventListener('mouseover', e => {
	document.querySelector(".gnb__sub-category-wrap").style.display = 'block';
})
document.querySelector("#mouse_off").addEventListener('mouseleave', e => {
	document.querySelector(".gnb__sub-category-wrap").style.display = 'none';
})
document.querySelector(".nav_info").addEventListener('mouseover', e => {
	document.querySelector(".gnb__sub-category-wrap").style.display = 'none';
})
document.querySelector(".logo").addEventListener('mouseover', e => {
	document.querySelector(".gnb__sub-category-wrap").style.display = 'none';
})