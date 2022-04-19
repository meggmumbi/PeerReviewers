<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AcademicQualifications.aspx.cs" Inherits="CicPortal.AcademicQualifications" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <div class="row" style="margin: 10px;">
<%--        <div class="panel panel-green">
            <div class="panel-heading">Add Academic Qualifications: - Add Qualifications beginning with the highest Academic qualification.</div>
            <div class="panel-body">
                <div runat="server" id="headerfeedback"></div>
                
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Title of Qualification Obtained:</label>
                             <asp:DropDownList runat="server" ID="ddlAcQualific" CssClass="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Country of Qualification:</label>                      
                            <asp:DropDownList runat="server" ID="ddlCountries" CssClass="form-control"/>
                        </div>
                    </div> 
                </div>
                 <div class="row">
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Year Obtained:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="yearObtained" Placeholder="Year Obtained"  TextMode="Number"/>                                   
                        </div>
                    </div>  
                       <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Institution Name:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="institution" Placeholder="Institution"  />                                  
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Area of Specialization:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="areaOfSpecialization" Placeholder="Area of Specialization" />
                                   
                        </div>
                    </div>  
                       <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Duration of Study:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="durationOfStudy" Placeholder="Duration of Study"  TextMode="Number"/>                                  
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div runat="server" id="uploadfeedback"></div>
                </div>
            </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Qualification" ID="addPeerQualification" OnClick="addPeerQualification_Click"/>
            <div class="clearfix"></div>
        </div>
        </div>--%>
           <div class="panel panel-green">
            <div class="panel-heading"> Academic Qualifications</div>
            <div class="panel-body">
                <div runat="server" id="headerfeedback"></div>
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
                  var qualifications = Config.ReturnNav().AcademicQualifications.Where(r => r.Peer_Reviewer_Code == Convert.ToString(Session["PeerCode"]));
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
    </script>
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
      <script>
         $(document).ready(function() {
             $('#dataTables-example').DataTable({
                 responsive: true
             });
         });
     </script>
 </asp:Content>
