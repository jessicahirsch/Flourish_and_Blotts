const c = console.log
let submit;
window.onload = function(){
	c('script.js is avail')

	submit = document.getElementsByClassName('submit')[0];
	submit.addEventListener('click',function(event){
		submit.className += ' rotate-center';
		setTimeout(function(){
			submit.className = 'submit';
		},300);

	});

}	