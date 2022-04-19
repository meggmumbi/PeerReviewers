<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InstitutionAccreditation.aspx.cs" Inherits="CicPortal.InstitutionAccreditation" %>
<%@ Import Namespace="CicPortal" %>
<%@ Import Namespace="System.IO" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div runat="server" id="commentfeedback"></div>
            <div class="panel-heading">Technical Evaluation</div>
            <div class="panel-body">
                <div id="feedback" style="display: none"></div>
                <input type="hidden" value="<% =Convert.ToString(Session["techNO"]) %>" id="txttechNO"/>
                <table class="table table-bordered table-striped" id="dataTables-example">
                    <thead>
                        <tr>
<%--                            <th style="width: 2em; display: none">#</th>
                            <th style="width: 2em; display: none">#</th>--%>
                            <th>Chapter Name</th>
                            <th>Section</th>
                            <th>Sub-Section</th>
<%--                            <th>Observation</th>
                            <th>Recommendation</th>--%>
                        </tr>
                    </thead>
<%--                    <tfoot>
                        <tr>
                            <th><asp:Button runat="server" cssClass="btn btn-primary" Text="Back" formnovalidate /></th>
                            <th></th>
                            <th></th>
                            <th><button type="submit" class="btn btn-success btnInsertCmps" id="btnAddSubcomponent">Save Evaluation</button></th>                      
                        </tr>
                    </tfoot>--%>
                    <tbody>
                    <%
                        string techNO = Convert.ToString(Session["techNO"]);
                        var EvalsubComponents = Config.ReturnNav().ProposalDocumentTemplate .Where(r=>r.Application_No == techNO).ToList();
                        foreach (var project in EvalsubComponents)
                        {
                                %>
                                <tr>
                               <%--       <td style="display:none"><input class="form-control" type="text" value="<%=project.Chapter_Code %>" disabled="disabled" style="width: 5em;"/></td>
                                    <td style="display:none"><input class="form-control" type="text" value="<%=project.Topic_Code %>" disabled="disabled" style="width: 5em;"/></td>
                                    <td><textarea  disabled="disabled" style="width: 20em; word-wrap: break-word!important;" id="chapter"><%=project.Chapter_Name %></textarea></td>
                                    <td><textarea  disabled="disabled" style="width: 16em; word-wrap: break-word!important;" id="topicname"><%=project.Topic_Name %></textarea></td>
                                    <td><textarea  disabled="disabled" style="width: 16em; word-wrap: break-word!important;" id="subtopicname"><%=project.Sub_Topic_Name %></textarea></td>
                                  <td><input type="text" class="form-control" id="observation"/></td>
                                    <td><input type="text" class="form-control" id="recommendation"/></td>--%>
                                    <td><%=project.Chapter_Name %></td>
                                     <td><%=project.Topic_Name %></td>
                                     <td><%=project.Sub_Topic_Name %></td>
                                </tr> 
                                <%
                            }
                    %>
                    </tbody>
                </table>
                <br />
                <center>
                    <label class="btn btn-success" onclick="attachFile('<%=techNO %>')">Upload Technical Evaluation Document</label>
                </center>
                                        <hr/>
                         <br />
                 <div class="panel panel-default">
                    <div class="panel-heading">
                        <div runat="server" id="Div6"></div>
                        Uploaded Documents
                    </div>
                        <br />
                        <hr/>
                         <br />
                   <table class="table table-bordered table-striped">
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
                               String fileFolderApplication = ConfigurationManager.AppSettings["FilesLocation"];
                               String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "Technical Inspection Voucher/";
                               string imprestNo = "";
                               try
                               {
                                   imprestNo = Convert.ToString(Session["techNO"]);
                                   //if (string.IsNullOrEmpty(imprestNo))
                                   //{
                                   //    imprestNo =  Request.QueryString["techNO"];
                                   //}
                               }
                               catch
                               {
                                   imprestNo = "";
                               }
                               imprestNo = imprestNo.Replace('/', '_');
                               imprestNo = imprestNo.Replace(':', '_');
                               String documentDirectory = filesFolder + imprestNo+"/";
                               if (Directory.Exists(documentDirectory))
                               {
                                   foreach (String file in Directory.GetFiles(documentDirectory, "*.*", SearchOption.AllDirectories))
                                   {
                                       String url = documentDirectory;
                                       %>
                           <tr>
                               <td><% =file.Replace(documentDirectory, "") %></td>
                               <td><a href="DownLoadFile.aspx?applicationNo=<%=imprestNo %>&&fileName=<%=file.Replace(documentDirectory, "") %>" class="btn btn-success">Download</a></td>
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
                   </table>
                  </div>  
                <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Submit Evaluation To CUE" ID="submittocue" OnClick="submittocue_Click"/>
            </div>

        </div>
    </div>
<div id="deleteFileModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Confirm Deleting File</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete the file <strong id="filetoDeleteName"></strong> ?</p>
          <asp:TextBox runat="server" ID="fileName" type="hidden"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
          <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete File" ID="deleteFileID" OnClick="deleteFile_Click" CausesValidation="false"/>
      </div>
    </div>

  </div>
</div>
<div id="attachFileModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Attach Technical Evaluation File (<i style="color:red">Kindly attach PDF/Word documents only</i>)</h4>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <div class="form-group">
                    <strong><asp:Label runat="server" class="required"></asp:Label>Technical Evaluation Document</strong>
                    <asp:FileUpload runat="server" ID="appletter" CssClass="form-control" style="padding-top: 0px;"/>
                </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
          <asp:Button runat="server" CssClass="btn btn-success" Text="Upload Technical Evaluation Document" ID="uploadFile" CausesValidation="false" OnClick="uploadFile_Click"/>
      </div>
    </div>

  </div>
</div>
<script>     
    function deleteFile(fileName) {
        document.getElementById("filetoDeleteName").innerText = fileName;
        document.getElementById("MainContent_fileName").value = fileName;
        $("#deleteFileModal").modal(); 
    }
</script> 
<script>     
    function attachFile(fileName) {
        document.getElementById("filetoDeleteName").innerText = fileName;
        document.getElementById("MainContent_fileName").value = fileName;
        $("#attachFileModal").modal();
    }
</script> 
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });

    $("body").delegate("#dataTables-example .btnInsertCmps", "click", function (event) {
        //To prevent form submit after ajax call
        event.preventDefault();
        //Loop through the Table rows and build a JSON array.
        var allrfqitems = new Array();
        $("#dataTables-example TBODY TR").each(function () {
            var row = $(this);
            var onerfqitem = {};
            onerfqitem.TechNo = $("#txttechNO").val();
            onerfqitem.ChapterCode = row.find("TD input").eq(0).val();
            onerfqitem.TopicCode = row.find("TD input").eq(1).val();
            //onerfqitem.Observation = row.find("TD input").eq(4).val();
            //onerfqitem.Recommendation = row.find("TD input").eq(5).val();
            onerfqitem.Observation = $("#observation").val();
            onerfqitem.Recommendation = $("#recommendation").val();
            allrfqitems.push(onerfqitem);
            
        });
        
        $.ajax({
            type: "POST",
            url: "InstitutionAccreditation.aspx/InsertComponentItems",
            data: '{cmpitems: ' + JSON.stringify(allrfqitems) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (status) {
                switch (status.d) {
                case "success":
                    Swal.fire
                    ({
                        title: "Items Added!",
                        text: "Evaluation score saved successfully!",
                        type: "success"
                    }).then(() => {
                        $("#feedback").css("display", "block");
                        $("#feedback").css("color", "green");
                        $('#feedback').attr("class", "alert alert-success");
                        $("#feedback").html("Evaluation score saved successfully!");
                    });
                    break;

                  case "componentnull":
                    Swal.fire
                    ({
                        title: "Component not filled!",
                        text: "Component field empty!",
                        type: "danger"
                    }).then(() => {
                        $("#feedback").css("display", "block");
                        $("#feedback").css("color", "red");
                        $('#feedback').attr("class", "alert alert-danger");
                        $("#feedback").html("Component field empty!");
                    });
                    break;
                default:
                    Swal.fire
                    ({
                        title: "Error!!!",
                        text: "Error Occured",
                        type: "error"
                    }).then(() => {
                        $("#feedback").css("display", "block");
                        $("#feedback").css("color", "red");
                        $('#feedback').addClass('alert alert-danger');
                        $("#feedback").html(status.d);
                    });
                   
                    break;
                }
            },
            error: function(err) {
                console.log(err.statusText);
                console.log(status.d);
            }
            
        });
        
        console.log(allrfqitems);

    });

    $("#btnAddSubcomponent").click(function () {
        $("#submittocue").show();
    });

</script>
</asp:Content>
