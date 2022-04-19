<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubComponents.aspx.cs" Inherits="CicPortal.SubComponents" %>
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
           
            <center><h4 style="color:red"><strong><%= "COMPONENT: " + Request.QueryString["component"] %></strong></h4></center>
             <div runat="server" id="myfeedback"></div>
            <div class="panel-heading">All Available Sub Components</div>
            <div class="panel-body">
                <div id="feedback" runat="server"></div>
                <div class="table-responsive">
                <table class="table table-bordered table-striped" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Description</th>
                            <th>Maximum Score</th>
                            <th>Awarded Score</th>
                            <th>Save/View Details</th> 
                            <th>Status</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            string mystatus = Request.QueryString["mystatus"];
                            string evalNo = Request.QueryString["evalNo"];
                            var compntId = Request.QueryString["cCode"];
                            if (mystatus == "Awaiting Peer Review")
                            {
                                var site = Config.ReturnNav().CollaborationSiteLines.Where(x => x.Evaluation_Header_No == evalNo && x.Component_Code == compntId).ToList();
                                if (site.Count > 0)
                                {
                                    foreach(var mysite in site)
                                    {
                                        int couter1 = 0;
                                        couter1++;
                                    %>
                                    <tr>
                                        <td><%=couter1 %></td>
                                        <td><%=mysite.Sub_Component_Description %></td>
                                        <td><%=mysite.Maximum_Score %></td>
                                        <td><%=mysite.Score %></td>
                                        <%
                                            if (mysite.Score > 0 || mysite.Not_Applicable == true)
                                            {
                                        %>

                                        <td>
                                            <label class="btn btn-warning" onclick="viewResourceSubcomponents('<%=mysite.Code %>','<%=mysite.Sub_Component_Code %>','<%=mysite.Sub_Component_Description %>','<%=mysite.Score %>','<%=mysite.Maximum_Score %>');"><i class="fa fa-pencil"></i>Edit Details</label></td>
                                        <%
                                            }
                                            else
                                            {
                                        %>

                                        <td>
                                            <label class="btn btn-success" onclick="viewResourceSubcomponents('<%=mysite.Code %>','<%=mysite.Sub_Component_Code %>','<%=mysite.Sub_Component_Description %>','<%=mysite.Score %>','<%=mysite.Maximum_Score %>');"><i class="fa fa-pencil"></i>Add Score</label></td>
                                        <%
                                            }
                                        %>
                                        <%
                                             if (mysite.Score > 0 || mysite.Not_Applicable == true)
                                            {
                                        %>
                                        <td>
                                            <label class="btn btn-success"><i class="fa fa-check"></i>Data Saved</label></td>
                                        <%
                                            }
                                            else
                                            {
                                        %>
                                        <td>
                                            <label class="btn btn-danger"><i class="fa fa-times"></i>Not Saved</label></td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    <%
                                            }
                                        }
                                
                                else {
                                string surrenderData = new Config().ObjNav().FnGetPAPeerComments(compntId, evalNo);
                                String[] info = surrenderData.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);
                                int couter = 0;
                                if (info != null)
                                {
                                    foreach (var allInfo in info)
                                    {
                                        couter++;
                                        String[] arr = allInfo.Split('*');
                                        var str = Regex.Replace(arr[2], @"(\r\n|\r|\n)+", " ").ToString();
                                        var weak = Regex.Replace(arr[3], @"(\r\n|\r|\n)+", " ").ToString();
                                        var rec = Regex.Replace(arr[4], @"(\r\n|\r|\n)+", " ").ToString();
                                    %>
                                    <tr>
                                        <td><%=couter %></td>
                                        <td><%=arr[1] %></td>
                                        <td><%=arr[5] %></td>
                                        <td><%=arr[6] %></td>
                                        <%
                                            if (arr[2].Length > 0)
                                            {
                                        %>

                                        <td>
                                            <label class="btn btn-warning" onclick="viewSubcomponents('<%=arr[0] %>','<%=arr[1] %>','<%=str %>','<%=weak %>','<%=rec %>','<%=arr[6] %>','<%=arr[5] %>');"><i class="fa fa-pencil"></i>Edit Details</label></td>
                                        <%
                                            }
                                            else
                                            {
                                        %>

                                        <td>
                                            <label class="btn btn-info" onclick="viewSubcomponents('<%=arr[0] %>','<%=arr[1] %>','<%=arr[2] %>','<%=arr[3] %>','<%=arr[4] %>','<%=arr[6] %>','<%=arr[5] %>');"><i class="fa fa-plus"></i>Save Details</label></td>
                                        <%
                                            }
                                        %>
                                        <%
                                            if (arr[2].Length > 0)
                                            {
                                        %>
                                        <td>
                                            <label class="btn btn-success"><i class="fa fa-check"></i>Data Saved</label></td>
                                        <%
                                            }
                                            else
                                            {
                                        %>
                                        <td>
                                            <label class="btn btn-danger"><i class="fa fa-times"></i>Not Saved</label></td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    <% 
                                                    }
                                                }
                                            }
                                        }
                            else if (mystatus == "Verification of Academic Resources")
                            {
                                int couter = 0;
                                        var site = Config.ReturnNav().Programmesitelines.Where(x=> x.Evaluation_Header_No == evalNo && x.Component_Code == compntId).ToList();
                                foreach(var mysite in site)
                                {
                                    couter++;
                                    %>
                                    <tr>
                                        <td><%=couter %></td>
                                        <td><%=mysite.Sub_Component_Description %></td>
                                        <td><%=mysite.Maximum_Score %></td>
                                        <td><%=mysite.Score %></td>
                                        <%
                                            if (mysite.Score > 0 || mysite.Not_Applicable == true)
                                            {
                                        %>

                                        <td>
                                            <label class="btn btn-warning" onclick="viewResourceSubcomponents('<%=mysite.Code %>','<%=mysite.Sub_Component_Code %>','<%=mysite.Sub_Component_Description %>','<%=mysite.Score %>','<%=mysite.Maximum_Score %>');"><i class="fa fa-pencil"></i>Edit Details</label></td>
                                        <%
                                            }
                                            else
                                            {
                                        %>

                                        <td>
                                            <label class="btn btn-success" onclick="viewResourceSubcomponents('<%=mysite.Code %>','<%=mysite.Sub_Component_Code %>','<%=mysite.Sub_Component_Description %>','<%=mysite.Score %>','<%=mysite.Maximum_Score %>');"><i class="fa fa-pencil"></i>Save Details</label></td>
                                        <%
                                            }
                                        %>
                                        <%
                                             if (mysite.Score > 0 || mysite.Not_Applicable == true)
                                            {
                                        %>
                                        <td>
                                            <label class="btn btn-success"><i class="fa fa-check"></i>Data Saved</label></td>
                                        <%
                                            }
                                            else
                                            {
                                        %>
                                        <td>
                                            <label class="btn btn-danger"><i class="fa fa-times"></i>Not Saved</label></td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    <%
                                }
                            }
                                             else  if (mystatus == "Awaiting Site Visit")
                                        {
                                            int couter = 0;
                                            var site = Config.ReturnNav().CollaborationSiteLines.Where(x => x.Evaluation_Header_No == evalNo && x.Component_Code == compntId).ToList();
                                            foreach (var mysite in site)
                                            {
                                                couter++;
                                    %>
                        <tr>
                            <td><%=couter %></td>
                            <td><%=mysite.Sub_Component_Description %></td>
                            <td><%=mysite.Maximum_Score %></td>
                            <td><%=mysite.Score %></td>
                            <%
                                if (mysite.Score > 0 || mysite.Not_Applicable == true)
                                {
                            %>

                            <td>
                                <label class="btn btn-warning" onclick="viewResourceSubcomponents('<%=mysite.Code %>','<%=mysite.Sub_Component_Code %>','<%=mysite.Sub_Component_Description %>','<%=mysite.Score %>','<%=mysite.Maximum_Score %>');"><i class="fa fa-pencil"></i>Edit Details</label></td>
                            <%
                                }
                                else
                                {
                            %>

                            <td>
                                <label class="btn btn-success" onclick="viewResourceSubcomponents('<%=mysite.Code %>','<%=mysite.Sub_Component_Code %>','<%=mysite.Sub_Component_Description %>','<%=mysite.Score %>','<%=mysite.Maximum_Score %>');"><i class="fa fa-pencil"></i>Add Score</label></td>
                            <%
                                }
                            %>
                            <%
                                if (mysite.Score > 0 || mysite.Not_Applicable == true)
                                {
                            %>
                            <td>
                                <label class="btn btn-success"><i class="fa fa-check"></i>Data Saved</label></td>
                            <%
                                }
                                else
                                {
                            %>
                            <td>
                                <label class="btn btn-danger"><i class="fa fa-times"></i>Not Saved</label></td>
                            <%
                                }
                            %>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button runat="server" ID="backtocomponents" CssClass="btn btn-warning pull-left" Text="Back To Components" OnClick="backtocomponents_Click" CausesValidation="false"/>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true,
            "pageLength": 50
        });
    });

    function viewSubcomponents(subcomponentcode, subcomponent, strength, weakness, reccomendation, score, maxscore) {
        document.getElementById("MainContent_txtsubcomponentcode").value = subcomponentcode;
        document.getElementById("MainContent_txtsubcomponent").value = subcomponent;
        document.getElementById("MainContent_txtstrength").value = strength.replace(new RegExp('\r?\n','g'), ' ');
        document.getElementById("MainContent_txtweakness").value = weakness.replace(new RegExp('\r?\n', 'g'), ' ');
        document.getElementById("MainContent_txtreccomendation").value = reccomendation.replace(new RegExp('\r?\n', 'g'), ' ');
        document.getElementById("MainContent_txtscore").value = score;
        document.getElementById("MainContent_txtmaxscore").value = maxscore;
        document.getElementById("MainContent_ntxtmaxscore").value = maxscore;
        $("#viewSubcomponentsModal").modal();
    }

    function viewResourceSubcomponents(lineNo, subcomponentcode, subcomponent, score, maxscore) {
        document.getElementById("MainContent_nxtsubcomponentcode").value = subcomponentcode;
        document.getElementById("MainContent_nxtsubcomponent").value = subcomponent;
        document.getElementById("MainContent_nxtscore").value = score;
        document.getElementById("MainContent_nxtmaxscore").value = maxscore;
        document.getElementById("MainContent_mtxtmaxscore").value = maxscore;
        document.getElementById("MainContent_mlineNo").value = lineNo;
        $("#viewResourceSubcomponentsModal").modal();
    }

