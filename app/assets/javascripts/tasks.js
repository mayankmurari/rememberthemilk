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

// check/uncheck
$(document).ready(function(){
  $('#check_all').click(function(){ 
    $('input[type="checkbox"]').prop('checked', true); 
  });
});
$(document).ready(function(){
  $('#uncheck_all').click(function(){ 
    $('input[type="checkbox"]').prop('checked', false); 
  });
});
$('#search').keydown(function(e) {
    if (e.keyCode == 13) {
      $('#search_form').submit();
    }
});

// inplace editing hover
$(document).ready(function(){
  $(".editable").hover(function(){
    $(this).addClass("editHover");
    },function(){
      $(this).removeClass("editHover");
  });
});

// edit form
// $(document).ready(function(){
//   $(".editable").dblclick( replaceHTML);
// });
// function replaceHTML()
//     {
//         oldText = $(this).html();
                         
//        $(this).html("<form id=\"edit_form\"><input type=\"text\" value=\""+ oldText +"\" class=\"edit\"></form> <a href=\"#\" class=\"btnSave\">Save changes</a> <a href=\"#\" class=\"btnDiscard\">Discard changes</a>");
//     }


// $(".btnDiscard").click(function(){
//   $(this).parent().html(oldText);
//     }
// );

//EDIT FORM COMPLETE
$(document).ready(function(){
  var oldText, newText;
  $(".editable").hover(function(){
    $(this).addClass("editHover");
    },function(){
    $(this).removeClass("editHover");
  });
   
  $(".editable").dblclick(replaceHTML);
     
  $(".btnDiscard").click(function(){
    $(this).parent().html(oldText).dblclick(replaceHTML);
  });

   function replaceHTML()
  {
    oldText = $(this).html();
    $(this).html("<form id=\"edit_form\"><input type=\"text\" value=\""+ oldText +"\" class=\"editBox\"></form> <a href=\" \" class=\"btnSave\">Save changes</a><a href=\"\" class=\"btnDiscard\">Discard changes</a>");
  }
     
});


// submit edit form on click 
$(document).ready(function(){
  $('#edit_form').keydown(function(e) {
    if (e.keyCode == 13) {
      $('#edit_form').submit();
    }
  });
});










