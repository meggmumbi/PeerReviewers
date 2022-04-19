<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="Sub_Components.aspx.cs" Inherits="CicPortal.Sub_Components"  MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="CicPortal" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Sub Components</li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div runat="server" id="myfeedback"></div>
            <div class="panel-heading">All Available Sub Components</div>
            <div class="panel-body">
                <div id="feedback" style="display: none"></div>
                <input type="hidden" value="<% =Request.QueryString["cCode"] %>" id="txtcomponentCode"/>
                <input type="hidden" value="<% =Request.QueryString["ApplicationNo"] %>" id="txtjobNo"/>
                <input type="hidden" value="<% =Request.QueryString["mystatus"] %>" id="txtmystatus"/>
                <input type="hidden" value="<% =Request.QueryString["evalNo"] %>" id="txtapplicationCode"/>
                <div class="table-responsive">
                <table class="table table-bordered table-striped" id="dataTables-example">
                    <thead>
                        <tr>
                            <th style="width: 2em; display: none">#</th>
                            <th style="width: 12em;">Description</th>
                            <th>Strength</th>
                            <th>Weakness</th>
                            <th>Recommendation</th>
                            <th>Maximum Score</th>
                            <th>Score</th> 
                            <th>Save/View</th> 
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th><asp:Button runat="server" cssClass="btn btn-primary" Text="Back" formnovalidate   OnClick="Back_click"/></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>  
                            <th></th>  
                            <th><button type="submit" class="btn btn-success btnInsertCmps" id="btnAddSubcomponent">Save</button></th>                      
                        </tr>
                    </tfoot>
                    <tbody>
                    <%
                        string mystatus = Request.QueryString["mystatus"];
                        string evalNo = Request.QueryString["evalNo"];
                        var compntId = Request.QueryString["cCode"];
                        if(mystatus == "Awaiting Peer Review")
                        {
                            //var EvalsubComponents = Config.ReturnNav().ProgramEvaluationSubComponent.Where(r=>r.Component_Code ==compntId).ToList();
                            //foreach (var project in EvalsubComponents)
                            //{
                            string str = "";
                            string weak = "";
                            string recc = "";
                            string surrenderData = new Config().ObjNav().FnGetPAPeerComments(compntId, evalNo);
                            String[] info = surrenderData.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);
                            if (info != null)
                            {
                                foreach (var allInfo in info)
                                {
                                    String[] arr = allInfo.Split('*');

                                %>
                                <tr>
                                    <td style="display:none"><input class="form-control" type="text" value="<%=arr[0] %>" disabled="disabled" style="width: 5em;"/></td>
                                    <td><textarea  disabled="disabled" style="width: 15em; word-wrap: break-word!important;" id="subcomponent"><%=arr[1] %></textarea></td>
                                    <td><input  type="text" class="form-control" required="required" id="strength" value="<%=arr[2]%>"/></td>
                                    <td><input  type="text" class="form-control" required="required" id="weakness" value="<%=arr[3]%>"/></td>
                                    <td><input  type="text" class="form-control" required="required" id="recommendation" value="<%=arr[4] %>"/></td>
                                    <td><textarea  disabled="disabled" style="width: 9em; word-wrap: break-word!important;" id="maximumscore"><%=arr[5] %></textarea></td>
                                    <td><input type="text" class="form-control" required="required" style="width: 5em;" id="score" value="<%=arr[6] %>"/></td>
                                    <td><label class="btn btn-info" onclick="viewSubcomponents('<%=arr[2] %>','<%=arr[3] %>','<%=arr[4] %>','<%=arr[6] %>');"><i class="fa fa-eye"></i> View</label></td>
                                </tr> 
                                <% 
                                   }
                                }                           
                          //  }

                        }
                        else if(mystatus == "Verification of Academic Resources")
                        {
                              var SitesubComponents = Config.ReturnNav().ProgrammeSiteSubcomponent.Where(r=>r.Component_Code ==compntId).ToList();
                              foreach(var project in SitesubComponents)
                              {
                                  %>
                                <tr>
                                    <td style="display:none"><input class="form-control" type="text" value="<%=project.Code %>" disabled="disabled" style="width: 5em;"/></td>
                                    <td><textarea  disabled="disabled" style="width: 15em; word-wrap: break-word!important;" id="tsubcomponent"><%=project.Description %></textarea></td>
                                    <td><input  type="text" class="form-control" required="required" id="tstrength"/></td>
                                    <td><input  type="text" class="form-control" required="required" id="tweakness"/></td>
                                    <td><input  type="text" class="form-control" required="required" id="trecommendation"/></td>
                                    <td><textarea  disabled="disabled" style="width: 9em; word-wrap: break-word!important;" id="tmaximumscore"><%=project.Maximum_Score %></textarea></td>
                                    <td><input  type="text" class="form-control" required="required" style="width: 5em;" id="tscore"/></td>
                                </tr>  
                                  <%
                              }  
                        }
                    %>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });

    function viewSubcomponents(strength, weakness, reccomendation, score) {
        document.getElementById("MainContent_txtstrength").value = strength;
        document.getElementById("MainContent_txtweakness").value = weakness;
        document.getElementById("MainContent_txtreccomendation").value = reccomendation;
        document.getElementById("MainContent_txtscore").value = score;
        $("#viewSubcomponentsModal").modal();
    }

    //$("body").delegate("#dataTables-example .btnInsertCmps", "click", function (event) {
    //    //To prevent form submit after ajax call
    //    event.preventDefault();
    //    //Loop through the Table rows and build a JSON array.
    //    var allrfqitems = new Array();
    //    $("#dataTables-example TBODY TR").each(function () {
    //        var row = $(this);
    //        var onerfqitem = {};
    //        onerfqitem.evalNo = $("#txtapplicationCode").val(); 
    //        onerfqitem.applicationNo = $("#txtjobNo").val();
    //        onerfqitem.mystatus = $("#txtmystatus").val();
    //        onerfqitem.component = $("#txtcomponentCode").val();
    //        onerfqitem.subcomponent = row.find("TD input").eq(0).val();
    //        onerfqitem.strength = row.find("TD input").eq(1).val();
    //        onerfqitem.weakness = row.find("TD input").eq(2).val();
    //        onerfqitem.recommendation = row.find("TD input").eq(3).val();
    //        onerfqitem.maximumscore = row.find("TD textarea").eq(1).val();
    //        onerfqitem.score = row.find("TD input").eq(4).val();
    //        allrfqitems.push(onerfqitem);
            
    //    });
        
    //    $.ajax({
    //        type: "POST",
    //        url: "Sub_Components.aspx/InsertComponentItems",
    //        data: '{cmpitems: ' + JSON.stringify(allrfqitems) + '}',
    //        contentType: "application/json; charset=utf-8",
    //        dataType: "json",
    //        success: function (status) {
    //            switch (status.d) {
    //            case "success":
    //                Swal.fire
    //                ({
    //                    title: "Items Added!",
    //                    text: "Evaluation comments saved successfully!",
    //                    type: "success"
    //                }).then(() => {
    //                    $("#feedback").css("display", "block");
    //                    $("#feedback").css("color", "green");
    //                    $('#feedback').attr("class", "alert alert-success");
    //                    $("#feedback").html("The Evaluation comments have been saved successfully, kindly click the 'Back' button to add more eveluation comments");
    //                });
    //                break;

    //              case "componentnull":
    //                Swal.fire
    //                ({
    //                    title: "Component not filled!",
    //                    text: "Component field empty!",
    //                    type: "danger"
    //                }).then(() => {
    //                    $("#feedback").css("display", "block");
    //                    $("#feedback").css("color", "red");
    //                    $('#feedback').attr("class", "alert alert-danger");
    //                    $("#feedback").html("Component field empty!");
    //                });
    //                break;
    //            default:
    //                Swal.fire
    //                ({
    //                    title: "An Error Occured!!!",
    //                    text: "Kindly click 'OK' to view the error",
    //                    type: "error"
    //                }).then(() => {
    //                    $("#feedback").css("display", "block");
    //                    $("#feedback").css("color", "red");
    //                    $('#feedback').addClass('alert alert-danger');
    //                    $("#feedback").html(status.d);
    //                });
                   
    //                break;
    //            }
    //        },
    //        error: function(err) {
    //            console.log(err.statusText);
    //            console.log(status.d);
    //        }
            
    //    });
        
    //    console.log(allrfqitems);

    //});

</script>

    <div id="viewSubcomponentsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Sub Components Details</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <strong>Strength:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtstrength" TextMode="MultiLine"/>
                    </div>
                    <div class="form-group">
                        <strong>Weakness:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtweakness" TextMode="MultiLine" />
                    </div>
                    <div class="form-group">
                        <strong>Recommendation:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtreccomendation" TextMode="MultiLine" />
                    </div>
                    <div class="form-group">
                        <strong>Score:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtscore" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
