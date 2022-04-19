<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Library.aspx.cs" Inherits="CicPortal.Library" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <div class="row" style="width: 100%; margin: 5px;">
        <div class="panel panel-default">
            <div class="panel-heading">Add Library Resources</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Campus:</strong>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="campus"/>
                        </div>
                    </div>  
                     <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Description/Name:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="description" placeholder ="Description/Name"/>
                        </div>
                    </div>
                </div> 
                  <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Sitting Capacity:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="sittingCapacity" placeholder="Sitting Capacity" required/>
                        </div>
                    </div>  
                     <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Functional Areas:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="functionalAreas" Placeholder ="Functional Areas" required/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>No. of Volumes:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="noOfVolumes" placeholder="No. of Volumes" required/>
                        </div>
                    </div>  
                     <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>No. of Titles:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="noOfTitles" Placeholder ="No. of Titles" required/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Services Offered:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="servicesOffered" placeholder="Services Offered" required/>
                        </div>
                    </div>  
                     <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Bandwidth:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="bandwidth" Placeholder ="Bandwidth" required/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Anti Plagiarism Software:</strong>
                             <asp:Checkbox runat="server" CssClass="form-control" ID="antiPlagiarism"/>
                        </div>
                    </div>  
                     <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Digital Repository:</strong>
                            <asp:Checkbox runat="server" CssClass="form-control" ID="digitalRepository"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>No. Of Staff:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="noOfStaff" placeholder="No. Of Staff" required/>
                        </div>
                    </div>  
                     <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Qualifications of Staff:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="staffQualifications" Placeholder ="Qualifications of Staff" required/>
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Library Policies:</strong>
                            <asp:FileUpload runat="server" CssClass="form-control" ID="libraryPolicies"  required/>
                        </div>
                    </div>  
                   
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Library"/>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">Added Library Resources</div>
            <div class="panel-body">
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Campus</th>
                        <th>Description/Name</th>
                        <th>Sitting Capacity</th>
                        <th>Functional Areas</th>
                        <th>No of Volumes</th>
                        <th>No of Titles</th>
                        <th>Bandwidth</th>
                        <th>No. of Staff</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
   
     </div>

     <script>
         $(document).ready(function() {
            /* $('#dataTables-example').DataTable({
                 responsive: true
             });*/
         });
     </script>
<script src="js/http_ajax.googleapis.com_ajax_libs_jquery_3.2.1_jquery.min.js"></script>
<script src="js/http_cdnjs.cloudflare.com_ajax_libs_popper.js_1.12.6_umd_popper.js"></script>
<script src="js/http_maxcdn.bootstrapcdn.com_bootstrap_4.0.0-beta.2_js_bootstrap.js"></script>
<script src="js/http_unpkg.com_sweetalert_dist_sweetalert.min.js"></script>
<script src="js/http_rawgit.com_eligrey_FileSaver.js_master_FileSaver.js"></script>
<script src="js/http_unpkg.com_xlsx_dist_xlsx.full.min.js"></script>
<script src="js/excel_uploader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- needed by older browsers -->
<script src="https://github.com/eligrey/Blob.js"></script>

<!-- Required -->
<script src="https://rawgit.com/eligrey/FileSaver.js/src/FileSaver.js"></script>
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>

</asp:Content>
