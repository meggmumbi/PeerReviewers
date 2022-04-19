<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterAccount.aspx.cs" Inherits="CicPortal.RegisterAccount" %>
<%@ Import Namespace="CicPortal" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Creation - CUE</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet" />
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet" />
    <link href="dist/css/CustomCss.css" rel="stylesheet" />
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="../vendor/toastr/toastr.min.css"/>
    <link rel="stylesheet" href="../vendor/bootsrap/css/bootsrap-datepicker.css"/>
    <link rel="stylesheet" href="../vendor/bootsrap/css/bootsrap-datepicker.min.css"/>
    <link rel="stylesheet" href="../vendor/fullcalendar/fullcalendar.css"/>
    <script src="../vendor/fullcalendar/lib/moment.min.js"></script> 
    <script src="../vendor/fullcalendar/lib/jquery-ui.custom.min.js"></script> 
    <script src="../vendor/fullcalendar/fullcalendar.min.js"></script> 
    <script src="../vendor/toastr/toastr.min.js"></script> 
    <link href="../dataTables/dataTables.bootstrap.css" rel="stylesheet"/>
    
    <!--steps wizard-->
    <link href="assets/steps/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />

    <!-- DataTables Responsive CSS -->
    <link href="../dataTables/dataTables.responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.rawgit.com/tonystar/bootstrap-float-label/v3.0.1/dist/bootstrap-float-label.min.css"/>
    <link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap-float-label.css"/>
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet"/>
    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet"/>

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <!-- CustomCSS -->
    <link href="assets/customs/css/customstyle.css" rel="stylesheet"/>
    <!-- Sweet Alert Css -->
    <link href="assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    <style>
        .loader {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: White;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .center img {
                height: 128px;
                width: 128px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="loader" class="loader" style="display: none">
            <div class="center">
                <img alt="" src="images/cue-header.jpg" />
            </div>
        </div>
        <div class="row" style="width: 100%; display: block; margin: auto;">
            <div class="panel col-md-10 col-lg-10 col-sm-10 col-xs-12 col-md-offset-1 col-lg-offset-1 col-sm-offset-1" style="margin-top: 20px; border: 1px solid #d0dada; border-radius: 4px; padding-top: 5px; padding-bottom: 10px;">
                <div class="row" style="width: 100%; margin: 5px;">
                    <div>
                        <img src="images/cue-header.jpg" width="100%" height="100px" />
                        <h3 style="width: 100%; text-align: center;">Peer Reviewers Portal</h3>
                        <hr />
                    </div>
            <!--New Design-->
                        <%
        int step = 1;
        try
        {
            step = Convert.ToInt32(Request.QueryString["step"]);
            if (step>6||step<1)
            {
               step = 1;  
            }
        }
        catch (Exception)
        { step = 1;
        }
        if (step == 1)
        {
           %>
                  <div class="panel panel-green">
                      <div class="panel-heading">Peer Reviewer Application (General Details)
                          <span class="pull-right"><i class="fa fa-chevron-left"></i> Step 1 of 4 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
                      </div>
                        <div class="panel-body">
                                   <div runat="server" id="registerfeedback"></div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>ID No./Passport No.</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="idnumber" Placeholder="ID No./Passport No." type="text"  Style="height: 42px;" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>First Name</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="fname" Placeholder="Enter First Name" type="text"  Style="height: 42px;" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Middle Name</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="mName" Placeholder="Enter Middle Name" type="text"  Style="height: 42px;" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Last Name</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="lName" Placeholder="Enter Last Name" type="text"  Style="height: 42px;" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Phone Number</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="phonenumber" Placeholder="Enter Phone No." type="number"  Style="height: 42px;" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Email Address(Official Email Address)</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="emailaddress" Placeholder="Enter Official Email Address"  Style="height: 42px;" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="address" Placeholder="Enter Address"  Style="height: 42px;" />
                                            </div>
                                        </div>
                                          <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Postal Code</label>
                                                <asp:DropDownList CssClass="form-control" runat="server" ID="postalcode" AutoPostBack="true"  Style="height: 42px;" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Country</label>
                                                <asp:DropDownList CssClass="form-control" runat="server" ID="country" AutoPostBack="true"  Style="height: 42px;" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>City</label>
                                                <asp:DropDownList CssClass="form-control" runat="server" ID="city" AutoPostBack="true"  Style="height: 42px;" />
                                            </div>
                                        </div>
                                    </div>
                        </div>
                        <div class="panel-footer">
                           <asp:Button runat="server" CssClass="btn btn-success pull-right" ID="btn_accountcreationdata" Text="Next" OnClick="btn_accountcreation_Click" />
                            <asp:Button runat="server" CssClass="btn btn-success pull-left" ID="Button1" Text="Back To Login Page"/>
                            <span class="clearfix"></span>
                        </div>
                    </div>
                          <% 
                }else if (step==2){
                    %>
                           <div class="panel panel-green">
                             <div class="panel-heading">Add Academic Qualifications
                                 <span class="pull-right"><i class="fa fa-chevron-left"></i> Step 2 of 4 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
                             </div>
                                <div class="panel-body">
                                    <div runat="server" id="headerfeedback"></div>
                
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                             <div class="form-group">
                                                <label>Title of Qualification Obtained</label>
                                                 <asp:DropDownList runat="server" ID="ddlAcQualific" CssClass="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Country of Qualification</label>                      
                                                <asp:DropDownList runat="server" ID="ddlCountries" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"/>
                                            </div>
                                        </div> 
                                    </div>
                                     <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                             <div class="form-group">
                                                <label>Year Obtained</label>                      
                                                <asp:TextBox CssClass="form-control" runat="server" ID="yearObtained" Placeholder="Year Obtained"  TextMode="Number"/>                                   
                                            </div>
                                        </div>  
                                           <div class="col-md-6 col-lg-6">
                                             <div class="form-group">
                                                <label>Institution Name</label>                      
                                                <asp:TextBox CssClass="form-control" runat="server" ID="institution" Placeholder="Institution"  />                                  
                                            </div>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Area of Specialization</label>                      
                                                <asp:TextBox CssClass="form-control" runat="server" ID="areaOfSpecialization" Placeholder="Area of Specialization" />
                                   
                                            </div>
                                        </div>  
                                           <div class="col-md-6 col-lg-6">
                                             <div class="form-group">
                                                <label>Duration of Study (Years)</label>                      
                                                <asp:TextBox CssClass="form-control" runat="server" ID="durationOfStudy" Placeholder="Duration of Study e.g 4"  TextMode="Number"/>                                  
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                       <div runat="server" id="selectedCountry">
                                           <div class="col-md-6 col-lg-6">
                                               <div class="form-group">
                                                   <strong>Evidence of Recognition</strong>
                                                   <asp:FileUpload runat="server" ID="uploadrecognition" CssClass="form-control" style="padding-top: 0px;"/>
                                               </div>
                                           </div>
                                       </div>
                                    </div>
                                    <div class="row">
                                        <center>
                                            <asp:Button runat="server" CssClass="btn btn-success" Text="Add Qualification" ID="addPeerQualification" CausesValidation="False" OnClick="addPeerQualification_Click"/>
                                        </center>
                                    </div>
                                </div>

                               <div class="panel panel-green">
                                    <div class="panel-heading">Added Academic Qualifications</div>
                                    <div class="panel-body">
                                          <table class="table table-bordered table-striped" id="dataTables-example">
                                              <thead>
                                              <tr>
                                                  <th>Title of Qualification Obtained</th>
                                                  <%--<th>Country of Qualification</th>--%>
                                                  <th>Year Obtained</th>
                                                  <th>Area of Specialization</th>
                                                  <th>Institution Name</th>
                                                  <th>Duration of Study</th>
                                                  <th>Edit</th>
                                                  <th>Delete</th>
                                              </tr>
                                              </thead>
                                              <tbody>
                                              <%
                                                  string ApplicationNo = Request.QueryString["ApplicationNo"];
                                                  var qualifications = Config.ReturnNav().AcademicQualifications.Where(r => r.Peer_Reviewer_Code == ApplicationNo);
                                                  foreach (var qualification in qualifications)
                                                  {
                                                     %>
                                                       <tr>
                                                           <td><%=qualification.Qualification_Description %></td>
                                                           <td><%=qualification.Date_Obtained %></td>
                                                           <td><%=qualification.Area_of_Specialization %></td>
                                                           <td><%=qualification.Institution_Obtained %></td>
                                                           <td><%=qualification.Duration_of_Study %></td>
                                                           <td><label class='btn btn-success' onclick="editAcademicQualifications('<%=qualification.Code%>','<%=qualification.Qualification_Description%>','<%=qualification.Date_Obtained %>','<%=qualification.Institution_Obtained%>','<%=qualification.Area_of_Specialization%>','<%=qualification.Duration_of_Study %>')"><i class='fa fa-edit'></i> Edit</label></td>
                                                           <td><label class='btn btn-danger' onclick="deleteAcademicQualifications('<%=qualification.Code %>')"><i class='fa fa-trash'></i> Delete</label></td>
                                                       </tr>   
                                                  <% 
                                                  } %>
                                              </tbody>
                                          </table>
                                        
                                    </div>
                                   
                                </div>
                                <div class="panel-footer">
                                   <asp:Button runat="server" CssClass="btn btn-success pull-right" ID="nexttopage3" Text="Next" OnClick="nexttopage3_Click" />
                                    <asp:Button runat="server" CssClass="btn btn-success pull-left" ID="previoustopage1" Text="Previous" OnClick="previoustopage1_Click" />
                                    <span class="clearfix"></span>
                                </div>                           
                         </div>

                   <% 
                }else if (step==3){
                    %>
                            <div class="panel panel-green">
                                    <div class="panel-heading">Add Employment Record </div>
                                    <div class="panel-body">
                                        <div runat="server" id="recordfeedback"></div>
                                            <div class="col-md-6 col-lg-6">
                                                 <div class="form-group">
                                                    <label>Employer Name</label>                      
                                                    <asp:TextBox CssClass="form-control" runat="server" ID="employer" Placeholder="Please Enter Employer Name"  />                                
                                                  </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                 <div class="form-group">
                                                    <label>Employer Official Email Address</label>                      
                                                    <asp:TextBox CssClass="form-control" runat="server" ID="employeremail" Placeholder="Please Enter Employer Official Email Address"  />                                
                                                  </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                 <div class="form-group">
                                                    <label>Job Position</label>                      
                                                    <asp:TextBox CssClass="form-control" runat="server" ID="postion" Placeholder="Please Enter Job Position"  />                                 
                                                  </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                 <div class="form-group">
                                                    <label>Employment Start Date</label>                      
                                                    <asp:TextBox CssClass="form-control" runat="server" ID="dateTo" Placeholder="Date From"  />                                   
                                                  </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                 <div class="form-group">
                                                    <label>Employment End Date</label>                      
                                                    <asp:TextBox CssClass="form-control" runat="server" ID="dateFrom" Placeholder="Date To"/>                                  
                                                  </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                 <div class="form-group">
                                                    <label>Current Place? (If current place, select 'YES'</label>                      
                                                    <asp:DropDownList CssClass="form-control" runat="server" ID="currentplace"> 
                                                        <asp:ListItem>--Select--</asp:ListItem> 
                                                        <asp:ListItem>YES</asp:ListItem>
                                                        <asp:ListItem>No</asp:ListItem>
                                                    </asp:DropDownList>                                
                                                  </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                 <div class="form-group">
                                                    <label>Years Worked</label>                      
                                                    <asp:TextBox CssClass="form-control" runat="server" type="number" ID="yearsworked" Placeholder="Please Enter Number of Years"  />                                  
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6">
                                                 <div class="form-group">
                                                    <label>Contact Person (Full Names)</label>                      
                                                    <asp:TextBox CssClass="form-control" runat="server" ID="contactPerson" Placeholder="Contact Person Full Name"  />                                  
                                                </div>
                                            </div>              
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Address</label>                      
                                                <asp:TextBox CssClass="form-control" runat="server" ID="txtAddress" Placeholder="Please Enter address"  />
                                            </div>
                                        </div>
                
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Email</label>                      
                                                <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail" Placeholder="Contact Person Email address" TextMode="Email"  />
                                            </div>
                                        </div>
                
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Telephone</label>                      
                                                <asp:TextBox CssClass="form-control" runat="server" ID="txtPhonenumber" Placeholder="Contact Person Phone number" TextMode="Phone"  />
                                            </div>
                                        </div>

                
                                    </div>
                                        <br />                                        
                                        <div class="row">
                                            <center>
                                                 <asp:Button runat="server" CssClass="btn btn-success" Text="Add Employment Record" ID="addRecord" OnClick="addRecord_Click"/>
                                            </center>
                                        </div>
                                <br />                               
                                   <div class="panel panel-green">
                                     <div class="panel-heading">Added Empoyment Record</div>
                                        <div class="panel-body">
                                          <table class="table table-bordered table-striped" id="dataTables-example2">
                                              <thead>
                                              <tr>
                                                  <th>Employer</th>
                                                  <th>Postion</th>
                                                  <th>Date From</th>
                                                  <th>Date To</th>
                                                  <th>Contact Person</th>
                                                  <th>Edit</th>
                                                  <th>Remove</th>
                                              </tr>
                                              </thead>
                                               <tbody>
                                              <%
                                                  string ApplicationNo = Request.QueryString["ApplicationNo"];
                                                  var records = Config.ReturnNav().PeerReviewersEmployment.Where(r => r.Peer_Reviewer_Code == ApplicationNo);
                                                  foreach (var record in records)
                                                  {
                                                       String tDateFrom = Convert.ToDateTime(record.Date_From).ToString("MM-dd-yyyy");
                                                               tDateFrom = tDateFrom.Replace("-", "/").Trim();
                                                               String tDateTo = Convert.ToDateTime(record.Date_To).ToString("MM-dd-yyyy");
                                                               tDateTo = tDateTo.Replace("-", "/").Trim();
                                                     %>
                                                       <tr>
                                                           <td><%=record.Employer_Name %></td>
                                                           <td><%=record.Position_Held %></td>
                                                           <td><%=tDateFrom %></td>
                                                           <td><%=tDateTo %></td>
                                                           <td><%=record.Contact_Person %></td>
                           
                                                           <td><label class='btn btn-success' onclick="editEmploymentRecord('<%=record.Code %>','<%=record.Employer_Name %>','<%=record.Position_Held %>','<%=tDateFrom %>','<%=tDateTo%>','<%=record.Contact_Person %>')"><i class='fa fa-edit'></i> Edit</label></td>
                                                           <td><label class='btn btn-danger' onclick="deleteEmploymentRecord('<%=record.Employer_Name %>','<%=record.Position_Held %>','<%=record.Code %>')"><i class='fa fa-trash'></i> Delete</label></td>
                                                       </tr>   
                                                  <% 
                                                  } %>
                                              </tbody>
                                          </table>
                                    </div>
                                </div>
                                 <div class="panel-footer">
                                   <asp:Button runat="server" CssClass="btn btn-success pull-right" ID="nexttopage4" Text="Next" OnClick="nexttopage4_Click" />
                                    <asp:Button runat="server" CssClass="btn btn-success pull-left" ID="previoustopage2" Text="Previous" OnClick="previoustopage2_Click" />
                                    <span class="clearfix"></span>
                                </div>
                            </div>
                     <% 
                }else if (step==4){
                    %>
                            <div class="panel panel-green">
                              <div class="panel-heading">Mandatory Documents</div>
                                <div class="panel-body">
                                    <div runat="server" id="documentsfeedback"></div>
                                      <div class="row">
                                       <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                           <div class="form-group">
                                               <strong>Curiculum Vitae</strong>
                                               <asp:FileUpload runat="server" ID="cv" CssClass="form-control" style="padding-top: 0px;"/>
                                           </div>
                                       </div>
                                       <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                           <div class="form-group">
                                               <strong>KRA Certificate</strong>
                                               <asp:FileUpload runat="server" ID="kra" CssClass="form-control" style="padding-top: 0px;"/>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="row">
                                       <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                           <div class="form-group">
                                               <strong>HELB Clearance</strong>
                                               <asp:FileUpload runat="server" ID="helb" CssClass="form-control" style="padding-top: 0px;"/>
                                           </div>
                                       </div>
                                       <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                           <div class="form-group">
                                               <strong>CID Clearance</strong>
                                               <asp:FileUpload runat="server" ID="cid" CssClass="form-control" style="padding-top: 0px;"/>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="row">
                                       <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                           <div class="form-group">
                                               <strong>EACC Clearance</strong>
                                               <asp:FileUpload runat="server" ID="eacc" CssClass="form-control" style="padding-top: 0px;"/>
                                           </div>
                                       </div>
                                       <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                           <div class="form-group">
                                               <strong>CRB Clearance</strong>
                                               <asp:FileUpload runat="server" ID="crb" CssClass="form-control" style="padding-top: 0px;"/>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="row">
                                       <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                           <div class="form-group">
                                               <strong>Professional Body</strong>
                                               <asp:FileUpload runat="server" ID="professionalbody" CssClass="form-control" style="padding-top: 0px;"/>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="row">
                                       <center>
                                          <asp:Button runat="server" CssClass="btn btn-success" Text="Upload Attached Documents" ID="submitapplication" OnClick="submitapplication_Click"/>
                                       </center>                                     
                                    </div>
                                </div>
                                <div class="panel-footer">
                                   <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Submit Application To CUE" ID="submitapplicationdata" OnClick="submitapplicationdata_Click"/>
                                    <asp:Button runat="server" CssClass="btn btn-success pull-left" ID="previoustopage3" Text="Previous" OnClick="previoustopage3_Click" />
                                    <span class="clearfix"></span>
                                </div>                                
                            </div>
                    <%
                    }
                     %>
                                
                <!--new design-->
                    <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
                        <hr />
                        Copyright  &copy; <%: DateTime.Now.Year %>  Terms and Conditions Apply | <a href="http://www.cue.or.ke/">Commission for University Education</a>
                    </div>
                </div>
                <div>
                </div>
            </div>
        </div>
   
<div id="deleteAcademicQualifciationsModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Confirm Deleting Academic Qualifications</h4>
              </div>
              <div class="modal-body">
                <p>Are you sure you want to delete the Academic Qualificationt <strong id="qualifications"></strong>?</p>
                  <asp:TextBox runat="server" ID="deletequalificationsCode" type="hidden"/>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                  <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete Record" ID="deletequailificationRecord" OnClick="deleteQualification_Click" />
              </div>
        </div>

      </div>
    </div>
<div id="editQualificationsModal" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Academic Qualifciations</h4>
              </div>
              <div class="modal-body">
                  <asp:TextBox runat="server" ID="editcode" type="hidden"/>
                  <div class="row">
                  <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Qualifications Description:</label>                      
                             <asp:DropDownList CssClass="form-control" runat="server" ID="editdesc" Placeholder="Qualifications"> 
                                 <asp:ListItem>Bachelors</asp:ListItem>
                                 <asp:ListItem>Masters</asp:ListItem>
                                 <asp:ListItem>Doctorate</asp:ListItem>
                                 <asp:ListItem>Postgraduate</asp:ListItem>
                                 <asp:ListItem>Diploma</asp:ListItem>
                                 <asp:ListItem>Certificate</asp:ListItem>
                             </asp:DropDownList>                               
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Year Obtained:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="editdateobtained" Placeholder="Date From"  />                                  
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Institution:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="editinstitution" Placeholder="Institution"  />                                 
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Area of Specialization:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="editareaofspecialization" Placeholder="Area of Specialization"  />                                 
                        </div>
                    </div>
                      <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Duration of Study:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="editduration" Placeholder="Duration of Stud"  />                                
                        </div>
                    </div>
                  </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                  <asp:Button runat="server" CssClass="btn btn-success" Text="Save Changes" ID="editqualificants" OnClick="editQualifications_Click" />
              </div>
        </div>

      </div>
    </div>

  <div id="deleteEmployementRecordModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Confirm Deleting Employment Record</h4>
              </div>
              <div class="modal-body">
                <p>Are you sure you want to delete the employmnt record at <strong id="employmentEmployer"></strong> in the position of <strong id="employmentPosition"></strong>?</p>
                  <asp:TextBox runat="server" ID="deleteEmploymentRecordCode" type="hidden"/>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                  <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete Record" ID="deleteEmploymentRecord" OnClick="deleteEmploymentRecord_Click" />
              </div>
        </div>

      </div>
    </div>
    
    <div id="editEmployementRecordModal" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Employment Record</h4>
              </div>
              <div class="modal-body">
                  <asp:TextBox runat="server" ID="editEmploymentRecordCode" type="hidden"/>
                  <div class="row">
                  <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Employer:</label>                      
                             <asp:TextBox CssClass="form-control" runat="server" ID="editEmployer" Placeholder="Employer"  />                                
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Position:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="editPosition" Placeholder="Position"  />                                  
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Date From:</label>                      
                            <asp:TextBox CssClass="form-control bootstrapdatepicker" runat="server" ID="editDateFrom" Placeholder="Date From"  />                           
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Date To:</label>                      
                            <asp:TextBox CssClass="form-control bootstrapdatepicker" runat="server" ID="editDateTo" Placeholder="Date To"/>                                 
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Contact Person:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="editContact" Placeholder="Contact Person"  />                                  
                        </div>
                    </div>
                  </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                  <asp:Button runat="server" CssClass="btn btn-success" Text="Save Changes" ID="editEmploymentRecord" OnClick="editEmploymentRecord_Click" />
              </div>
        </div>

      </div>
    </div>

   <script>
         function deleteAcademicQualifications(recordcode) {
             document.getElementById("qualifications").innerText = recordcode;
             document.getElementById("MainContent_deletequalificationsCode").value = recordcode;
            $("#deleteAcademicQualifciationsModal").modal();
        }
         function editAcademicQualifications(code, description, yearobtained, institution, area, duration) {
             document.getElementById("MainContent_editcode").value = code;
             document.getElementById("MainContent_editdesc").value = description;
             document.getElementById("MainContent_editdateobtained").value = yearobtained;
             document.getElementById("MainContent_editinstitution").value = institution;
             document.getElementById("MainContent_editareaofspecialization").value = area;
             document.getElementById("MainContent_editduration").value = duration;
            //     
             $("#editQualificationsModal").modal();
        }

        function deleteEmploymentRecord(employer,position,record) {
            document.getElementById("employmentEmployer").innerText = employer;
            document.getElementById("employmentPosition").innerText = position;
            document.getElementById("MainContent_deleteEmploymentRecordCode").value = record;
            $("#deleteEmployementRecordModal").modal();
        }
        function editEmploymentRecord(recordCode,employer,position,dateFrom,dateTo,contact) {
            document.getElementById("MainContent_editEmploymentRecordCode").value = recordCode;
            document.getElementById("MainContent_editEmployer").value = employer;
            document.getElementById("MainContent_editPosition").value = position;
            document.getElementById("MainContent_editDateFrom").value = dateFrom;
            document.getElementById("MainContent_editDateTo").value = dateTo;
            document.getElementById("MainContent_editContact").value = contact;
            //     
            $("#editEmployementRecordModal").modal();
        }
    </script>

    <script>
         $(document).ready(function () {
            $("#<%= dateFrom.ClientID %>").datepicker({ dateFormat: "dd/mm/yy" }).val();
        });
            $(document).ready(function () {
            $("#<%= dateTo.ClientID %>").datepicker({ dateFormat: "dd/mm/yy" }).val();
        });
    </script>

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

