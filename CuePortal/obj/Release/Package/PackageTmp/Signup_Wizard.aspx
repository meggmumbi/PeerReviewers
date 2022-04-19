<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup_Wizard.aspx.cs" Inherits="CicPortal.Signup_Wizard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup - CUE</title>
 
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/> 
   
    <link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/steps/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/steps/css/demo.css" rel="stylesheet" />
    <!-- Sweet Alert Css -->
    <link href="assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    
    <!-- Jquery Core Js -->
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/customs/js/popper.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/steps/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    
    <%--custom js--%>
    <script src="assets/customs/js/jsFunctions.js"></script>

    <!--  Plugin for the Wizard -->
    <script src="assets/steps/js/gsdk-bootstrap-wizard.js"></script>
    <script src="assets/steps/js/jquery.validate.min.js"></script>
    <!-- Sweet Alert Plugin Js -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
  
</head>
<body>
    <div class="row" style="width: 100%; display: block; margin: auto;">
        
        <div class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1">
            
            <div class="panel" style="margin-top: 20px;border: 1px solid #d0dada;border-radius: 4px;">
                <img src="images/cue-header.jpg" width="100%"/>
                <h3 style="width: 100%; text-align: center;">Peer Reviewers Portal</h3>
                <hr/>
                <div style="padding: 10px;">
                  
                    <div class="body">
                        <!--  Wizard container  -->
                        <div class="wizard-container">

                            <div class="card wizard-card" data-color="orange" id="wizardProfile">
                                
                                <form action="#" runat="server" id="wizardcustomform" enctype="multipart/form-data" >
                                     <div class="wizard-header"></div>
                                    <br/>
                                      <div id="regfeedback" style="display: none"></div>
                                    <br/>

                                    <div class="wizard-navigation">
                                        <ul>
                                            <li><a href="#about" data-toggle="tab">About</a></li>
                                            <li><a href="#account" data-toggle="tab">Account</a></li>
                                            <li><a href="#address" data-toggle="tab">Address</a></li>
                                          <%--  <li><a href="#uploads" data-toggle="tab">Uploads</a></li>--%>
                                        </ul>
                                    </div>

                                    <div class="tab-content">
                                        <div class="tab-pane" id="about">
                                            <div class="row" >
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Title:</label>   
                                                        <select id="ddlSelTitle" runat="server" name="ddlSelTitle" class="form-control">
                                                            <option></option>
                                                        </select>

                                                    </div>
                                                </div> 
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Name:</label> 
                                                        <input type="text" class="form-control" required="required" id="txtName" placeholder="Full Name" /> 
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>ID No./Passport No.:</label> 
                                                        <input type="text" class="form-control" required="required" id="txtIdNo" placeholder="ID No./Passport No."/> 
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Highest Academic Qualification:</label>          
                                                        <select id="ddlhighestAcademicQlic" runat="server" name="ddlhighestAcademicQlic" class="form-control">
                                                            <option>--choose--</option>
                                                        </select>
                                                         </div>
                                                </div>
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>KRA PIN:</label>  
                                                        <input type="text" class="form-control" required="required" id="txtKraPin" placeholder="KRA P.I.N."  /> 
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="account">
                                            <div class="row">
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Email Address:</label> 
                                                        <input type="text" class="form-control" required="required" id="txtemailAddress" placeholder="Email Address"  />
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Phone Number:</label>  
                                                        <input type="text" class="form-control" required="required" id="txtPhoneno" placeholder="Phonenumber"  />
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Password:</label> 
                                                        <input type="password" class="form-control" required="required" id="txtPassword" placeholder="Password"  />                      
                                                      </div>
                                                </div>
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Confirm Password:</label>   
                                                        <input type="password" class="form-control" required="required" id="confirmPassword" placeholder="Confirm Password"  />
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        <div class="tab-pane" id="address">
                                            <div class="row">
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Post Address:</label>                       
                                                        <asp:TextBox CssClass="form-control" runat="server" ID="txtpostAddress" Placeholder="Post Address" required="required" />
                                   
                                                    </div>
                                                </div>
                                                <!--
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>Post Code:</label>
                                                         <select id="ddlPostCodes" runat="server" name="ddlPostCode" class="form-control" onchange = "return getSelectedPosta30(this)">
                                                            <option></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                -->
                                                <div class="col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label>City:</label>  
                                                        <input type="text" class="form-control" id="txtCity" readonly="readonly"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                <div class="wizard-footer height-wizard">
                                    <div class="pull-right">
                                       <%-- <input type='button' class='btn btn-interimsave btn-fill btn-warning btn-wd btn-sm' style="" name='save' value='Interim Save' />--%>
                                        <input type='button' class='btn btn-next btn-fill btn-warning btn-wd btn-sm' name='next' value='Next' />
                                        <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd btn-sm' name='finish' value='Finish' />
                                    </div>

                                    <div class="pull-left">
                                        <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                </form>
                            </div>
                        </div> <!-- wizard container -->

                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-2 col-sm-offset-2" style="text-align: center;">
            <hr/>
            &copy; <%: DateTime.Now.Year %> -Design by  <a href="http://www.dynasoft.co.ke" runat="server" target="blank">Dynasoft Business Solutions</a>
        </div>
    </div>
  
</body>
</html>

