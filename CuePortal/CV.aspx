<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CV.aspx.cs" Inherits="CicPortal.CV" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <div class="row" style="margin: 10px;">
        
           <div class="panel panel-green">
            <div class="panel-heading">Upload your Curriculum Vitae (CV)</div>
            <div class="panel-body">
                <div runat="server" id="documentsfeedback"></div>
               <div class="row">
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <strong>Select file to upload:</strong>
                           <asp:FileUpload runat="server" ID="document" CssClass="form-control" style="padding-top: 0px;"/>
                       </div>
                   </div>
                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                       <div class="form-group">
                           <br/>
                           <asp:Button runat="server" CssClass="btn btn-success" Text="Upload Curriculum Vitae" ID="uploadDocument" OnClick="uploadDocument_Click"/>
                       </div>
                   </div>
               </div>
<%--               <table class="table table-bordered table-striped">
                   <thead>
                   <tr>
                       <th>Document Title</th>
                       <th>Download</th>
                       <th>Delete</th>
                   </tr>
                   </thead>
                   <tbody>
                   <%
                       try
                       {
                           String fileFolderApplication = ConfigurationManager.AppSettings["FileFolderApplication"];
                           String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "Peer Reviewer Application/";
                           string peercode = Convert.ToString(Session["PeerCode"]);
                           String CVNo = "CV";
                           peercode = peercode.Replace('/', '_');
                           peercode = peercode.Replace(':', '_');
                           String documentDirectory = filesFolder + peercode + ' '+ CVNo +"/";
                           if (Directory.Exists(documentDirectory))
                           {
                               foreach (String file in Directory.GetFiles(documentDirectory, "*.*", SearchOption.AllDirectories))
                               {
                                   String url = documentDirectory;
                                   %>
                       <tr>
                           <td><% =file.Replace(documentDirectory, "") %></td>
                      
                           <td><a href="<%=fileFolderApplication %>\Peer Reviewer Application\<% =peercode+"\\"+file.Replace(documentDirectory, "") %>" class="btn btn-success">Download</a></td>
                           <td><label class="btn btn-danger" onclick="deleteFile('<%=file.Replace(documentDirectory, "")%>');"><i class="fa fa-trash-o"></i> Delete</label></td>
                       </tr>
                       <%
                                    }
                                }
                       }
                       catch (Exception)
                       {
                       
                       }%>
                   </tbody>
               </table>--%>
            </div>
        </div>
    </div>
  
 </asp:Content>
