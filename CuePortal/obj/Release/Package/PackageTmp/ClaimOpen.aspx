<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimOpen.aspx.cs" Inherits="CicPortal.ClaimOpen" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Open Claims</li>
            </ol>
        </div>
    </div>
    <%
        String employeeNo = Convert.ToString(Session["PeerCode"]);
        var nav = Config.ReturnNav();
        var payments = nav.Payments.Where(r => r.Status == "Open" && r.Account_No==employeeNo && r.Payment_Type=="Staff Claim");
    %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Approved Claims
        </div>
        <div class="panel-body">
            <!--No, status, location code, description , view/edit -->
            <div runat="server" id="feedback"></div>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Claim No</th>
                    <th>Payment Narration</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>View/Edit</th>
                </tr>
                </thead>
                <tbody>
                <%
                    foreach (var header in payments)
                    {
                        %>
                    <tr>
                        <td><% =header.No %></td>                     
                        <td><% =header.Payment_Narration%></td>
                       <td><% =Convert.ToDecimal(header.Total_Amount).ToString("#,##0.00") %></td>
                        <td><% =header.Status%></td>
                        <td>
                            <%
                                if (header.Status == "Open")
                                {
                            %>
                            <a href="Claim.aspx?step=1&&claimNo=<%=header.No %>" class="btn btn-success">View/Edit</a>
                            <%
                                }
                                else if (header.Status == "Pending Approval")
                                {

                            %>
                            <label class="btn btn-default"><i class="fa fa-times"></i>Edit</label>

                            <% 
                                } %>                                              
                        </td>
                    </tr>
                    <%
                    } %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
