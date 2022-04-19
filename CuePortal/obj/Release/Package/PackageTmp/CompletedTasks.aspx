<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompletedTasks.aspx.cs" Inherits="CicPortal.CompletedTasks" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
<div class="row" style="margin: 10px;">
        <div class="panel panel-green">
        <div class="panel-heading">Completed Tasks</div>
        <div class="panel-body">
        <table class="table table-bordered table-striped" id="dataTables-example">
            <thead>
            <tr>
                <th>Work Order Code</th>
                <th>Work Order Description</th>
                <th>Task Description</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>View</th>
            </tr>
            </thead>
            <tbody>
            <%
                var projects = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.ApprovalStatus == "Completed" && r.Confirmed == true );
                foreach (var project in projects)
                {
                    %>
                <tr>
                    <td><%=project.Job_No %></td>
                    <td><%=project.Job_Name %></td>
                    <td><%=project.Job_Task_Description %></td>
                    <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                    <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                   <td> <label class="btn btn-success" onclick="addcomments('<%=project.Job_No %>','<%=project.Job_Name %>', '<%=project.Job_Task_Description %>', '<%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %>', '<%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %>' )">View Details</label></td>
                </tr>
                <%                     
                } 
                    %>
            </tbody>
        </table>

        </div>
    </div>
</div>

<script>
    function addcomments(workordercode, workorderdescription,taskdescription,startdate,enddate) {
        document.getElementById("MainContent_workordercode").value = workordercode;
        document.getElementById("MainContent_workorderdesc").value = workorderdescription;
        document.getElementById("MainContent_taskdescription").value = taskdescription;
        document.getElementById("MainContent_startdate").value = startdate;
        document.getElementById("MainContent_enddate").value = enddate;
    $("#addcommentsModal").modal();
   }
</script>


<div id="addcommentsModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
          <div runat="server" id="commentfeedback"></div>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">More Details</h4>
      </div>
        <div class="modal-body"> 
         <div class="form-group">
            <strong>Work Order Code:</strong>
            <asp:TextBox runat="server" CssClass="form-control" ID="workordercode" ReadOnly/>
        </div> 
        <div class="form-group">
            <strong>Work Order Description:</strong>
            <asp:TextBox runat="server" CssClass="form-control" ID="workorderdesc" ReadOnly/>
        </div> 
        <div class="form-group">
            <strong>Task Description:</strong>
            <asp:TextBox runat="server" CssClass="form-control" ID="taskdescription" ReadOnly/>
        </div> 
        <div class="form-group">
            <strong>Start Date:</strong>
            <asp:TextBox runat="server" CssClass="form-control" ID="startdate" ReadOnly/>
        </div> 
        <div class="form-group">
            <strong>End Date:</strong>
            <asp:TextBox runat="server" CssClass="form-control" ID="enddate" ReadOnly/>
        </div>
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
