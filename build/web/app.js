$(document).ready(function () {
  var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
      (function(){
      var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
      s1.async=true;
      s1.src='https://embed.tawk.to/568d3a1287faab542675f90c/default';
      s1.charset='UTF-8';
      s1.setAttribute('crossorigin','*');
      s0.parentNode.insertBefore(s1,s0);
      })();
	$('[data-submenu]').submenupicker();
    //initialize swiper when document ready    
    var swipermain = new Swiper('.swiper-container-main', {
        pagination: '.swiper-container-main .swiper-pagination',
        paginationClickable: true,
        autoplay: 5000
    });     
  });