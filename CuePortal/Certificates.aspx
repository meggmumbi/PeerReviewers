<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Certificates.aspx.cs" Inherits="CicPortal.Certificates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row" style="margin: 10px;">
        
           <div class="panel panel-green">
            <div class="panel-heading">Mandatory Documents</div>
            <div class="panel-body">
                <div runat="server" id="documentsfeedback"></div>
               <div class="row">
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <strong>KRA Certificate</strong>
                           <asp:FileUpload runat="server" ID="kra" CssClass="form-control" style="padding-top: 0px;" required/>
                       </div>
                   </div>
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <br/>
                           <asp:Button runat="server" CssClass="btn btn-success" Text="Upload KRA Certificate" ID="uploadkracertificate" style="width:250px"  OnClick="uploadkracertificate_Click"/>
                       </div>
                   </div>
               </div>
               <div class="row">
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <strong>HELB Clearance</strong>
                           <asp:FileUpload runat="server" ID="helb" CssClass="form-control" style="padding-top: 0px;" required/>
                       </div>
                   </div>
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <br/>
                           <asp:Button runat="server" CssClass="btn btn-success" Text="Upload HELB Clearance" ID="HELBClearance" style="width:250px"  OnClick="HELBClearance_Click"/>
                       </div>
                   </div>
               </div>
               <div class="row">
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <strong>CID Clearance</strong>
                           <asp:FileUpload runat="server" ID="cid" CssClass="form-control" style="padding-top: 0px;" required/>
                       </div>
                   </div>
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <br/>
                           <asp:Button runat="server" CssClass="btn btn-success" Text="Upload CID Clearance" ID="CIDClearance" style="width:250px" OnClick="CIDClearance_Click"/>
                       </div>
                   </div>
               </div>
               <div class="row">
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <strong>EACC Clearance</strong>
                           <asp:FileUpload runat="server" ID="eacc" CssClass="form-control" style="padding-top: 0px;" required/>
                       </div>
                   </div>
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <br/>
                           <asp:Button runat="server" CssClass="btn btn-success" Text="Upload EACC Clearance" ID="EACCClearance" style="width:250px"  OnClick="EACCClearance_Click"/>
                       </div>
                   </div>
               </div>
               <div class="row">
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <strong>CRB Clearance</strong>
                           <asp:FileUpload runat="server" ID="crb" CssClass="form-control" style="padding-top: 0px;" required/>
                       </div>
                   </div>
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <br/>
                           <asp:Button runat="server" CssClass="btn btn-success" Text="Upload CRB Clearance" ID="CRBClearance" style="width:250px"  OnClick="CRBClearance_Click"/>
                       </div>
                   </div>
               </div>
               <div class="row">
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <strong>Professional Body</strong>
                           <asp:FileUpload runat="server" ID="professionalbody" CssClass="form-control" style="padding-top: 0px;"/>
                       </div>
                   </div>
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <br/>
                           <asp:Button runat="server" CssClass="btn btn-success" style="width:250px" Text="Upload Professional Body" ID="pbody" OnClick="PBody_Click"/>
                       </div>
                   </div>
               </div>
                <br />
                <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Submit Application" ID="submitapplication" OnClick="submitapplication_Click"/>
            </div>
               
        </div>
    </div>
  
 </asp:Content>
