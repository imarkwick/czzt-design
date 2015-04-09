$(document).ready(function() {
  setTimeout(function() {
    $('body').css("-webkit-filter", "blur(4px)")
  }, 800);
  setTimeout(function() {
    $('body').css("-webkit-filter", "blur(3px)")
  }, 900);
  setTimeout(function() {
    $('body').css("-webkit-filter", "blur(2px)")
  }, 1000);
  setTimeout(function() {
    $('body').css("-webkit-filter", "blur(1px)")
  }, 1100);
  setTimeout(function() {
    $('body').css("-webkit-filter", "blur(0px)")
  }, 1200);

//video
  $("#cover").click(function(){
    $("#englogo").fadeOut();
});
});
var hellos = setTimeout(function() {
  $("#hi").fadeIn(3000);
  $("#hi").fadeOut(100);
  $("#im").fadeIn(5000);
  $("#im").fadeOut(100);
  $("#clare").fadeIn(7000);
  1000
});
$('a[href^="#"]').on('click', function(event) {
  var target = $($(this).attr('href'));
  if (target.length) {
    event.preventDefault();
    $('html, body').animate({
      scrollTop: target.offset().top
    }, 1000);
  }
});
var TxtRotate = function(el, toRotate, period) {
  this.toRotate = toRotate;
  this.el = el;
  this.loopNum = 0;
  this.period = parseInt(period, 10) || 2000;
  this.txt = '';
  this.tick();
  this.isDeleting = false;
};
TxtRotate.prototype.tick = function() {
  var i = this.loopNum % this.toRotate.length;
  var fullTxt = this.toRotate[i];
  if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
  } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
  }
  this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';
  var that = this;
  var delta = 300 - Math.random() * 100;
  if (this.isDeleting) {
    delta /= 2;
  }
  if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
  } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
  }
  setTimeout(function() {
    that.tick();
  }, delta);
};
window.onload = function() {
  var elements = document.getElementsByClassName('txt-rotate');
  for (var i = 0; i < elements.length; i++) {
    var toRotate = elements[i].getAttribute('data-rotate');
    var period = elements[i].getAttribute('data-period');
    if (toRotate) {
      new TxtRotate(elements[i], JSON.parse(toRotate), period);
    }
  }
  // INJECT CSS
  var css = document.createElement("style");
  css.type = "text/css";
  css.innerHTML = ".txt-rotate > .wrap { border-right: 0.08em solid #666 }";
  document.body.appendChild(css);
};
