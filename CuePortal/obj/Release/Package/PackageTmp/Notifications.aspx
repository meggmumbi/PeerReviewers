<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="CicPortal.Notifications" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="CicPortal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <div class="row" style="margin: 10px;">
       
        <div class="panel panel-default">
            <div class="panel-heading">Notifications</div>
            <div class="panel-body">
                <div id="feedback" style="display: none"></div>
                <table class="table table-bordered table-striped" id="dataTables-example">
                    <thead>
                    <tr>
                        <th>Notification</th>
                        <th>Date Notified</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                       
                    </tr>
                    </tfoot>
                    <tbody>
                    <%
                        var allnotifications = Config.ReturnNav().peerRevNotifications.Where(r=>r.Peer_Code ==(string)Session["PeerCode"]).ToList();
                        foreach (var project in allnotifications)
                        {
                    %>
                        <tr>
                            <td><%=project.Notification_Decription %></td>
                            <td><%=Convert.ToDateTime(project.Date_Created).ToShortDateString() %></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
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
                onerfqitem.jobCode = $("#txtjobCode").val();
                onerfqitem.component = $("#txtcomponentCode").val();

                onerfqitem.subcomponent = row.find("TD input").eq(0).val();
                onerfqitem.strength = row.find("TD input").eq(1).val();
                onerfqitem.weakness = row.find("TD input").eq(2).val();
                onerfqitem.recommendation = row.find("TD input").eq(3).val();
                onerfqitem.score = row.find("TD input").eq(4).val();
                allrfqitems.push(onerfqitem);
            });
        
            $.ajax({
                type: "POST",
                url: "Sub_Components.aspx/InsertComponentItems",
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
                }
            });
            console.log(allrfqitems);
        });

    </script>
</asp:Content>
