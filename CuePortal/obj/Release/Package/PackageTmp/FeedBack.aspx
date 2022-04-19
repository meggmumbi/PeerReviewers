<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="CicPortal.FeedBack" %>
<%@ Import Namespace="CicPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        int step = 1;
        try
        {
            step = Convert.ToInt32(Request.QueryString["step"]);
            if (step > 2 || step < 1)
            {
                step = 1;
            }
        }
        catch (Exception)
        {
            step = 1;
        }
        if (step == 1)
        {
    %>


    <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div class="panel-heading">Add Feedback
                <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 1 of 2 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
            </div>           
            <div class="panel-body">
                <div runat="server" id="headerfeedback"></div>
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Work Order Name</label>                      
                            <asp:DropDownList CssClass="form-control" runat="server" ID="workorder" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="workorder_SelectedIndexChanged">
                                <asp:ListItem>--Select Work Order--</asp:ListItem>
                            </asp:DropDownList>                                 
                        </div>
                    </div>   
                    <div class="col-md-6 col-lg-6">
                         <div class="form-group">
                            <label>Programme Name</label>                      
                            <asp:TextBox CssClass="form-control" runat="server" ID="programmename" ReadOnly="true"/>                               
                        </div>
                    </div>           
            </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" ID="next" OnClick="next_Click"/>
            <div class="clearfix"></div>
        </div>
     </div>
</div>
    <% 
        }
        else if (step == 2)
        {

    %>
        <div class="row" style="margin: 10px;">
        <div class="panel panel-green">
            <div class="panel-heading">Add Feedback Lines
                 <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 2 of 2 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
            </div>          
            <div class="panel-body">
               <div id="feedback" style="display: none"></div>
                <input type="hidden" value="<% =Request.QueryString["feedbackNo"] %>" id="txtfeedbackNo"/>
                <table class="table table-bordered table-striped" id="dataTables-example">
                    <thead>
                        <tr>
                            <th style="width: 2em; display: none">#</th>
                            <th style="width: 12em;">Rating Description</th>
                            <th>Maximum Score</th>
                            <th>Score</th> 
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th><asp:Button runat="server" cssClass="btn btn-primary" Text="Previous Page" formnovalidate ID="PreviousPage" OnClick="back_Click"/></th>
                            <th></th>
                            <%--<th></th> --%>
                            <th><button type="submit" class="btn btn-success btnInsertCmps">Submit Rating To CUE</button></th>                      
                        </tr>
                    </tfoot>
                    <tbody>
                    <% 
                        string feedbackNo = Request.QueryString["feedbackNo"];
                        var ratingComponents = Config.ReturnNav().PeerReviewerRatingComponents.ToList();
                        foreach(var project in ratingComponents)
                        {
                                %>
                            <tr>
                                <td style="display:none"><input class="form-control" type="text" value="<%=project.Code %>" disabled="disabled" style="width: 5em;"/></td>
                                <td><textarea  disabled="disabled" style="width: 33em; word-wrap: break-word!important;"><%=project.Description %></textarea></td>
                                <td><input  disabled="disabled" class="form-control ymaximum" style="width: 15em; height:3em; word-wrap: break-word!important;" value="<%=project.Maximum_Score %>"/></td>
                                <td><input  type="number" class="form-control yscore" id="yscore" style="width: 15em;"/></td>
                            </tr>  
                                <%
                         }                    
                         %>
                    </tbody>
             </table>         
            </div>
     </div>
</div>

    <%
        }
    %>

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
            i++;

            onerfqitem.TfeedbackNo = $("#txtfeedbackNo").val();
            onerfqitem.TcomponentCode = row.find("TD input").eq(0).val();
            onerfqitem.Tmaximumscore = row.find("TD input").eq(1).val();
            onerfqitem.Tscore = $("#yscore").val();
            allrfqitems.push(onerfqitem);
            
        });
        
        $.ajax({
            type: "POST",
            url: "FeedBack.aspx/InsertComponentItems",
            data: '{cmpitems: ' + JSON.stringify(allrfqitems) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (status) {
                switch (status.d) {
                case "success":
                    Swal.fire
                    ({
                        title: "Feedback Added!",
                        text: "Feedback submitted successfully!",
                        type: "success"
                    }).then(() => {
                        $("#feedback").css("display", "block");
                        $("#feedback").css("color", "green");
                        $('#feedback').attr("class", "alert alert-success");
                        $("#feedback").html("Feedback submitted successfully!");
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
