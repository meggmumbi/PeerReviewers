<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuditExitReport.aspx.cs" Inherits="CicPortal.AuditExitReport" %>
<%@ Import Namespace="CicPortal" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div runat="server" id="myfeedback"></div>
            <div class="panel-heading">Quality Audit Evaluation</div>
            <div class="panel-body">
                <div id="feedback" style="display: none"></div>
                <input type="hidden" value="<% =Request.QueryString["auditNo"] %>" id="txttechNO"/>
                <table class="table table-bordered table-striped" id="dataTables-example">
                    <thead>
                        <tr>
                            <th style="width: 2em; display: none">#</th>
                            <th style="width: 12em;">Audit Criteria</th>
                            <th>Findings</th>
                            <th>Strength</th>
                            <th>Weakness</th>
                            <th>Recommendation</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th><asp:Button runat="server" cssClass="btn btn-success" Text="Back" formnovalidate  OnClick="Unnamed_Click"/></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th><button type="submit" class="btn btn-success btnInsertCmps" id="btnAddSubcomponent">Save Evaluation</button></th>                      
                        </tr>
                    </tfoot>
                    <tbody>
                    <%
                        string techNO = Request.QueryString["auditNo"];
                        var EvalsubComponents = Config.ReturnNav().SARCompletenessLines.Where(r=>r.Code == techNO).ToList();
                        foreach (var project in EvalsubComponents)
                        {
                                %>
                                <tr>
                                    <td style="display:none"><input class="form-control" type="text" value="<%=project.Section_Code %>" disabled="disabled" style="width: 5em;"/></td>
                                    <td><textarea  disabled="disabled" style="width: 16em; word-wrap: break-word!important;" id="setiondesc"><%=project.Section_Description %></textarea></td>
                                    <td><input type="text" class="form-control" id="findings"/></td>
                                    <td><input type="text" class="form-control" id="strength"/></td>
                                    <td><input type="text" class="form-control" id="weakness"/></td>
                                    <td><input type="text" class="form-control" id="recommendation"/></td>
                                </tr> 
                                <%
                            }
                    %>
                    </tbody>
                </table>
                <br />
                <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Submit To CUE" ID="submittocue" OnClick="submittocue_Click"/>
                 <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Back To Homepage" ID="homepage" OnClick="homepage_Click"/>
            </div>

        </div>
    </div>
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
            onerfqitem.SectionCode = row.find("TD input").eq(0).val();
            onerfqitem.Findings = row.find("TD input").eq(1).val();
            onerfqitem.Strength = row.find("TD input").eq(2).val();
            onerfqitem.Weakness = row.find("TD input").eq(3).val();
            onerfqitem.Recommendation = row.find("TD input").eq(4).val();
            //onerfqitem.SectionDesc = row.find("TD input").eq(1).val(); 
            //onerfqitem.SectionDesc = $("#setiondesc").val();
            //onerfqitem.Findings = $("#findings").val();
            //onerfqitem.Strength = $("#strength").val();
            //onerfqitem.Weakness = $("#weakness").val();
            //onerfqitem.Recommendation = $("#recommendation").val();
            allrfqitems.push(onerfqitem);
            
        });
        
        $.ajax({
            type: "POST",
            url: "AuditExitReport.aspx/InsertComponentItems",
            data: '{cmpitems: ' + JSON.stringify(allrfqitems) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (status) {
                switch (status.d) {
                case "success":
                    Swal.fire
                    ({
                        title: "Response Saved Successfully!",
                        text: "The Quality Audit Exit Report response was successfully saved, kindly complete the response by clicking on submit to CUE!",
                        type: "success"
                    }).then(() => {
                        $("#feedback").css("display", "block");
                        $("#feedback").css("color", "green");
                        $('#feedback').attr("class", "alert alert-success");
                        $("#feedback").html("The Quality Audit Exit Report response was successfully saved, kindly complete the response by clicking on submit to CUE!");
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

</script>
</asp:Content>
