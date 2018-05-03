$(function(){
$(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
            $(this).toggleClass('open');
            $('b', this).toggleClass("caret caret-up");                
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
            $(this).toggleClass('open');
            $('b', this).toggleClass("caret caret-up");                
        });
});

$('.dropdown-toggle').off('click');
$('[data-toggle="datepicker"]').datepicker({
    autoHide: true,
    format: 'dd/mm/yyyy'
});

/*** check if the patient is less than 10 years ***/
$("#patientdob").change(function () {
   /*** var dob = $("#patientdob").val();
    var dateofbirth = new Date(dob);
    var today = new Date();
    var age = today - dateofbirth;
    alert(dateofbirth);***/
});

/*** check education level ***/
$("#patientedlevel").change(function () {
    var edulevel = $("#patientedlevel").val();
    if (edulevel == "other") {
        $("#edotherwrap").show();
    }
    else {
        $("#edotherwrap").hide();
        $("#patientedother").val("");
    }
});

/** check if patient has abused drugs ***/
$("#patientsubstanceabuse").change(function () {
    var abuse = $("#patientsubstanceabuse").val();
    if (abuse == "yes") {
        $("#substancewrap").show();
    }
    else {
        $("#patientsubstance").val([]);
        $("#substancewrap").hide();
    }
});

/*** search patients ***/
$("#searchid").keyup(function () {
    var formData = {
        'searchid': $('#searchid').val()
    };
    $.ajax({
        type: "POST",
        url: "/backend/search_patient.aspx",
        data: formData,
        success: function (data) {
            $("#patientrecords").html(data);
        }
    });
});

/*** validate form ***/
$().ready(function () {
    // validate signup form on keyup and submit
    $("#patientform").validate({
        rules: {
            patientname: "required",
            patientno: "required",
            patientdob: "required",
            patientheight: "required",
            patientweight: "required",
            patientenrolldate: "required"
        },
        messages: {
            patientname: "Please enter patient's name",
            patientno: "Please enter the enrollnment number",
            patientdob: "Please enter patient's Date of Birth",
            patientheight: "Please enter patient's height",
            patientweight: "Please enter patient's weight",
            patientenrolldate: "Please enter the enrollnment date"
        }
    });
});