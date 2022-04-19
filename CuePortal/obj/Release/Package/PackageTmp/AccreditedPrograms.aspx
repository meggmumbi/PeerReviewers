<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccreditedPrograms.aspx.cs" Inherits="CicPortal.AccreditedPrograms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
          
        <div class="row">
            <div class="col-md-12 col-lg-12">
                  <div class="panel panel-default">
            <div class="panel-heading">Accredited Programs</div>
   
                <div class="panel-body">
                    <div id ="feedback" runat="server"></div>
                     <table class="table table-bordered table-striped table-hover">
                         <thead>
                         <tr>
                             <th>Campus</th>
                             <th>Program Domain</th>
                             <th>Program Level</th>
                             <th>Program Name</th>
                             <th>Application Date</th>
                             <th>Accreditation Date</th>
                             
                         </tr>
                         </thead>
                     </table>   
                    

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