</script>
        <script type="text/javascript">
        function checkTB(val) {
            var allowedString = /^\d+(\.\d{0,2})?$/; // Allow 2 decimal place with numeric value
            if (allowedString.test(val) == false) {
                alert("The value " + val + " is not allowed, kindly input only numbers or decimal numbers e.g 5 or 5.50");
            }
        }
    </script>

    <div id="viewSubcomponentsModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="width:90%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <center><h5 class="modal-title" style="color:red">Sub Components Details For:</h5></center>
                    <asp:TextBox style="color:darkgreen" runat="server" CssClass="form-control" ID="txtsubcomponent" ReadOnly="true"/>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="txtsubcomponentcode" type="hidden" />
                    <asp:TextBox runat="server" ID="ntxtmaxscore" type="hidden" />
                    <div class="form-group">
                        <strong style="color:red">Check if sub component is not applicable:</strong>
                        <asp:CheckBox runat="server" CssClass="form-control" ID="txtreccomendationchecked"/>
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Strength:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" Wrap="true" Rows="5" ID="txtstrength" TextMode="MultiLine" Height="200px"/>
                        <%--<asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="txtstrength" ErrorMessage="Please enter strength, it cannot be empty!" ForeColor="Red" />--%>
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Weakness:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" Wrap="true" Rows="5" ID="txtweakness" TextMode="MultiLine" Height="200px"/>
                        <%-- <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="txtweakness" ErrorMessage="Please enter weakness, it cannot be empty!" ForeColor="Red" />--%>
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Recommendation:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" Wrap="true" Rows="5" ID="txtreccomendation" TextMode="MultiLine" Height="200px"/>
                       <%--  <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="txtreccomendation" ErrorMessage="Please enter reccomendation, it cannot be empty!" ForeColor="Red" />--%>
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Maximum Score:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" type="number" ID="txtmaxscore" ReadOnly="true"/>
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Score:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtscore" value="0" DisplayFormatString="00.00" onkeyup="checkTB(this.value)"/>
                     <%--    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="txtscore" ErrorMessage="Please enter score, it cannot be empty!" ForeColor="Red" />--%>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning pull-left" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-success" Text="Save" ID="savesubcomponent" OnClick="savesubcomponent_Click"/>
                </div>
            </div>

        </div>
    </div>
    <div id="viewResourceSubcomponentsModal" class="modal fade" role="dialog">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <center><h5 class="modal-title" style="color:red">Sub Components Details For:</h5></center>
                    <asp:TextBox style="color:darkgreen" runat="server" CssClass="form-control" ID="nxtsubcomponent" ReadOnly="true"/>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="nxtsubcomponentcode" type="hidden" />
                    <asp:TextBox runat="server" ID="mtxtmaxscore" type="hidden" />
                    <asp:TextBox runat="server" ID="mlineNo" type="hidden" />
                    <div class="form-group">
                        <strong style="color:red">Check if sub component is not applicable:</strong>
                        <asp:CheckBox runat="server" CssClass="form-control" ID="nxtreccomendationchecked"/>
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Maximum Score:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" type="number" ID="nxtmaxscore" ReadOnly="true"/>
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Score:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="nxtscore" value="0" DisplayFormatString="00.00" onkeyup="checkTB(this.value)"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning pull-left" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-success" Text="Save" ID="saveResources" OnClick="saveResources_Click"/>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
