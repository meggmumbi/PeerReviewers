﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecreationalFacilities.aspx.cs" Inherits="CicPortal.RecreationalFacilities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <div class="row" style="width: 100%; margin: 5px;">
        <div class="panel panel-default">
            <div class="panel-heading">Add Recreational Facility</div>
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
                            <strong>Type of Facility:</strong>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="typeOfFacility"/>
                        </div>
                    </div>
                </div> 
                  <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Location:</strong>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="location"/>
                        </div>
                    </div>  
                     <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Number/Quantity:</strong>
                            <asp:TextBox runat="server" CssClass="form-control" ID="quantity" Placeholder ="Number/Quantity" required/>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="panel-footer">
                <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Recreational Facility"/>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">Added Recreational Facilities</div>
            <div class="panel-body">
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>Campus</th>
                        <th>Type of Facility</th>
                        <th>Location</th>
                        <th>Number/Quantity</th>
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