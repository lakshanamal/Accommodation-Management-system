// form submission with ajax [register 1st page]
$('#foodReg').on('submit',function(){
    var first=$('#first_name').val();
    var last=$('#last_name').val();
    var nic=$('#nic').val();
    var email=$('#email').val();
    var level ='food_supplier';
    var password=$('#password').val();
    var confirmpassword=$('#confirmpassword').val();
    var address=$('#address').val();
    var merchant=$('#merchant').val();
    $.ajax({
        url:"../controller/registerCon.php",
        method:"POST",
        data:{submitFood:"submitFood",first_name:first,last_name:last,nic:nic,email:email,level:level,password:password,confirmpassword:confirmpassword,address:address,merchant:merchant},
        dataType:"json",
        success:function(data)
        {
            console.log(data);
            if(data.state=='unsucess'){
                if(data.pass!=""){
                    $('#passError').html(data.pass);
                    $('#password').css("background-color", "rgb(255, 224, 224)");
                    $('#confirmpassword').css("background-color", "rgb(255, 224, 224)");
                 }else{
                    $('#passError').html('');
                    $('#password').css("background-color", "#b8bcc4");
                    $('#confirmpassword').css("background-color", "#b8bcc4");
                 }
                 if(data.address!=""){
                    $('#addError').html(data.address);
                    $('#address').css("background-color", "rgb(255, 224, 224)");
                 }else{
                    $('#addError').html("");
                    $('#address').css("background-color", "#b8bcc4");            
                 }
                 if(data.merchant!=""){
                    $('#merError').html(data.merchant);
                    $('#merchant').css("background-color", "rgb(255, 224, 224)");
                 }else{
                    $('#merError').html('');
                    $('#merchant').css("background-color", "#b8bcc4");             
                }
            }else if(data.state=='sucess'){
                console.log("hello");
                window.location='emailVerify.php?email='+data.email+'&token='+data.token+'&level='+'food_supplier';
            }
          
        }
    });
    return false;
});

