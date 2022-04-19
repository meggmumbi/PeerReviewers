<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Job.aspx.cs" Inherits="CicPortal.Job" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Accept/Decline Assignment</li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin: 10px;">
         <div runat="server" id="feedback"></div>
           <div class="panel panel-green">
            <div class="panel-heading">Assignment Details</div>
            <div class="panel-body">
               
            <%
                int id = 0;
                bool accepted = false;
                try
                {
                    id = Convert.ToInt32(Request.QueryString["id"]);
                }
                catch (Exception)
                {
                    id = 0;
                }
                var projects = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"])&&r.Code==id&&r.ApprovalStatus=="Approved");
                foreach (var project in projects)
                {
                    //check if the peer reviewer has reviewed
                    accepted = Convert.ToBoolean(project.Job_Accepted);
                    if (!accepted)
                    {
                    %>
                <div class="alert alert-info">
                    <strong>You have not accepted this Assignment. Would you like to accept or decline the Assignment?</strong>
                    <hr/>
                    <label class="btn btn-success pull-right" style="margin-left: 20px;" data-toggle="modal" data-target="#acceptModal">Accept</label>
                    <label class="btn btn-danger pull-right"  data-toggle="modal" data-target="#rejectModal">Decline</label>
                    <div class="clearfix"></div>
                </div>
                <%}%>
                  <table class="table table-bordered table-striped" id="dataTables-example">              
                      <tr><td><strong>Assignment No:</strong></td><td><% =project.Job_No %></td></tr>
                      <tr><td><strong>Assignment Description:</strong></td><td><% =project.Job_Name %></td></tr>
                      <tr><td><strong>Task:</strong></td><td><% =project.Job_Task_Description %></td></tr>                     
                      <tr><td><strong> Start Date:</strong></td><td><% =project.Start_Date %></td></tr>                     
                  </table>
             <% } %>
            </div>
     </div>
</div>
 <div id="acceptModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">No Conflict of Interest</h4>
      </div>
      <div class="modal-body">
        <p>By Accepting, I declare that,</p>
          <p>
             <ul>
<%--                      <% var nav = Config.ReturnNav();
                          var conflicts = nav.ConflictOfInterest;
                          foreach (var conflict in conflicts)
                      
                          {%>
                      <li><%=conflict.Item_Description %></li>
                      <%} %>--%>
                 <% 
                     string AppNo = Request.QueryString["prjcode"];
                     var nav = Config.ReturnNav();
                     var myjob = nav.job.Where(x=> x.No == AppNo);
                     foreach (var type in myjob)
                     {                      
                         AppNo = Convert.ToString(type.No);
                         if(type.Project_Type == "Accreditation")
                         {
                             var conflicts = nav.ConflictOfInterest.Where(x=> x.Type=="Accreditation").ToList();
                             foreach (var conflict in conflicts)
                             {%>
                                <li><%=conflict.Item_Description %></li>
                             <%}
                         }
                        else if(type.Project_Type == "Quality Audit")
                        {
                             var conflicts = nav.ConflictOfInterest.Where(x=> x.Type=="Quality Audit").ToList();
                             foreach (var conflict in conflicts)
                             {%>
                                <li><%=conflict.Item_Description %></li>
                             <%}
                         }

                    }
                 %>
              </ul>
          </p>
          <p><b>DECLARATION</b></p>
            <p>
                <ul>
                    <li>I DO NOT PERCEIVE risk of conflict of interest or serious appearance of such conflict in my involvement in this assessment</li>
                </ul>
            </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <asp:Button runat="server" CssClass="btn btn-success" Text="Accept" ID="acceptJob" OnClick="acceptJob_Click" CausesValidation="false"/>
      </div>
    </div>

  </div>
</div>
<div id="rejectModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Conflict of Interest</h4>
      </div>
      <div class="modal-body">
                <p>By Declining, I declare that,</p>
          <p>
             <ul>
<%--                      <% var nav = Config.ReturnNav();
                          var conflicts = nav.ConflictOfInterest;
                          foreach (var conflict in conflicts)
                      
                          {%>
                      <li><%=conflict.Item_Description %></li>
                      <%} %>--%>
                 <% 
                     string AppNo1 = Request.QueryString["prjcode"];
                     var nav1 = Config.ReturnNav();
                     var myjob1 = nav1.job.Where(x=> x.No == AppNo1);
                     foreach (var type in myjob1)
                     {                      
                         AppNo1 = Convert.ToString(type.No);
                         if(type.Project_Type == "Accreditation1")
                         {
                             var conflicts = nav.ConflictOfInterest.Where(x=> x.Type=="Accreditation").ToList();
                             foreach (var conflict in conflicts)
                             {%>
                                <li><%=conflict.Item_Description %></li>
                             <%}
                         }
                        else if(type.Project_Type == "Quality Audit1")
                        {
                             var conflicts = nav.ConflictOfInterest.Where(x=> x.Type=="Quality Audit").ToList();
                             foreach (var conflict in conflicts)
                             {%>
                                <li><%=conflict.Item_Description %></li>
                             <%}
                         }

                    }
                 %>
              </ul>
          </p>
          <p><b>DECLARATION</b></p>
            <p>
                <ul>
                    <li>I DO PERCEIVE risk of conflict of interest or serious appearance of such conflict in my involvement in this assessment</li>
                </ul>
            </p>
        <p><Strong>Are you sure you want to decline this Assignment?</Strong></p>
        <div class="row">
            <div class="col-md-6 col-lg-6">
               <div class="form-group">
                    <label>Kindly give a reason for declining the Assignment</label>                      
                    <asp:TextBox CssClass="form-control" runat="server" ID="editRejection" Placeholder="Reason For Declining Workorder" /> 
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="editRejection" ErrorMessage="Please enter reason for declining this Assignment, it cannot be empty!" ForeColor="Red" />                               
                </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <asp:Button runat="server" CssClass="btn btn-danger" Text="Decline" ID="rejectJob" OnClick="rejectJob_Click"/>
      </div>
    </div>

  </div>
</div>
<script>
$(document).ready(function() {
    $('#dataTables-example').DataTable({
        responsive: true
    });
});
</script>

</asp:Content>
