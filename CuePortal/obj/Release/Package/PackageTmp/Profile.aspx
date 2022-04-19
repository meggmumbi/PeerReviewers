<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CicPortal.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">My Profile</li>
            </ol>
        </div>
    </div>
     <div class="row" style="width: 100%; display: block; margin: auto;">      
         <div >
                 <div class="panel panel-default">
                    <div class="panel-heading">My Current Profile Dated: <%=Convert.ToDateTime(DateTime.Now).ToString() %></div>
                     <div style="padding: 20px; ">
                     <div id="feedback" runat="server"></div>
                           <div class="row" >
                                <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>Title:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="title1"  required ReadOnly="True"/>
                                   
                                    </div>
                              </div> 
                               <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>Name:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="name" Placeholder="Name" required ReadOnly="True"/>
                                   
                                    </div>
                              </div>
                                <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>ID No./Passport No.:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="idNo" Placeholder="ID No./Passport No." ReadOnly="True"/>
                                   
                                    </div>
                               </div>
                                <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>Highest Academic Qualification:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="highestAcademicQualification1"  required ReadOnly="True"/>
                                   
                                    </div>
                              </div> 
                               </div>
                          <div class="row" >
                               <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>Phone Number:</label>                       
                                        <asp:TextBox CssClass="form-control" runat="server" ID="phoneNumber" Placeholder="Phone Number" ReadOnly="True"/>
                                   
                                    </div>
                             </div>
                               <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>Email Address:</label>                       
                                      <asp:TextBox CssClass="form-control" runat="server" ID="emailAddress" Placeholder="Email Address" required type="Email" ReadOnly="True"/>
                                   
                                    </div>
                              </div>
                                    </div>
                          <div class="row" >
                               <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>KRA PIN:</label>                       
                                         <asp:TextBox CssClass="form-control" runat="server" ID="kraPin" Placeholder="KRA P.I.N." required ReadOnly="True"/>
                                   
                                    </div>
                            </div>
                               <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>Post Address:</label>                       
                                       <asp:TextBox CssClass="form-control" runat="server" ID="postAddress" Placeholder="Post Address" required ReadOnly="True"/>
                                   
                                    </div>
                                   </div>
                               </div>
                          <div class="row" >
                               <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>Post Code:</label>                       
                                       <asp:TextBox CssClass="form-control" runat="server" ID="postCode1" required AutoPostBack="True" OnSelectedIndexChanged="postCode_SelectedIndexChanged" ReadOnly="True"/>
                                   
                                    </div>
                              </div>
                               <div class="col-md-6 col-lg-6">
                                <div class="form-group">
                                       <label>City:</label>                       
                                          <asp:TextBox CssClass="form-control" runat="server" ID="city" Placeholder="City" ReadOnly="True" />
                                   
                                    </div>
                               </div>
                               </div>
                         
                         

                         
                   
                       
                     
                 </div>
                <div class="panel-footer" style="display:none">
                             <asp:Button runat="server" CssClass="btn btn-success pull-right" ID="updateProfile" Text="Update Profile" OnClick="updateProfile_Click" />
                    <div class="clearfix"></div>
                </div>   
                   
                      </div>    
                       
               
             </div>
      <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-2 col-sm-offset-2" style="text-align: center;">
          <hr/>
              &copy; <%: DateTime.Now.Year %> -Design by  <a href="http://www.dynasoft.co.ke" runat="server" target="blank">Dynasoft Business Solutions</a>
         </div>
             </div>
</asp:Content>
