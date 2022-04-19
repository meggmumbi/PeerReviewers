<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="CicPortal.Payment" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <div class="row" style="margin: 10px;">
        
           <div class="panel panel-green">
            <div class="panel-heading">Payments History</div>
            <div class="panel-body">
          <table class="table table-bordered table-striped" id="dataTables-example">
              <thead>
              <tr>
                   
                  <th>Payment Description</th>
                  <th>Amount</th>
                  <th>Posted Date</th>
                  <th>Posted Time</th>
                 
              </tr>
              </thead>
              <%
                  var payments = Config.ReturnNav().PaymentsHistory.Where(r => r.Account_No == Convert.ToString(Session["PeerCode"]) && r.Posted == true);
                  foreach (var payment in payments)
                  {
                       %>
              <tbody>
                  <td><%=payment.Payment_Narration %> </td>
                  <td><%=payment.Total_Amount %> </td>
                  <td><%=payment.Posted_Date %> </td>
                  <td><%=payment.Time_Posted %> </td>
              </tbody>
               <%} %>
          </table>
            
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
