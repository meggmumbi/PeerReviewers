<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmploymentRecord.aspx.cs" Inherits="CicPortal.EmploymentRecord" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <div class="row" style="margin: 10px;">
<%--        <div class="panel panel-green">
            <div class="panel-heading">Add Employment Record</div>
            <div class="panel-body">
                <div runat="server" id="feedback"></div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                                       <label>Employer:</label>                      
                                        <asp:TextBox CssClass="form-control" runat="server" ID="employer" Placeholder="Employer"  />
                                   
                                    </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                                       <label>Position:</label>                      
                                        <asp:TextBox CssClass="form-control" runat="server" ID="postion" Placeholder="Position"  />
                                   
                                    </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                                       <label>Date From:</label>                      
                                        <asp:TextBox CssClass="form-control bootstrapdatepicker" runat="server" ID="dateFrom" Placeholder="Date From"  />
                                   
                                    </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                                       <label>Date To:</label>                      
                                        <asp:TextBox CssClass="form-control bootstrapdatepicker" runat="server" ID="dateTo" Placeholder="Date To"/>
                                   
                                    </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Contact Person (Full Names):</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="contactPerson" Placeholder="Contact Person"  />
                                   
                        </div>
                    </div>
                
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label>Address:</label>                      
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtAddress" Placeholder="Input address"  />
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label>Email:</label>                      
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail" Placeholder="Email address" TextMode="Email"  />
                    </div>
                </div>
                
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label>Telephone:</label>                      
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtPhonenumber" Placeholder="Phone number" TextMode="Phone"  />
                    </div>
                </div>
                

                
            </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Employment Record" ID="addRecord" OnClick="addRecord_Click"/>
            <div class="clearfix"></div>
        </div>
        </div>--%>
           <div class="panel panel-green">
            <div class="panel-heading"> Empoyment Record</div>
            <div class="panel-body">
                <div runat="server" id="feedback"></div>
          <table class="table table-bordered table-striped" id="dataTables-example">
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
                  var records = Config.ReturnNav().PeerReviewersEmployment.Where(r => r.Peer_Reviewer_Code == Convert.ToString(Session["PeerCode"]));
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
    </div>
    <script>
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
         $(document).ready(function() {
             $('#dataTables-example').DataTable({
                 responsive: true
             });
         });
     </script>
 </asp:Content>
