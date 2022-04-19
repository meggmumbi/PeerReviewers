<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActiveJobs.aspx.cs" Inherits="CicPortal.ActiveJobs" %>

<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Active Assignments/Tasks</li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin: 10px;">
        <div runat="server" id="feedback"></div>
        <div class="panel panel-green">
            <div class="panel-heading">Ongoing Programme Accreditation Tasks</div>
            <div runat="server" id="commentfeedback"></div>
                                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped" id="JsTable1">
                                <thead>
                                    <tr>
                                        <th>Assignment No</th>
                                        <th>Assignment Description</th>
                                        <th>Task Description</th>
                                        <th>Activity</th>
                                        <th>Programme Name</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Evaluation Comments</th>
                                        <th>Download Curriculum</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        var projectData3 = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.ApprovalStatus == "Approved" && r.Confirmed == true && r.Project_Type == "Programme Accreditation" && r.Appoint == true );
                                        foreach (var project in projectData3)
                                        {
                                    %>

                                    <tr>
                                        <td><%=project.Job_No %></td>
                                        <td><%=project.Job_Name %></td>
                                        <td><%=project.Job_Task_Description %></td>
                                        <td><%=project.Programme_Name %></td>
                                        <td><%=project.Applicable_area %></td>
                                        <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                                        <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                                        <td>
                                            <label class="btn btn-success" onclick="addcomments('<%=project.Code %>','<%=project.Job_No %>','<%=project.Account_No %>','<%=project.Applicable_area %>')"><i class="fa fa-eye"></i>View Details</label></td>
                                        <td><a href="DownloadCurriculum.aspx?applicationNo=<%=project.Job_No %>" class="btn btn-info"><i class="fa fa-download"></i>Download Curriculum</a></td>
                                        <td><a visible="false" href="Evaluation_Component.aspx?ApplicationNo=<%=project.Job_No %>"></a></td>
                                    </tr>
                                    <%

                                        } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
        </div>
        <div class="panel panel-green">
            <div class="panel-heading">Ongoing Instiution Accreditation Tasks</div>
            <div runat="server" id="commentfeedback1"></div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable2" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>Assignment No</th>
                            <th>Assignment Description</th>
                            <th>Task Description</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Technical Evaluation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var projectData2 = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.ApprovalStatus == "Approved" && r.Confirmed == true && r.Appoint == true && r.Project_Type == "Instiution Accreditation");

                            foreach (var project in projectData2)
                            {
                        %>

                        <tr>
                            <td><%=project.Job_No %></td>
                            <td><%=project.Job_Name %></td>
                            <td><%=project.Job_Task_Description %></td>
                            <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                            <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                            <td><a href="InstitutionAccreditation.aspx?jobNo=<%=project.Job_No %>&&Role=<%=project.Role %>" class="btn btn-success"><i class="fa fa-plus"></i>Proceed To Technical Evaluation</a> </td>
                            <td><a visible="false" href="Evaluation_Component.aspx?ApplicationNo=<%=project.Job_No %>"></a></td>
                        </tr>
                        <%

                            } %>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="panel panel-green">
            <div class="panel-heading">Ongoing Programme Quality Audit Tasks</div>
            <div runat="server" id="commentfeedback2"></div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1">
                    <thead>
                        <tr>
                            <%-- <th>Document No</th>--%>
                            <th>Assignment No</th>
                            <th>Assignment Description</th>
                            <th>Task Description</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Evaluation Comments</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var projectData1 = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.ApprovalStatus == "Approved" && r.Confirmed == true && r.Appoint == true && r.Project_Type == "Programme Quality Audit");

                            foreach (var project in projectData1)
                            {
                        %>

                        <tr>
                            <%-- <td><%=project.Code %></td>--%>
                            <td><%=project.Job_No %></td>
                            <td><%=project.Job_Name %></td>
                            <td><%=project.Job_Task_Description %></td>
                            <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                            <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                            <td><a class="btn btn-success" href="AuditExitReport.aspx?appNo=<%=project.Job_No %>">Add Evaluation Comments</a></td>
                            <td><a visible="false" href="Evaluation_Component.aspx?ApplicationNo=<%=project.Job_No %>"></a></td>
                        </tr>
                        <%

                            } %>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="panel panel-green">
            <div class="panel-heading">Ongoing Institution Quality Audit Tasks</div>
            <div runat="server" id="commentfeedback3"></div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1">
                    <thead>
                        <tr>
                            <th>Assignment No</th>
                            <th>Assignment Description</th>
                            <th>Task Description</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Evaluation Comments</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var projectData = Config.ReturnNav().ResourceAllocation.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.ApprovalStatus == "Approved" && r.Confirmed == true && r.Appoint == true && r.Project_Type == "Institution Quality Audit");

                            foreach (var project in projectData)
                            {
                        %>

                        <tr>
                            <td><%=project.Job_No %></td>
                            <td><%=project.Job_Name %></td>
                            <td><%=project.Job_Task_Description %></td>
                            <td><%=Convert.ToDateTime(project.Start_Date).ToShortDateString() %></td>
                            <td><%=Convert.ToDateTime(project.Tentative_End_Date).ToShortDateString() %></td>
                            <td><a class="btn btn-success" href="AuditExitReport.aspx?appNo=<%=project.Job_No %>">Add Evaluation Comments</a></td>
                            <td><a visible="false" href="Evaluation_Component.aspx?ApplicationNo=<%=project.Job_No %>"></a></td>
                        </tr>
                        <%

                            } %>
                    </tbody>
                </table>

            </div>
        </div>
    </div>


    <div class="row" style="margin: 10px;">
        <div runat="server" id="Div1"></div>
        <div class="panel panel-green">
            <div class="panel-heading">Unsubmitted Programme Accreditation Tasks</div>
            <div runat="server" id="Div2"></div>
            <h4 style="color:blue"><strong>Assignment on curriculum evaluation</strong></h4>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Assignment No</th>
                            <th>Assignment Description</th>
                            <th>Date Created</th>
                            <th>Status</th>
                            <th>Edit Evaluation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            var eval = Config.ReturnNav().UnsubmittedEvaluation.Where(x => x.Resource_No == Convert.ToString(Session["PeerCode"]) && x.Status == "Open");
                            foreach (var project in eval)
                            {
                        %>

                        <tr>
                            <td><%=project.Code %></td>
                            <td><%=project.Application_No %></td>
                            <td><%=project.Application_Description %></td>
                            <td><%=Convert.ToDateTime(project.Created_On).ToShortDateString() %></td>
                            <td><%=project.Status %></td>
                            <td><a class="btn btn-info" href="Evaluation_Component.aspx?evalNo=<%=project.Code %>&&ApplicationNo=<%=project.Application_No %>"><i class="fa fa-pencil"></i>Edit Evaluation</a></td>
                        </tr>
                        <%
                            }

                        %>
                    </tbody>
                </table>
            </div>
            <h4 style="color:blue"><strong>Assignment on site verification</strong></h4>
           <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Assignment No</th>
                            <th>Assignment Description</th>
                            <th>Date Created</th>
                            <th>Status</th>
                            <th>Edit Evaluation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            var pg = Config.ReturnNav().programmeSiteEvaluation.Where(x => x.Resource_No == Convert.ToString(Session["PeerCode"]) && x.Status == "Ongoing");
                            foreach (var project in pg)
                            {
                        %>

                        <tr>
                            <td><%=project.Code %></td>
                            <td><%=project.Application_No %></td>
                            <td><%=project.Application_Description %></td>
                            <td><%=Convert.ToDateTime(project.Created_On).ToShortDateString() %></td>
                            <td><%=project.Status %></td>
                            <td><a class="btn btn-info" href="Evaluation_Component.aspx?evalNo=<%=project.Code %>&&ApplicationNo=<%=project.Application_No %>"><i class="fa fa-pencil"></i>Edit Evaluation</a></td>
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
            <div class="panel-heading">Unsubmitted Instiutional Accreditation Tasks</div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Institution Application No.</th>
                            <th>User Category</th>
                            <th>Status</th>
                            <th>Edit Evaluation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var type = Config.ReturnNav().SiteInspectionComments.Where(x => x.Resource_No == Convert.ToString(Session["PeerCode"]) && x.Status == "Open" && x.Type == "Institution Accreditation").ToList();
                            foreach (var project in type)
                            {
                        %>

                        <tr>
                            <td><%=project.Code %></td>
                            <td><%=project.Application_No %></td>
                            <td><%=project.User_Category %></td>
                            <td><%=project.Status %></td>
                            <td><a class="btn btn-success" href="InstitutionAccreditation.aspx?techNO=<%=project.Code %>">Edit Evaluation</a></td>
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
            <div class="panel-heading">Unsubmitted Programme Quality Audit Tasks</div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Description</th>
                            <th>Planned Start Date</th>
                            <th>Planned End Date</th>
                            <th>Status</th>
                            <th>Edit Evaluation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var data = Config.ReturnNav().AuditRequisitionHeader.Where(x => x.Document_Type == "SAR Site Inspection" && x.Submission_Status == "Open" && x.Task_Type == "Programme Quality Audit" && x.Resource_No == Convert.ToString(Session["PeerCode"])).ToList();
                            foreach (var project in data)
                            {
                        %>

                        <tr>
                            <td><%=project.Code %></td>
                            <td><%=project.Description %></td>
                            <td><%=Convert.ToDateTime(project.Audit_Plan_Start_Date).ToShortDateString() %></td>
                            <td><%=Convert.ToDateTime(project.Audit_Plan_End_Date).ToShortDateString() %></td>
                            <td><%=project.Submission_Status %></td>
                            <td><a class="btn btn-success" href="AuditExitReport.aspx?auditNo=<%=project.Code %>">Edit Evaluation</a></td>
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
            <div class="panel-heading">Unsubmitted Institutional Quality Audit Tasks</div>
            <div class="panel-body">
                <table class="table table-bordered table-striped dataTable1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Description</th>
                            <th>Planned Start Date</th>
                            <th>Planned End Date</th>
                            <th>Status</th>
                            <th>Edit Evaluation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var type3 = Config.ReturnNav().AuditRequisitionHeader.Where(x => x.Document_Type == "SAR Site Inspection" && x.Submission_Status == "Open" && x.Task_Type == "Institution Quality Audit" && x.Resource_No == Convert.ToString(Session["PeerCode"])).ToList();
                            foreach (var project in type3)
                            {
                        %>

                        <tr>
                            <td><%=project.Code %></td>
                            <td><%=project.Description %></td>
                            <td><%=Convert.ToDateTime(project.Audit_Plan_Start_Date).ToShortDateString() %></td>
                            <td><%=Convert.ToDateTime(project.Audit_Plan_End_Date).ToShortDateString() %></td>
                            <td><%=project.Submission_Status %></td>
                            <td><a class="btn btn-success" href="AuditExitReport.aspx?auditNo=<%=project.Code %>">Edit Evaluation</a></td>
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
        function addcomments(lineno, applicationNo, resource, type) {
            document.getElementById("MainContent_editLineno").value = lineno;
            document.getElementById("MainContent_editapp").value = applicationNo;
            document.getElementById("MainContent_editresource").value = resource;
            document.getElementById("MainContent_edittype").value = type;
            $("#addcommentsModal").modal();
        }
    </script>

    <script>
        function addinstitutioncomments(applicationNo) {
            document.getElementById("MainContent_txttechno").value = applicationNo;
            $("#addinstitutioncommentsModal").modal();
        }
    </script>

    <script>
        function addauditcomments(applicationNo) {
            document.getElementById("MainContent_txtappno").value = applicationNo;
            $("#addauditcommentsModal").modal();
        }
    </script>


    <div id="addcommentsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Please Choose Evaluation Type</h4>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="editLineno" type="hidden" />
                    <asp:TextBox runat="server" ID="editapp" type="hidden" />
                    <asp:TextBox runat="server" ID="editresource" type="hidden" />
                    <asp:TextBox runat="server" ID="edittype" type="hidden" />
                    <div class="form-group">
                        <strong>Evaluation Type:</strong>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="evaltype" AutoPostBack="true" OnSelectedIndexChanged="EvaluationType_SelectedIndexChanged">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="0">Individual</asp:ListItem>
                            <asp:ListItem Value="1">Group</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning pull-left" data-dismiss="modal">Close</button>
                    <asp:Button runat="server" CssClass="btn btn-success" Text="Add Comments" ID="Button1" OnClick="addComment_OnClick" />
                </div>
            </div>
        </div>
    </div>

    <div id="addinstitutioncommentsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Please Choose User Type</h4>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="txttechno" type="hidden" />
                    <div class="form-group">
                        <strong>User Type:</strong>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="txtusertype" AutoPostBack="false">
                            <asp:ListItem Value="0">--Select User Type--</asp:ListItem>
                            <asp:ListItem Value="1">Architect</asp:ListItem>
                            <asp:ListItem Value="2">Librarian</asp:ListItem>
                            <asp:ListItem Value="3">Program Specialist</asp:ListItem>
                            <asp:ListItem Value="4">Governance</asp:ListItem>
                            <asp:ListItem Value="5">Finance</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button runat="server" CssClass="btn btn-success" Text="Add Comments" ID="addinstitutioncomments" OnClick="addinstitutioncomments_Click" />
                </div>
            </div>
        </div>
    </div>



    <div id="addauditcommentsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Please Choose Feedback Type</h4>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="txtappno" type="hidden" />
                    <div class="form-group">
                        <strong>Feedback Type:</strong>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="feedbacktype" AutoPostBack="false">
                            <asp:ListItem Value="0">--Select Feedback Type--</asp:ListItem>
                            <asp:ListItem Value="Curriculum Expert">Curriculum Expert</asp:ListItem>
                            <asp:ListItem Value="Panel Chair">Panel Chair</asp:ListItem>
                            <asp:ListItem Value="Finance">Finance</asp:ListItem>
                            <asp:ListItem Value="QA Expert">QA Expert</asp:ListItem>
                            <asp:ListItem Value="Student/Staff Welfare">Student/Staff Welfare</asp:ListItem>
                            <asp:ListItem Value="Architect">Architect</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button runat="server" CssClass="btn btn-success" Text="Add Comments" ID="addauditcomment" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
