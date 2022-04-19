<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="CicPortal.Jobs" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">All Assignments Pending Confirmation</li>
            </ol>
        </div>
    </div>
<div class="row" style="margin: 10px;">
    <div runat="server" id="feedback"></div>
               <div class="row" style="margin: 10px;">
                   <div class="panel panel-green">
                    <div class="panel-heading">Programme Accreditation Assignments Pending Confirmation</div>
                    <div class="panel-body">
                  <table class="table table-bordered table-striped dataTable1" id="dataTables-example1">
                      <thead>
                      <tr>
                          <th>Assignment Code</th>
                          <th>Assignment Description</th>
                          <th>Task</th>
                          <th>Start Date</th>
                          <th>End Date</th>
                          <th>View</th>
                      </tr>
                      </thead>
                      <tbody>
                      <%
                          var projects = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.ApprovalStatus == "Approved" && r.Confirmed == false && r.Job_Rejected == false && r.Project_Type == "Programme Accreditation");
                          foreach (var project in projects)
                          {
                               %>
                          <tr>
                              <td><%=project.Job_No %></td>
                              <td><%=project.Job_Name %></td>
                              <td><%=project.Job_Task_Description %></td>
                              <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                              <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                              <td><a href="Job.aspx?id=<%=project.Code %>&&prjcode=<%=project.Job_No %>&&projectType=<%=project.Project_Type %>"><label class="btn btn-success">View Details</label></a></td>
                          </tr>
                          <%                     
                          } 
                              %>
                      </tbody>
                  </table>

                    </div>
                </div>
            </div>
               <div class="row" style="margin: 10px;">
                   <div class="panel panel-green">
                    <div class="panel-heading">Instiution Accreditation Assignment Pending Confirmation</div>
                    <div class="panel-body">
                  <table class="table table-bordered table-striped dataTable1" id="dataTables-example2">
                      <thead>
                      <tr>
                          <th>Assignment Code</th>
                          <th>Assignment Description</th>
                          <th>Task</th>
                          <th>Start Date</th>
                          <th>End Date</th>
                          <th>View</th>
                      </tr>
                      </thead>
                      <tbody>
                      <%
                          var projects1 = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.Project_Type == "Instiution Accreditation" && r.ApprovalStatus == "Approved" && r.Confirmed == false && r.Job_Rejected == false);
                          foreach (var project in projects1)
                          {
                               %>
                          <tr>
                              <td><%=project.Job_No %></td>
                              <td><%=project.Job_Name %></td>
                              <td><%=project.Job_Task_Description %></td>
                              <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                              <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                              <td><a href="Job.aspx?id=<%=project.Code %>&&prjcode=<%=project.Job_No %>&&projectType=<%=project.Project_Type %>"><label class="btn btn-success">View Details</label></a></td>
                          </tr>
                          <%                     
                          } 
                              %>
                      </tbody>
                  </table>

                    </div>
                </div>
            </div>
               <div class="row" style="margin: 10px;">
                   <div class="panel panel-green">
                    <div class="panel-heading">Programme Quality Audit Assignment Pending Confirmation</div>
                    <div class="panel-body">
                  <table class="table table-bordered table-striped dataTable1" id="dataTables-example3">
                      <thead>
                      <tr>
                          <th>Assignment Code</th>
                          <th>Assignment Description</th>
                          <th>Task</th>
                          <th>Start Date</th>
                          <th>End Date</th>
                          <th>View</th>
                      </tr>
                      </thead>
                      <tbody>
                      <%
                          var projects2 = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.Project_Type == "Programme Quality Audit" && r.ApprovalStatus == "Approved" && r.Confirmed == false && r.Job_Rejected == false);
                          foreach (var project in projects2)
                          {
                               %>
                          <tr>
                              <td><%=project.Job_No %></td>
                              <td><%=project.Job_Name %></td>
                              <td><%=project.Job_Task_Description %></td>
                              <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                              <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                              <td><a href="Job.aspx?id=<%=project.Code %>&&prjcode=<%=project.Job_No %>&&projectType=<%=project.Project_Type %>"><label class="btn btn-success">View Details</label></a></td>
                          </tr>
                          <%                     
                          } 
                              %>
                      </tbody>
                  </table>

                    </div>
                </div>
            </div>
    <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div class="panel-heading">Institution Quality Audit Assignment Pending Confirmation</div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1" id="dataTables-example4">
                    <thead>
                        <tr>
                            <th>Assignment Code</th>
                            <th>Assignment Description</th>
                            <th>Task</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>View</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var projects3 = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.Project_Type == "Institution Quality Audit" && r.ApprovalStatus == "Approved" && r.Confirmed == false && r.Job_Rejected == false);
                            foreach (var project in projects3)
                            {
                        %>
                        <tr>
                            <td><%=project.Job_No %></td>
                            <td><%=project.Job_Name %></td>
                            <td><%=project.Job_Task_Description %></td>
                            <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                            <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                            <td><a href="Job.aspx?id=<%=project.Code %>&&prjcode=<%=project.Job_No %>&&projectType=<%=project.Project_Type %>">
                                <label class="btn btn-success">View Details</label></a></td>
                        </tr>
                        <%                     
                            }
                        %>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
        <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div class="panel-heading">Institution Collaboration Curriculum Document Review</div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1" id="dataTables-example6">
                    <thead>
                        <tr>
                            <th>Assignment Code</th>
                            <th>Assignment Description</th>
                            <th>Task</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>View</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            string accountNo = Convert.ToString(Session["PeerCode"]);
                            var projects4 = Config.ReturnNav().collabResourceAllocation.Where(r => r.Account_No == accountNo && r.Project_Type == "Curriculum Document Review" && r.Status == "Approved" && r.Confirmed == false && r.Job_Rejected == false).ToList();
                            foreach (var project in projects4)
                            {
                        %>
                        <tr>
                            <td><%=project.Job_No %></td>
                            <td><%=project.Project_Type %></td>
                            <td><%=project.Job_Task_Description %></td>
                            <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                            <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                            <td><a href="Job.aspx?id=<%=project.Code %>&&prjcode=<%=project.Job_No %>&&projectType=<%=project.Project_Type %>">
                                <label class="btn btn-success">View Details</label></a></td>
                        </tr>
                        <%                     
                            }
                        %>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div class="panel-heading">Institution Collaboration Verification of Academic Resources</div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1" id="dataTables-example5">
                    <thead>
                        <tr>
                            <th>Assignment Code</th>
                            <th>Assignment Description</th>
                            <th>Task</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>View</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var projects5 = Config.ReturnNav().collabResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.Project_Type == "Verification of Academic Resources" && r.Status == "Approved" && r.Confirmed == false && r.Job_Rejected == false).ToList();
                            foreach (var project in projects5)
                            {
                        %>
                        <tr>
                            <td><%=project.Job_No %></td>
                            <td><%=project.Project_Type %></td>
                            <td><%=project.Job_Task_Description %></td>
                            <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                            <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                            <td><a href="Job.aspx?id=<%=project.Code %>&&prjcode=<%=project.Job_No %>&&projectType=<%=project.Project_Type %>">
                                <label class="btn btn-success">View Details</label></a></td>
                        </tr>
                        <%                     
                            }
                        %>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
 <!--ORIGINAL-->
      <script>
          $(document).ready(function () {
             $('#dataTables-example').DataTable({
                 responsive: true
             });
             $('.dataTable1').DataTable({
                 responsive: true
             });
         });
     </script>
 </asp:Content>
