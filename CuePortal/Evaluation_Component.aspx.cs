using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace CicPortal
{
    public partial class Evaluation_Component : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string evalNo = Request.QueryString["evalNo"];
                string str = evalNo.Substring(0, 7);
                if (str == "PROGCVN")
                {
                    var pp = Config.ReturnNav().ProgrammeEvaluationHeader.Where(x => x.Code == evalNo).ToList();
                    foreach (var itm in pp)
                    {
                        maximum.Text = Convert.ToString(itm.Maximum_Aggregate_Score);
                        aggregate.Text = Convert.ToString(itm.Aggregate_Score);
                        percentage.Text = Convert.ToString(itm.Percentage_Score);
                    }
                }
                else if (str == "PROGINS")
                {
                    var site = Config.ReturnNav().programmeSiteEvaluation.Where(x => x.Code == evalNo).ToList();
                    foreach(var itm in site)
                    {
                        maximum.Text = Convert.ToString(itm.Maximum_Aggregate_Score);
                        aggregate.Text = Convert.ToString(itm.Aggregate_Score);
                        percentage.Text = Convert.ToString(itm.Percentage_Score);
                    }
                }
                else
                {
                    var site = Config.ReturnNav().collaborationCurriculum.Where(x => x.Code == evalNo).ToList();
                    foreach (var itm in site)
                    {
                        maximum.Text = Convert.ToString(itm.Maximum_Aggregate_Score);
                        aggregate.Text = Convert.ToString(itm.Aggregate_Score);
                        percentage.Text = Convert.ToString(itm.Percentage_Score);
                    }

                }
            }
        }
        protected void Submit_click(object sender, EventArgs e)
        {
            try
            {
                string ApplicationNo = Request.QueryString["ApplicationNo"];
                string evalNo = Request.QueryString["evalNo"];
                string tVerdictdate = verdictdate.Text.Trim();
                int tnlineno = Convert.ToInt32(Request.QueryString["nlineno"]);
                Boolean error = false;
                String message = "";
                var collaborationtype = Config.ReturnNav().LicenceApplicationHeader.Where(x => x.Application_No == ApplicationNo).ToList();
                var type = Config.ReturnNav().programAccreditationTable.Where(x => x.Accreditation_No == ApplicationNo && x.Current_Version == true).ToList();
                if (type.Count > 0)
                {
                    foreach (var mytype in type)
                    {
                        if (mytype.Status == "Awaiting Peer Review")
                        {
                            string surrenderData = new Config().ObjNav().FnGetPAPeerCommentsEach(evalNo);
                            String[] data = surrenderData.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);

                            if (data != null)
                            {
                                foreach (var arr in data)
                                {
                                    if (arr[0] < 0 || Convert.ToString(arr[3]) == "No")
                                    {
                                        error = true;
                                        message = "You have not saved all the sub - components for the component: " + arr[5] + ", kindly fill the empty sub - components before submitting the assignment.";
                                    }
                                }
                            }
                            if (string.IsNullOrEmpty(tVerdictdate))
                            {
                                error = true;
                                message = "Please enter verdict date to proceed";
                            }
                            if (error)
                            {
                                feedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                            }
                            else
                            {

                                String status = new Config().ObjNav().AddVerdictDate(evalNo, tVerdictdate, Convert.ToString(Session["PeerCode"]), ApplicationNo, 0);
                                String[] info = status.Split('*');
                                if (info[0] == "success")
                                {
                                    feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                                    "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 8000);", true);
                                }
                                else
                                {
                                    feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                }

                            }
                        }
                        else if (mytype.Status == "Verification of Academic Resources")
                        {
                            var site = Config.ReturnNav().Programmesitelines.Where(x => x.Application_No == evalNo).ToList();
                            foreach (var mysite in site)
                            {
                                if (mysite.Strength.Length < 0 || mysite.Weakness.Length < 0 || mysite.Recommendation.Length < 0 || mysite.Not_Applicable == false)
                                {
                                    error = true;
                                    message = "You have not saved all the sub - components for the component: " + mysite.Component_Description + ", kindly fill the empty sub - components before submitting the assignment.";
                                }
                            }
                            if (error)
                            {
                                feedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                            }
                            else
                            {

                                String status = new Config().ObjNav().AddVerdictDate(evalNo, tVerdictdate, Convert.ToString(Session["PeerCode"]), ApplicationNo, 1);
                                String[] info = status.Split('*');
                                if (info[0] == "success")
                                {
                                    feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                                    "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 8000);", true);
                                }
                                else
                                {
                                    feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                }

                            }

                        }
                    }
                }

                  else  if (collaborationtype.Count > 0)
                    {
                        foreach (var mytype in collaborationtype)
                        {
                            if (mytype.Application_Status == "Awaiting Peer Review")
                            {
                                var site = Config.ReturnNav().CollaborationSiteLines.Where(x => x.Application_No == evalNo).ToList();
                                foreach (var mysite in site)
                                {
                                    if (mysite.Strength.Length < 0 || mysite.Weakness.Length < 0 || mysite.Recommendation.Length < 0 || mysite.Not_Applicable == false)
                                    {
                                        error = true;
                                        message = "You have not saved all the sub - components for the component: " + mysite.Component_Description + ", kindly fill the empty sub - components before submitting the assignment.";
                                    }
                                }
                                if (error)
                                {
                                    feedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                }
                                else
                                {


                                    String status = new Config().ObjNav().AddVerdictDateCollaboration(evalNo, Convert.ToDateTime(tVerdictdate), Convert.ToString(Session["PeerCode"]), ApplicationNo, 0);
                                    String[] info = status.Split('*');
                                    if (info[0] == "success")
                                    {
                                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 8000);", true);
                                    }
                                    else
                                    {
                                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }

                                }
                            }
                            else if (mytype.Appeal_Status == "Awaiting Site Visit")
                            {
                                var site = Config.ReturnNav().CollaborationSiteLines.Where(x => x.Application_No == evalNo).ToList();
                                foreach (var mysite in site)
                                {
                                    if (mysite.Strength.Length < 0 || mysite.Weakness.Length < 0 || mysite.Recommendation.Length < 0 || mysite.Not_Applicable == false)
                                    {
                                        error = true;
                                        message = "You have not saved all the sub - components for the component: " + mysite.Component_Description + ", kindly fill the empty sub - components before submitting the assignment.";
                                    }
                                }
                                if (error)
                                {
                                    feedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                }
                                else
                                {


                                    String status = new Config().ObjNav().AddVerdictDateCollaboration(evalNo, Convert.ToDateTime(tVerdictdate), Convert.ToString(Session["PeerCode"]), ApplicationNo, 0);
                                    String[] info = status.Split('*');
                                    if (info[0] == "success")
                                    {
                                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 8000);", true);
                                    }
                                    else
                                    {
                                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }

                                }
                            }

                        }
                }
            }
            catch (Exception m)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void previous_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActiveJobs.aspx");
        }

        protected void preview_Click(object sender, EventArgs e)
        {
            string evalNo = Request.QueryString["evalNo"];        
            string str = evalNo.Substring(0, 7);
            if (str == "PROGCVN")
            {
                Response.Redirect("AssignmentReport.aspx?evalNo=" + evalNo);
            }
            else if (str == "PROGINS")
            {
                Response.Redirect("SiteAssignmentReport.aspx?evalNo=" + evalNo);
            }
        }

        protected void saveResources_Click(object sender, EventArgs e)
        {
            try
            {
                string docNo = Request.QueryString["evalNo"];
                string ccode = mlineNo.Text.Trim();
                int tentryno = Convert.ToInt32(mentryNo.Text.Trim());
                string str = nxtstrength.Text.Trim();
                string weak = nxtweakness.Text.Trim();
                string rec = nxtreccomendation.Text.Trim();
                string type = Request.QueryString["type"];
                if (type == "Curriculum Document Review")
                {
                    String status = new Config().ObjNav().FnSaveCollaborationSiteComponentComments(ccode, docNo, tentryno, str, weak, rec);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-info'>" + info[1] + "</div>";
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (type == "Verification of Academic Resources")
                {
                    String status = new Config().ObjNav().FnSaveCollaborationSiteComponentComments(ccode, docNo, tentryno, str, weak, rec);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-info'>" + info[1] + "</div>";
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else
                {
                    String status = new Config().ObjNav().FnSavePASiteComponentComments(ccode, docNo, tentryno, str, weak, rec);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-info'>" + info[1] + "</div>";
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch(Exception m)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void savecomment_Click(object sender, EventArgs e)
        {
            try
            {
                string docNo = Request.QueryString["evalNo"];
                string rec = overall.Text.Trim();
                string type = Request.QueryString["type"];
                if (type == "Curriculum Document Review")
                {
                    String status = new Config().ObjNav().FnSaveOverallCommentCurriculum(docNo, rec);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-info'>" + info[1] + "</div>";
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (type == "Verification of Academic Resources")
                {
                    String status = new Config().ObjNav().FnSaveOverallCommentCurriculum(docNo, rec);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-info'>" + info[1] + "</div>";
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else
                {

                    String status = new Config().ObjNav().FnSaveOverallComment(docNo, rec);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-info'>" + info[1] + "</div>";
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
    }
}