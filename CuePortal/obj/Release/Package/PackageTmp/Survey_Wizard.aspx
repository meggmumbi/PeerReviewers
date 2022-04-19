<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey_Wizard.aspx.cs" Inherits="CicPortal.Survey_Wizard" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey - CUE</title>
 
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/> 
   
    <link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />
    <!-- Bootstrap Core CSS -->
    
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap-float-label.css"/>
    <!-- Custom CSS -->
    <link href="assets/customs/css/customstyle.css" rel="stylesheet"/>
    <link href="assets/customs/css/checkradiocss.css" rel="stylesheet"/>
    <link href="dist/css/sb-admin-2.css" rel="stylesheet"/>
    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Stepy CSS -->
    <link href="assets/steps/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />
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
    <script src="assets/steps/js/survey-wizard.js"></script>
    <script src="assets/steps/js/jquery.validate.min.js"></script>
    <!-- Sweet Alert Plugin Js -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
</head>
    
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color: #0000fe; color: #FFFFFF;">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h4 style="color: #ffffff;">Peer Reviewers Portal</h4>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw" style="color: white;"></i>
                        <%-- <i class="fa fa-caret-down" style="color: white;"></i>--%>
                        <span class="counterbadge" id="lblcounter"><% =Session["notifcount"] %></span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="Notifications.aspx">
                                <strong>See All Notifications</strong></a>
                        </li>
                    </ul>

                    <!-- /.dropdown-alerts -->
                </li>
               
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: white;">
                        <i class="fa fa-user fa-fw"></i><% =Session["Name"] %> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="Profile.aspx"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>

                        <li><a href="Settings.aspx"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="Logout.aspx"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation" >
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li style="background-color: #F9BE00; height: 100px; text-align: center; vertical-align: text-top; padding-top: 20px;">
                            <label><% =Session["Name"] %></label><br/>
                            <label><%=Session["UserType"] %></label>
                        </li>
                        <li> <a href="Dashboard.aspx"><i class="fa fa fa-arrow-left"></i>&nbsp;Back</a></li>
                        <li> <a href="Survey_Wizard.aspx"><i class="fa fa fa-comments"></i>&nbsp;Feedback Form</a></li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row" style="width: 100%; display: block; margin: auto;">
                <div class="panel panel-default">
                    <div class="panel" style="margin-top: 20px;border: 1px solid #d0dada; border-radius: 4px;">
                        <img src="images/cue-header.jpg" width="100%" />
                        <h4 style="width: 100%; text-align: center;">Feedback Form</h4>
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
                                                    <li><a href="#general" data-toggle="tab">General Survey</a></li>
                                                    <li><a href="#portal" data-toggle="tab">Portal Survey</a></li>
                                                    <li><a href="#services" data-toggle="tab">Services Offered</a></li>
                                                    <%--  <li><a href="#uploads" data-toggle="tab">Uploads</a></li>--%>
                                                </ul>
                                            </div>

                                            <div class="tab-content">
                                                <div class="tab-pane" id="general">
                                                    <div class="row" >
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label>How satisfied were you with our portal design:</label> 
                                                                    <div class="form-group">
                                                                        <label class="radcheckcontainer">Satisfied
                                                                            <input type="radio" checked="checked" name="rdsatisfaction" value="Satisfied"/>&nbsp;
                                                                            <span class="radiomark"></span>
                                                                        </label>
                                                                    </div>
                                                                    
                                                                <div class="form-group">
                                                                    <label class="radcheckcontainer">Not satisfied
                                                                        <input type="radio" name="rdsatisfaction" value="Not satisfied"/>&nbsp;
                                                                        <span class="radiomark"></span>
                                                                    </label>
                                                                </div>
                                                                
                                                                <div class="form-group">
                                                                    <label class="radcheckcontainer">Unsatisfied
                                                                        <input type="radio" name="rdsatisfaction" value="Unsatisfied"/>&nbsp;
                                                                        <span class="radiomark"></span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label>General Comment:</label> 
                                                                <textarea class="form-control" placeholder="Type your general comment"></textarea>
                                                             </div>
                                                        </div>
                                                     </div>
                                                    <br/>
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label>What did you like about us:</label> 
                                                                <div class="form-group">
                                                                    <label class="radcheckcontainer">Organized forms
                                                                        <input type="checkbox" checked="checked" name="iLikedthis" value="Organized forms" />&nbsp;
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                </div>
                                                                    
                                                                <div class="form-group">
                                                                    <label class="radcheckcontainer">UI/UX Design
                                                                        <input type="checkbox" name="iLikedthis" value="UI/UX Design"  />&nbsp;
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                </div>
                                                                
                                                                <div class="form-group">
                                                                    <label class="radcheckcontainer">Speed
                                                                        <input type="checkbox" name="iLikedthis" value="Speed" />&nbsp;
                                                                        <span class="checkmark"></span>
                                                                    </label>
                                                                </div>
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
                                                <div class="tab-pane" id="portal">
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label>Email Address:</label> 
                                                                <input type="text" class="form-control" required="required" id="txtemailAddr" placeholder="Email Address"  />
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
                                                               
                                                             </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                   
                                                           </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane" id="services">
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label>Some dummy data</label>                  
                                                   
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label>Something dummy:</label>
                                                   
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label>Additional comments:</label>  
                                                                <input type="text" class="form-control" id="txtComments" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="form-group">
                                                                <label>Your feedback report:</label>  
                                                                <textarea id="txtFeedback" class="form-control" readonly="readonly" placeholder="your feedback collected"></textarea>
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
                                    
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>




