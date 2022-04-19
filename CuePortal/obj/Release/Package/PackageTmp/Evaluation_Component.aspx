<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Evaluation_Component.aspx.cs" Inherits="CicPortal.Evaluation_Component"  MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="CicPortal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Components</li>
            </ol>
        </div>
    </div>
<div class="row" style="margin: 10px;">
    <div runat="server" id="feedback"></div>
    <div class="panel panel-green">
        <div class="panel-heading">All Available Components</div>
        <div class="panel-body">
            <asp:Button runat="server" CssClass="btn btn-info pull-right" ID="preview" Text="Preview/Print Assignment" OnClick="preview_Click" CausesValidation="false"/>
            <br />
            <br />
            <div class="table-responsive">
            <table class="table table-bordered table-striped" id="dataTables-example">
                <thead>
                <tr>
                    <th>Component Code</th>
                    <th>Component Description</th>
                    <th>Actions</th>
                 
                </tr>
                </thead>
                <tbody>
                <%
                    string ApplicationNo = Request.QueryString["ApplicationNo"];
                    var type = Config.ReturnNav().programAccreditationTable.Where(x => x.Accreditation_No == ApplicationNo && x.Current_Version == true).ToList();
                    foreach(var mytype in type)
                    {
                        ApplicationNo = mytype.Accreditation_No;
                        if(mytype.Status == "Awaiting Peer Review")
                        {
                            var projects = Config.ReturnNav().ProgramEvalutionComponents.ToList();
                            foreach(var project in projects)
                            {
                            %>

                                <tr>
                                    <td><%=project.Code %></td>
                                    <td><%=project.Component_Description %></td>
                                    <td><a href="SubComponents.aspx?cCode=<%=project.Code %>&&evalNo=<%=Request.QueryString["evalNo"] %>&&mystatus=<%=mytype.Status %>&&ApplicationNo=<%=mytype.Accreditation_No %>&&component=<%=project.Component_Description %>">
                                        <label class="btn btn-success">Add Subcomponent Comments</label></a></td>
                                </tr>
                                <%
                            }

                        }
                        else if(mytype.Status == "Verification of Academic Resources")
                        {
                            bool applicable = false;
                            string strength = "";
                            string weakness = "";
                            string rec = "";

                                string surrenderData = new Config().ObjNav().FnGetPASiteComponentComments(Request.QueryString["evalNo"]);
                                String[] info = surrenderData.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);
                                if (info != null)
                                {
                                    foreach (var allInfo in info)
                                    {
                                        String[] arr = allInfo.Split('*');
                                        strength = Regex.Replace(arr[2], @"[^0-9a-zA-Z]+", " ");
                                        weakness =Regex.Replace(arr[3], @"[^0-9a-zA-Z]+", " ");
                                        rec = Regex.Replace(arr[4], @"[^0-9a-zA-Z]+", " ");
                                        %>
                                        <tr>
                                            <td><%=arr[0] %></td>
                                            <td><%=arr[1] %></td>
                                            <td><a href="SubComponents.aspx?cCode=<%=arr[0] %>&&evalNo=<%=Request.QueryString["evalNo"] %>&&mystatus=<%=mytype.Status %>&&ApplicationNo=<%=mytype.Accreditation_No %>&&component=<%=arr[1] %>">
                                                <label class="btn btn-success">Add Subcomponent Scores</label></a></td>
                                                                                    <%
                                                    if (strength.Length > 0 || applicable == true)
                                                    {
                                                %>

                                                <td>
                                                    <label class="btn btn-warning" onclick="viewResourceSubcomponents('<%=arr[0] %>','<%=arr[1] %>','<%=strength %>','<%=weakness %>','<%=rec %>','<%=arr[5] %>');"><i class="fa fa-pencil"></i>Edit Details</label></td>
                                                <%
                                                    }
                                                    else
                                                    {
                                                %>

                                                <td>
                                                        <label class="btn btn-info" onclick="viewResourceSubcomponents('<%=arr[0] %>','<%=arr[1] %>','<%=strength %>','<%=weakness %>','<%=rec %>','<%=arr[5] %>');"><i class="fa fa-save"></i>Save Details</label></td>
                                                <%
                                                    }
                                                %>
                                                <%
                                                     if (strength.Length > 0 || applicable == true)
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


                %>
                </tbody>
            </table>
            </div>
        </div>
    </div>
<script>
    function viewResourceSubcomponents(lineNo, subcomponent, strength, weakness, reccomendation, entryNo) {
        document.getElementById("MainContent_nxtsubcomponent").value = subcomponent;
        document.getElementById("MainContent_nxtstrength").value = strength;
        document.getElementById("MainContent_nxtweakness").value = weakness;
        document.getElementById("MainContent_nxtreccomendation").value = reccomendation;
        document.getElementById("MainContent_mlineNo").value = lineNo;
        document.getElementById("MainContent_mentryNo").value = entryNo;
        $("#viewResourceSubcomponentsModal").modal();
    }
</script>
    <div class="panel panel-green">
        <div class="panel-heading">Assignment Scores</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6 col-lg-6">
                    <strong style="color:red">Maximum Aggregate Score</strong><br />
                    <asp:TextBox runat="server" ID="maximum" CssClass="form-control" ReadOnly="true"/>
                </div>
                <div class="col-md-6 col-lg-6">
                    <strong style="color:red">Aggregate Score</strong><br />
                    <asp:TextBox runat="server" ID="aggregate" CssClass="form-control" ReadOnly="true"/>
                </div>
                <div class="col-md-6 col-lg-6">
                    <strong style="color:red">Percentage Score</strong><br />
                    <asp:TextBox runat="server" ID="percentage" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-12 col-lg-12">
                    <h3><strong>Overall Comment</strong></h3><br />
                    <asp:TextBox runat="server" ID="overall" CssClass="form-control" TextMode="MultiLine" placeholder="Please enter comment" Height="220px"/>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-info pull-right" Text="Save Comment" ID="savecomment" OnClick="savecomment_Click" CausesValidation="false"/>
            <span class="clearfix"></span>
        </div>
</div>
    <div class="panel panel-default">
        <div class="panel-body">
            <div>            
                <label class="btn btn-success" data-toggle="modal" data-target="#addcommentsModal" style="margin-left:80%">Submit Assignment To CUE</label>
                
            </div>
        </div>
    </div>
     <asp:Button runat="server" CssClass="btn btn-warning pull-left" ID="previous" Text="Go Back"  OnClick="previous_Click" CausesValidation="false"/>
</div>


<div id="addcommentsModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
          <div runat="server" id="commentfeedback"></div>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add Verdict Date</h4>
      </div>
       <div class="modal-body">
           <p style="color:red">Are you sure you want to submit assignment? Note that report once submitted cannot be edited!</p>
         <div class="form-group">
            <strong>Verdict Date:</strong>
           <asp:TextBox CssClass="form-control" runat="server" ID="verdictdate" Placeholder="dd/mm/yy" />
        </div> 
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
          <asp:Button runat="server" CssClass="btn btn-success" Text="Submit Assignment" ID="Button1" OnClick="Submit_click" CausesValidation="false"/>
      </div>
    </div>
  </div>
</div>

<div id="viewResourceSubcomponentsModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="width:80%" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <center><h5 class="modal-title" style="color:red">Components Details For:</h5></center>
                    <asp:TextBox style="color:darkgreen" runat="server" CssClass="form-control" ID="nxtsubcomponent" ReadOnly="true"/>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="mlineNo" type="hidden" />
                    <asp:TextBox runat="server" ID="mentryNo" type="hidden" />
                    <div class="form-group">
                        <strong style="color:blue">Strength:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" Wrap="true" Rows="5" ID="nxtstrength" TextMode="MultiLine" Height="200px"/>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="nxtstrength" ErrorMessage="Please enter strength, it cannot be empty!" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Weakness:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" Wrap="true" Rows="5" ID="nxtweakness" TextMode="MultiLine" Height="200px"/>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="nxtweakness" ErrorMessage="Please enter weakness, it cannot be empty!" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <strong style="color:blue">Recommendation:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" Wrap="true" Rows="5" ID="nxtreccomendation" TextMode="MultiLine" Height="200px"/>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="nxtreccomendation" ErrorMessage="Please enter reccomendation, it cannot be empty!" ForeColor="Red" />                    
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning pull-left" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-success" Text="Save" ID="saveResources" OnClick="saveResources_Click"/>
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


    $(document).ready(function () {
        $("#<%= verdictdate.ClientID %>").datepicker({ dateFormat: "dd/mm/yy" }).val();
    });

  </script>
</asp:Content>
