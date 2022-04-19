<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CicPortal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Login - CUE</title>

 
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

   
</head>
<body>
    <form id="form1" runat="server">
    <div class="row" style="width: 100%; display: block; margin: auto;">
        
        <div class="col-md-6 col-lg-6 col-sm-10 col-xs-12 col-md-offset-1 col-lg-offset-3 col-sm-offset-3" >
            
            
                 <div class="panel" style="margin-top: 20px;border: 1px solid #d0dada;border-radius: 4px;">
                    
                       <img src="images/cue-header.jpg" width="100%"/>
                   
                     <h3 style="width: 100%; text-align: center;">Peer Reviewers Portal</h3>
                     <hr/>
                     <div style="padding: 20px; ">
                     <div id="feedback" runat="server"></div>
                     <div class="form-group">
                         <label>Email Address</label>                       
                             <asp:TextBox CssClass="form-control" runat="server" ID="username" Placeholder="Official Email Address" required style="height:42px;"/>                            
                     </div>
                    <div class="form-group">
                         <label>Account Password</label>
                         <asp:TextBox CssClass="form-control" runat="server" ID="password" Placeholder="Enter Account Password" type="password" required style="height:42px;"/>                                 
                     </div>
                   <a href="ForgotPass.aspx" style="color:blue">Forgot Your Password? Click Here To Reset</a> <br/>
                   <%--<a href="RegisterAccount.aspx">Apply To Be A Peer Reviewer</a>--%>
                        <%-- <a href="http://localhost:2040/">Don't have an Account?</a>--%>
                        </div>

                         <div style="background-color: #ececec; padding:10px;">
                             <asp:Button runat="server" CssClass="btn btn-success btn-block" ID="login" Text="Login"  style="border-radius: 2px;font-size: 17px;line-height: 1.471;padding: 10px 19px;" OnClick="login_Click"/>
                     </div>
                 </div>
             </div>
      <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-2 col-sm-offset-2" style="text-align: center;">
          <hr/>
              &copy; <%: DateTime.Now.Year %> -Design by  <a href="http://www.dynasoft.co.ke" runat="server" target="blank">Dynasoft Business Solutions</a>
         </div>
             </div>
    </form>
  
</body>
</html>
