<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CicPortal.Dashboard" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Commission For Universities Education - Peer Reviewers Portal</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </div>
    </div>
     <%
        var nav = Config.ReturnNav();
      %><div class="row">
        <div runat="server" id="feedback"></div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                        <%
                                            
                                 int current = nav.ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.ApprovalStatus == "Approved" && r.Confirmed == false && r.Job_Rejected == false).ToList().Count;
                                             %>
                                        <% =current %>
                                    </div>
                                    <div>Tasks Pending Confirmation</div>
                                </div>
                            </div>
                        </div>
                        <a href="Jobs.aspx?status=Approved">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-history fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                        <%
                                            int past = nav.ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.ApprovalStatus=="Approved" && r.Confirmed==true && r.Appoint==true).ToList().Count;
                                            %>
                                        <% =past %>
                                    </div>
                                    <div>Ongoing Tasks</div>
                                </div>
                            </div>
                        </div>
                        <a href="ActiveJobs.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                        <% int payments = nav.ProgrammeEvaluationHeader.Where(r => r.Resource_No == Convert.ToString(Session["PeerCode"]) && r.Status == "Pending Approval").ToList().Count; %>
                                        <% =payments %>
                                    </div>
                                    <div>Submitted Tasks</div>
                                </div>
                            </div>
                        </div>
                        <a href="SubmittedTasks.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-building fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                      <%  int employement = nav.PeerReviewersEmployment.Where(r => r.Peer_Reviewer_Code == Convert.ToString(Session["PeerCode"])).ToList().Count; %>
                                        <%=employement %>
                                    </div>
                                    <div>Approved Claims</div>
                                </div>
                            </div>
                        </div>
                        <a href="Payment.aspx">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
     <%
    var profiles = nav.Vendor.Where(r => r.No == Convert.ToString(Session["PeerCode"]));
    foreach (var profile in profiles)
    {
    %>
     <div class="row">
          <div runat="server" id="registerfeedback"></div>
         <div class="col-md-11 col-lg-11 col-sm-11 col-xs-11">
         <div class="panel panel-green">
             <div class="panel-heading">
                Peer Reviwer Profile
             </div>
             <div class="panel-body">
                 <table class="table table-bordered table-striped">
                   <%--  <tr><td><strong>Title:</strong></td><td><%=profile.Title %></td></tr>--%>
                     <tr><td><strong>Name:</strong></td><td><%=profile.Name %></td></tr>
                     <tr><td><strong>Email Address:</strong></td><td><%=profile.E_Mail%></td></tr>
                     <tr><td><strong>Phone Number:</strong></td><td><%=profile.Phone_No %></td></tr>
                    <%-- <tr><td><strong>Highest Academic Qualification:</strong></td><td><%=profile.Highest_Academic_Qualification %></td></tr>      --%>               
                 </table>
             </div>
             </div>
          </div>
     </div>    
          <%     
            }
          %>
  
  <div id="universityDetails" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit Peer Reviwer Profile</h4>
         
      </div>
      <div class="modal-body">
          <div class="row">
          <div class="form-group col-lg-6 col-md-6">
              <strong>Name:</strong><br/>
              <asp:TextBox runat="server" CssClass="form-control" ID="editname"/>
          </div>
        <div class="form-group col-lg-6 col-md-6">
            <strong>E-Mail Address:</strong>
            <asp:TextBox runat="server" CssClass="form-control" ID="editEmail"/>
        </div>
          <div class="form-group col-lg-6 col-md-6">
              <strong>Postal Code:</strong>
               <asp:DropDownList runat="server" CssClass="form-control" ID="editpostcodes"/>
          </div>
          <div class="form-group col-lg-6 col-md-6">
              <strong>Phone Number:</strong>
               <asp:TextBox runat="server" CssClass="form-control" ID="editPhone"  MaxLength="10" />        
          </div>
          <div class="form-group col-lg-6 col-md-6">
              <strong>Address:</strong>
               <asp:TextBox runat="server" CssClass="form-control" ID="editaddress"/>
          </div> 
<%--            <div class="form-group col-lg-6 col-md-6">
              <strong>County</strong>
               <asp:DropDownList runat="server" CssClass="form-control" ID="mainCampusCounty"/>
          </div>--%>
<%--          <div class="form-group col-lg-6 col-md-6">
              <strong>Constituency:</strong>
              <asp:DropDownList runat="server" CssClass="form-control" ID="mainCampusConstituency"  />
          </div>--%>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <asp:Button runat="server" Text="Save Changes" CssClass="btn btn-success" ID="editGeneralDetails" OnClick="editGeneralDetails_Click"/>
      </div>
    </div>

  </div>
</div>
       <%--<div id="vcDetails" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit Vice Chancellor Details</h4>
      </div>
      <div class="modal-body">
          <div class="row">
         
        <div class="form-group col-lg-6 col-md-6">
            <strong>Vice Chancellor Name:</strong>
            <asp:TextBox runat="server" CssClass="form-control" ID="vcName"/>
        </div> 
              <div class="form-group col-lg-6 col-md-6">
            <strong>Vice Chancellor Highest Academic Qualification:</strong>
            <asp:DropDownList runat="server" CssClass="form-control" ID="vcHighestAcademicLevel"/>
        </div>
          <div class="form-group col-lg-6 col-md-6">
              <strong>Vice Chancellor Domain of Specialization:</strong> 
               <asp:DropDownList runat="server" CssClass="form-control" ID="vcDomainOfSpecialization"/>
          </div>
          <div class="form-group col-lg-6 col-md-6">
              <strong>Vice Chancellor Official Email Address:</strong>
               <asp:TextBox runat="server" CssClass="form-control" ID="vcOfficialEmail"/>
          </div>
          <div class="form-group col-lg-6 col-md-6">
              <strong>Vice Chancellor Official Phone Number:</strong>
               <asp:TextBox runat="server" CssClass="form-control" ID="vcOfficialPhone"/>
          </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <asp:Button runat="server" Text="Save Changes" CssClass="btn btn-success" ID="editVcDetails" OnClick="editVcDetails_Click"/>
      </div>
    </div>--%>

  <script type="text/javascript">
  </script>
 </asp:Content>

