$(document).ready(function(){
  $("#inb").click(function(){
    $("#listinb").show();
    $("#listper,#liststd,#listwrk,#listall").hide();
  });
});
$(document).ready(function(){
  $("#per").click(function(){
    $("#listper").show();
    $("#listinb,#liststd,#listwrk,#listall").hide();
  });
});
$(document).ready(function(){
  $("#std").click(function(){
    $("#liststd").show();
    $("#listper,#listinb,#listwrk,#listall").hide();
  });
});
$(document).ready(function(){
  $("#wrk").click(function(){
    $("#listwrk").show();
    $("#listper,#liststd,#listinb,#listall").hide();
  });
});
$(document).ready(function(){
  $("#al").click(function(){
    $("#listall").show();
    $("#listper,#liststd,#listwrk,#listinb").hide();
  });
});
 
$(document).ready(function(){
  $("li[id^=taski_]").hover(function () {
    $("#listinb, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=taski_]").click(function () {
    $("#listinb, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=taskp_]").hover(function () {
    $("#listper, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=taskp_]").click(function () {
    $("#listper, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=tasks_]").hover(function () {
    $("#liststd, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=tasks_]").click(function () {
    $("#liststd, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=taskw_]").hover(function () {
    $("#listwrk, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=taskw_]").click(function () {
    $("#listwrk, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=taskall_]").hover(function () {
    $("#listall, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});
$(document).ready(function(){
  $("li[id^=taskall_]").click(function () {
    $("#listall, #listicon").toggle();
    $("#infoinb").toggle();   
  });
});

// show notice
$(document).ready(function(){
   setTimeout(function(){ jQuery("#notice").hide(); }, 2000);
});

// change li color onClick
$(document).ready(function (){
  $("li[id^=taski_]").click(function() {
    $(this).toggleClass("tasksclick")
  })
});
$(document).ready(function (){
  $("li[id^=taskp_]").click(function() {
    $(this).toggleClass("tasksclick")
  })
});
$(document).ready(function (){
  $("li[id^=tasks_]").click(function() {
    $(this).toggleClass("tasksclick")
  })
});
$(document).ready(function (){
  $("li[id^=taskw_]").click(function() {
    $(this).toggleClass("tasksclick")
  })
});

$(document).ready(function (){
  $("li[id^=task_]").click(function() {
    $(this).toggleClass("tasksclick")
  })
});

// submit form on enter
$('#task_form input').keydown(function(e) {
    if (e.keyCode == 13) {
      $('#task_form').submit();
    }
});

// color input on click
$(document).ready(function() {
  $('input.contentarea').focus(function(){
     $(this).addClass('contentglow');
   }).blur(function() {
    $(this).removeClass('contentglow');
  })  
});

// ajax loader
$(function() {
  $('#loading-indicator').hide(); 
  $(document)  
    .ajaxStart(function() {
      $('#loading-indicator').show(); 
    })
    .ajaxStop(function() {
      $('#loading-indicator').hide(); 
  });
});







