<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PeerReviewerApplication.aspx.cs" Inherits="CicPortal.PeerReviewerApplication" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Creation - CUE</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
  
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="../vendor/toastr/toastr.min.css">
    <link rel="stylesheet" href="../vendor/bootsrap/css/bootsrap-datepicker.css">
    <link rel="stylesheet" href="../vendor/bootsrap/css/bootsrap-datepicker.min.css">
    <link rel="stylesheet" href="../vendor/fullcalendar/fullcalendar.css">
    <script src="../vendor/fullcalendar/lib/moment.min.js"></script> 
    <script src="../vendor/fullcalendar/lib/jquery-ui.custom.min.js"></script> 
    <script src="../vendor/fullcalendar/fullcalendar.min.js"></script> 
    <script src="../vendor/toastr/toastr.min.js"></script> 
    <link href="../dataTables/dataTables.bootstrap.css" rel="stylesheet">
    
    <!--steps wizard-->
    <link href="assets/steps/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />

    <!-- DataTables Responsive CSS -->
    <link href="../dataTables/dataTables.responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.rawgit.com/tonystar/bootstrap-float-label/v3.0.1/dist/bootstrap-float-label.min.css"/>
    <link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap-float-label.css"/>
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- CustomCSS -->
    <link href="assets/customs/css/customstyle.css" rel="stylesheet">
    <!-- Sweet Alert Css -->
    <link href="assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
</head>
<body>
  <form id="form1" runat="server">
    <div id="loader" class="loader" style="display: none">
        <div class="center">
            <img alt="" src="images/cue-header.jpg" />
        </div>
          <div class="row" style="width: 100%; display: block; margin: auto;">
            <div class="panel col-md-10 col-lg-10 col-sm-10 col-xs-12 col-md-offset-1 col-lg-offset-1 col-sm-offset-1" style="margin-top: 20px; border: 1px solid #d0dada; border-radius: 4px; padding-top: 5px; padding-bottom: 10px;">
                <div class="row" style="width: 100%; margin: 5px;">
                    <div>
                        <img src="images/cue-header.jpg" width="100%" height="100px" />
                        <h3 style="width: 100%; text-align: center;">Peer Reviewers Portal</h3>
                        <hr />
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel panel-heading">
                            <h3 class="panel-title">General Information</h3>
                        </div>
                        <div class="row user-tabs">
                            <div class="col-lg-12 col-md-12 col-sm-12 line-tabs">
                                <div class="stepwizard">
                                    <div class="stepwizard-row setup-panel">
                                        <div class="stepwizard-step col-xs-step">
                                            <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
                                            <p><small>General Details</small></p>
                                        </div>
                                        <div class="stepwizard-step col-xs-step">
                                            <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                                            <p><small>Core Initiatives</small></p>
                                        </div>
                                        <div class="stepwizard-step col-xs-step">
                                            <a href="#step-4" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                                            <p><small>Additional Initiatives</small></p>
                                        </div>
                                        <div class="stepwizard-step col-xs-step">
                                            <a href="#step-5" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
                                            <p><small>Job Description</small></p>
                                        </div>
                                        <div class="stepwizard-step col-xs-step">
                                            <a href="#step-6" type="button" class="btn btn-default btn-circle" disabled="disabled">5</a>
                                            <p><small>Attach Supporting Documents</small></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-primary setup-content" id="step-1">
                            <div class="panel panel-heading">
                                <h3 class="panel-title">General Details</h3>
                            </div>            
                            <div class="panel-body">
                                <div runat="server" id="generalfeedback"></div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Employee No.</label>
                                        <asp:Label runat="server" class="form-control" readonly="true"> <%=Session["employeeNo"] %></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Employee Name</label>
                                        <asp:Label runat="server" class="form-control" readonly="true"> <%=Session["name"] %></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Strategic Plan No.</label>
                                        <asp:DropDownList runat="server" ID="strategicplanno" Class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Department/Center PC ID</label>
                                        <asp:DropDownList runat="server" ID="funcionalworkplan" Class="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem>--Select Department/Center PC ID--</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="control-label">Annual Reporting Code.</label>
                                        <asp:DropDownList runat="server" ID="annualreportingcode" Class="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-12">
                                    <div class="panel-footer">
                                        <center>
                                            <asp:Button runat="server" ID="apply" CssClass="btn btn-success" Text="Save Details"/>
                                        <div class="clearfix"></div>
                                        </center>
                                    </div>
                   
                                </div>
<%--                                <div class="row">
                                    <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                                </div>--%>
                            </div>              
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </div>
      <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    <script src="../vendor/flot/excanvas.min.js"></script>
    <script src="../vendor/flot/jquery.flot.js"></script>
    <script src="../vendor/flot/jquery.flot.pie.js"></script>
    <script src="../vendor/flot/jquery.flot.resize.js"></script>
    <script src="../vendor/flot/jquery.flot.time.js"></script>
    <script src="../vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>

    <script src="../vendor/bootsrap/js/bootsrap-datepicker.js"></script>
    <script src="../vendor/bootsrap/js/bootsrap-datepicker.min.js"></script>
            
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="fullcalendar/fullcalendar.css">
    <script src="fullcalendar/lib/moment.min.js"></script> 
    <script src="fullcalendar/lib/jquery-ui.custom.min.js"></script> 
    <script src="fullcalendar/fullcalendar.min.js"></script> 
    <script src="../dataTables/jquery.dataTables.min.js"></script>
    <script src="../dataTables/dataTables.bootstrap.min.js"></script>

    <%--custom js--%>
    <script src="assets/customs/js/jobspagejs.js"></script>
    <script src="assets/customs/js/customjs.js"></script> 

    <!--  Plugin for the Wizard -->
    <script src="assets/steps/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="assets/steps/js/survey-wizard.js"></script>
    <script src="assets/steps/js/jquery.validate.min.js"></script>

    <!-- Sweet Alert Plugin Js -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script type="text/javascript" src="http://oss.sheetjs.com/js-xlsx/xlsx.full.min.js"></script>
 </form>
</body>
</html>