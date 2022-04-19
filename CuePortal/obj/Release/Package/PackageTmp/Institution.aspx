<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Institution.aspx.cs" Inherits="CicPortal.Institution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
          
        <div class="row">
            <div class="col-md-12 col-lg-12">
                  <div class="panel panel-default">
            <div class="panel-heading">Institution Accreditation</div>
   
                <div class="panel-body">
                    <div id ="feedback" runat="server"></div>
                        <div class="form-group">
                        <label>Type of University:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="accreditationType" required OnSelectedIndexChanged="accreditationType_SelectedIndexChanged"/>
                    </div>
                       <div class="row" >
                             <div class="col-md-6 col-lg-6">
                                 <div class="form-group">
                                     <label>Proposed Name:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="proposedName" Placeholder="Proposed Name" required />
                                    </div>

                             </div>
                              <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                      <label>KRA Pin:</label> <i>(Sponsor)</i>                      
                                        <asp:TextBox CssClass="form-control" runat="server" ID="kraPin" Placeholder="KRA P.I.N." required />
                                     </div>

                             </div>
                         </div>
                     
                           <div class="row" >
                             <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>Proposed Location:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="proposedLocation" Placeholder="Proposed Location" required />
                                    </div>

                             </div>
                              <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>Sponsor:</label>                       
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="sponsor" required />
                                    </div>

                             </div>
                         </div> 
                        
                         <h3>Communication Details:</h3>
                         <hr/>
                         <br/>
                  
                           <div class="row" >
                             <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>County:</label>                       
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="county"  required OnSelectedIndexChanged="county_SelectedIndexChanged" AutoPostBack="True" />
                                    </div>

                             </div>
                              <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>Constituency:</label>                       
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="constituency"  required />
                                    </div>

                             </div>
                         </div>
                           <div class="row" >
                             <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>Post Address:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="postAddress" Placeholder="Post Address" required />
                                    </div>

                             </div>
                              <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>Post Code:</label>                       
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="postCode" required OnSelectedIndexChanged="postCode_SelectedIndexChanged" AutoPostBack="True" />
                                    
                                    </div>

                             </div>
                         </div>
                           <div class="row" >
                             <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>City:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="city" Placeholder="City" ReadOnly="True" />
                                    </div>

                             </div>
                              <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>Institution Website:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="institutionWebsite" Placeholder="Institution Website" required />
                                    </div>

                             </div>
                         </div>
                         <div class="row" >
                             <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>Phone Number:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="phoneNumber" Placeholder="Phone Number" />
                                    </div>

                             </div>
                              <div class="col-md-6 col-lg-6">
                                  <div class="form-group">
                                     <label>Email Address:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="emailAddress" Placeholder="Email Address" required type="Email"/>
                                    </div>

                             </div>
                         </div>
                
                  
           <div class="form-group">
               <label>Cover Letter:</label>
                <asp:FileUpload ID="coverLetter" runat="server" CssClass="form-control" required/>
           </div> 
                    <div class="form-group">
               <label>Proposal Document:</label>
                <asp:FileUpload ID="proposalDocument" runat="server" CssClass="form-control" required/>
           </div>
                    <div class="form-group">
               <label>KRA Copy:</label>
                <asp:FileUpload ID="kraCopy" runat="server" CssClass="form-control" required/>
           </div>    
                      <div class="form-group">
               <label>Payment Document:</label>
                <asp:FileUpload ID="paymentDoc" runat="server" CssClass="form-control" required/>
           </div>  
                    <div class="form-group">
               <label>Payment Reference:</label>
                <asp:TextBox ID="paymentReference" runat="server" CssClass="form-control" PlaceHolder ="Payment Reference"  required/>
           </div>
                <div style="background-color: #ececec; padding:10px;">
                             <asp:Button runat="server" CssClass="btn btn-success btn-block" ID="apply" Text="Apply for Accreditation"  style="border-radius: 2px;font-size: 17px;padding: 10px 19px;" OnClick="apply_Click"  />
                     </div>      
                    

                </div>   
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
