using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class Job : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool changed = Convert.ToBoolean(Session["ChangedPassword"]);
                if (!changed)
                {
                    //  Response.Redirect("Settings.aspx");
                }
            }
            catch (Exception)
            {
                // ignored
            }

            if (!IsPostBack)
            {

            }
        }

        protected void acceptJob_Click(object sender, EventArgs e)
        {
            try
            {
                int code = 0;
                try
                {
                    code = Convert.ToInt32(Request.QueryString["id"].Trim());
                }
                catch (Exception)
                {
                    code = 0;
                }
                string projectType = Request.QueryString["projectType"];
                string vNo = Convert.ToString(Session["PeerCode"]);
                if (projectType == "Programme Accreditation")
                {
                    string status = new Config().ObjNav().AcceptPeerReviewerJobPA(code, vNo, true, false);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 7000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Instiution Accreditation")
                {
                    string status = new Config().ObjNav().AcceptPeerReviewerJobIA(code, vNo, true, false);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Programme Quality Audit")
                {
                    string status = new Config().ObjNav().AcceptPeerReviewerJobPQ(code, vNo, true, false);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Institution Quality Audit")
                {
                    string status = new Config().ObjNav().AcceptPeerReviewerJobIQ(code, vNo, true, false);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Curriculum Document Review")
                {
                    string status = new Config().ObjNav().AcceptPeerReviewerJobCD(code, vNo, true, false);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Verification of Academic Resources")
                {
                    string status = new Config().ObjNav().AcceptPeerReviewerJobVF(code, vNo, true, false);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }

            }
            catch (Exception t)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>"+t.Message+"</div>";
            }
        }
        protected void rejectJob_Click(object sender, EventArgs e)
        {
            try
            {
                int code = 0;
                try
                {
                    code = Convert.ToInt32(Request.QueryString["id"].Trim());
                }
                catch (Exception)
                {
                    code = 0;
                }
                string tReason = editRejection.Text.Trim();
                string projectType = Request.QueryString["projectType"];
                string vNo = Convert.ToString(Session["PeerCode"]);
                if (projectType == "Programme Accreditation")
                {
                    string status = new Config().ObjNav().RejectPeerReviewerJobPA(code, vNo, false, true, tReason);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 7000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Instiution Accreditation")
                {
                    string status = new Config().ObjNav().RejectPeerReviewerJobIA(code, vNo, false, true, tReason);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Programme Quality Audit")
                {
                    string status = new Config().ObjNav().RejectPeerReviewerJobPQ(code, vNo, false, true, tReason);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Institution Quality Audit")
                {
                    string status = new Config().ObjNav().RejectPeerReviewerJobIQ(code, vNo, false, true, tReason);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Curriculum Document Review")
                {
                    string status = new Config().ObjNav().RejectPeerReviewerJobCD(code, vNo, false, true, tReason);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else if (projectType == "Verification of Academic Resources")
                {
                    string status = new Config().ObjNav().RejectPeerReviewerJobVR(code, vNo, false, true, tReason);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                        "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }

            }
            catch (Exception t)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>" + t.Message + "</div>";
            }
        }

    }
}