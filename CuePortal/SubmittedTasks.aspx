<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmittedTasks.aspx.cs" Inherits="CicPortal.SubmittedTasks" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Submitted Assignments/Tasks</li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin: 10px;">
        <div runat="server" id="feedback"></div>
        <div class="panel panel-green">
            <div class="panel-heading">Submitted Programme Accreditation Tasks</div>
            <div runat="server" id="commentfeedback"></div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped" id="JsTable">
                        <thead>
                            <tr>
                                <th>Assignment No</th>
                                <th>University Name</th>
                                <th>Programme Name</th>
                                <th>Status</th>
                                
                                <th>View/Download</th>
                                <%--<th>Re-Open Task</th>--%>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                var projectData3 = Config.ReturnNav().ProgrammeEvaluationHeader.Where(r => r.Resource_No == Convert.ToString(Session["PeerCode"]) && r.Status != "Open");
                                foreach (var project in projectData3)
                                {
                            %>

                            <tr>
                                <td><%=project.Code %></td>
                                <td><%=project.Institution_Name %></td>
                                <td><%=project.Application_Description %></td>
                                <td><%= "Submitted" %></td>
                                <td><a href="AssignmentReport.aspx?evalNo=<%=project.Code %>" class="btn btn-info"><i class="fa fa-download"></i>View/Download</a></td>
                                <%--<td><label class="btn btn-warning" onclick="viewSubcomponents('<%=project.Code %>','<%=project.Application_Description %>');"><i class="fa fa-pencil"></i> Re-Open Task</label></td>  --%>
                            </tr>
                            <%

                                } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
     </div>

    <script>
        function viewSubcomponents(subcomponentcode, fileName) {
            document.getElementById("filetoDeleteName").innerText = fileName;
            document.getElementById("MainContent_txtsubcomponentcode").value = subcomponentcode;
            $("#viewSubcomponentsModal").modal();
        }
    </script>
         <div id="viewSubcomponentsModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Open Assignment</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to re-open the assignment: <strong id="filetoDeleteName"></strong> ?</p>
          <asp:TextBox runat="server" ID="txtsubcomponentcode" type="hidden"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
          <asp:Button runat="server" CssClass="btn btn-success" Text="Re-Open Assignment" OnClick="Unnamed_Click"/>
      </div>
    </div>

  </div>
</div>
</asp:Content>
