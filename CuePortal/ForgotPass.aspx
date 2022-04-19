<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="CicPortal.ForgotPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Forgot Pass - CUE</title>

 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> 
   
     <link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">


    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div class="row" style="width: 100%; display: block; margin: auto;">
           <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3 col-sm-offset-3">
            <div class="panel" style="margin-top: 20px;border: 1px solid #d0dada;border-radius: 4px;">
                     <img src="images/cue-header.jpg" width="100%"/>
                     <h3 style="width: 100%; text-align: center;">Peer Reviewers Portal</h3>
                     <hr/>
                     <div style="padding: 20px; ">
                 <div id="feedback" runat="server"></div>
                         <div class="alert alert-info">
                             
                            <strong style="display: block; width: 100%; margin: auto; text-align: center;">Password Recovery</strong>
                            <p style="text-align:center">Kindly Enter The Email Used During Account Registration.</p>

                         </div>
                     <div class="form-group">
                         <label>Email Address</label>
                       
                             <asp:TextBox CssClass="form-control" runat="server" ID="txtemail" Placeholder="Enter Official Email Address" required style="height:42px;"/>
                            
                     </div>
                        </div>

                         <div style="background-color: #ececec; padding:10px;">
                             <asp:Button runat="server" CssClass="btn btn-success btn-block" ID="resetPass" Text="Reset My Password"  style="border-radius: 2px;font-size: 17px;line-height: 1.471;padding: 10px 19px;" OnClick="resetPass_Click"/>
                     </div>
                  
                 </div>                 
                     <span style="width: 100%; text-align: center;"> <a href="Login.aspx" runat="server" style="width: 100%;display: block;margin: auto;"> Back To Login</a></span>
                         
                       
               
             </div>
      <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-2 col-sm-offset-2" style="text-align: center;">
          <hr/>
              &copy; <%: DateTime.Now.Year %> -Design by  <a href="http://www.dynasoft.co.ke" runat="server" target="blank">Dynasoft Business Solutions</a>
         </div>
             </div>
    </form>
  
</body>
</html>
