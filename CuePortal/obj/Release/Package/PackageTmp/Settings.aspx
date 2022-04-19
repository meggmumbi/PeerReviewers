<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="CicPortal.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div class="panel-heading">Change Account Password</div>
            <div class="panel-body">
                <div runat="server" id="feedback"></div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Current Password:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="currentPassword" PlaceHolder="Enter Current Password" type="password"/>                                
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>New Password:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="newPassword" PlaceHolder="Enter New Password" type="password"/>        
                        </div>
                    </div> 
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Confirm Password:</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="confirmPassword" PlaceHolder="Confirm New Password" type="password"/>
                        </div>
                    </div>               
            </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Change Password" ID="changepassword" OnClick="ChangePassword_Click"/>
            <div class="clearfix"></div>
        </div>
     </div>
</div>
</asp:Content>
