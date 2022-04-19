using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class AuditExitReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    string tAppno = Request.QueryString["appNo"];
                    Boolean error = false;
                    String message = "";

                    if (error)
                    {
                        myfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                    else
                    {
                        String auditNo = "";
                        Boolean newauditNo = false;
                        try
                        {

                            auditNo = Request.QueryString["auditNo"];
                            if (String.IsNullOrEmpty(auditNo))
                            {
                                auditNo = "";
                                newauditNo = true;
                            }
                        }
                        catch (Exception)
                        {

                            auditNo = "";
                            newauditNo = true;
                        }

                        string resourceNo = Convert.ToString(Session["PeerCode"]);
                        String status = new Config().ObjNav().FnInsertAuditExitReport(auditNo, resourceNo, tAppno);
                        String[] info = status.Split('*');
                        if (info[0] == "success")
                        {
                            if (newauditNo)
                            {
                                auditNo = info[2];

                            }
                            Response.Redirect("AuditExitReport.aspx?&&auditNo=" + auditNo);
                        }
                        else
                        {
                            myfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        }

                    }
                }
                catch (Exception m)
                {
                    //myfeedback.InnerHtml = "<div class='alert alert-danger'> " + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertComponentItems(List<AuditDataInfo> cmpitems)
        {
            string tTechNo = "", tSectionCode = "", tSectionDesc = "", tFindings = "", tStrength = "", tWeakness = "", tRecommendation = "";
            string results_0 = (dynamic)null;

            try
            {

                //Check for NULL.
                if (cmpitems == null)
                    cmpitems = new List<AuditDataInfo>();

                //Loop and insert records.
                foreach (AuditDataInfo oneitem in cmpitems)
                {
                    tTechNo = oneitem.TechNo;
                    tSectionCode = oneitem.SectionCode;
                    tSectionDesc = oneitem.SectionDesc;
                    tFindings = oneitem.Findings;
                    tStrength = oneitem.Strength;
                    tWeakness = oneitem.Weakness;
                    tRecommendation = oneitem.Recommendation;

                    if (string.IsNullOrWhiteSpace(tFindings))
                    {
                        results_0 = "Please enter findings";
                        return results_0;
                    }

                    if (string.IsNullOrWhiteSpace(tStrength))
                    {
                        results_0 = "Please enter strength";
                        return results_0;
                    }

                    if (string.IsNullOrWhiteSpace(tWeakness))
                    {
                        results_0 = "Please enter weakness";
                        return results_0;
                    }

                    if (string.IsNullOrWhiteSpace(tRecommendation))
                    {
                        results_0 = "Please enter recommendation";
                        return results_0;
                    }

                    string status = new Config().ObjNav().FnInsertAuditLines(tTechNo, tSectionCode, tFindings, tStrength, tWeakness, tRecommendation);
                    string[] info = status.Split('*');
                    results_0 = info[0];
                }
            }
            catch (Exception ex)
            {
                results_0 = ex.Message;
            }
            return results_0;
        }

        protected void homepage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActiveJobs.aspx");
        }

        protected void submittocue_Click(object sender, EventArgs e)
        {
            try
            {
                string auditNo = Request.QueryString["auditNo"];
                string status = new Config().ObjNav().FnSubmitEmailAuditEvaluation(auditNo);
                String[] info = status.Split('*');
                if (info[0] == "success")
                {
                    myfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                    "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                }
                else
                {
                    myfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
            catch (Exception ex)
            {
                myfeedback.InnerHtml = "<div class='alert alert-danger'>" + ex.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
    }
}