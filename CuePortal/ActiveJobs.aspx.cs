using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace CicPortal
{
    public partial class ActiveJobs : System.Web.UI.Page
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
              
            }

            if (!IsPostBack)
            {

            }
        }

        protected void addComment_OnClick(object sender, EventArgs e)
        {
            try
            {
                int nlineno = Convert.ToInt32(editLineno.Text.Trim());
                string prjcode = editapp.Text.Trim();
                string resource = editresource.Text.Trim();
                string type = edittype.Text.Trim();
                int EvalCategory = Convert.ToInt32(evaltype.SelectedValue);
                Boolean error = false;
                String message = "";

                try
                {
                    EvalCategory = Convert.ToInt32(EvalCategory);
                }
                catch (Exception)
                {
                    error = true;
                    message = "Please select evaluation category";
                }
                if (error)
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    String evalNo = "";
                    Boolean newevalNo = false;
                    try
                    {

                        evalNo = Request.QueryString["evalNo"];
                        if (String.IsNullOrEmpty(evalNo))
                        {
                            evalNo = "";
                            newevalNo = true;
                        }
                    }
                    catch (Exception)
                    {

                        evalNo = "";
                        newevalNo = true;
                    }

                    string AppNo = Request.QueryString["AppNo"];
                    String status = new Config().ObjNav().FnAddProgrammeEvaluationAndSiteLines(evalNo, prjcode, resource, EvalCategory);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        if (newevalNo)   
                        {
                            evalNo = info[2];

                        }
                        Response.Redirect("Evaluation_Component.aspx?&&evalNo=" + evalNo + "&&ApplicationNo=" + prjcode + "&&LineNo=" + nlineno + "&&type=" + type);
                    }
                    else
                    {
                        commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
            }
            catch (Exception m)
            {
                commentfeedback.InnerHtml = "<div class='alert alert-danger'> "+m.Message+"<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void EvaluationType_SelectedIndexChanged(object sender, EventArgs e)
        {
            String myType = Convert.ToString(Session["PeerCode"]);
            int lineno = Convert.ToInt32(editLineno.Text.Trim());
            var subComponents = Config.ReturnNav().EvaluationTeamType.Where(x=> x.Code == lineno && x.Account_No == myType);
            foreach (var team in subComponents)
            {
                if (team.Team_Leader == true)
                {
                    evaltype.Items.FindByValue("1").Enabled = true;
                }
                else
                {
                    evaltype.Items.FindByValue("1").Enabled = false;
                }

            }
        }
        protected void EvaluationType_SelectedIndexChanged1(object sender, EventArgs e)
        {
            String myType = Convert.ToString(Session["PeerCode"]);
            int lineno = Convert.ToInt32(editLineno1.Text.Trim());
            var subComponents = Config.ReturnNav().EvaluationTeamType.Where(x => x.Code == lineno && x.Account_No == myType);
            foreach (var team in subComponents)
            {
                if (team.Team_Leader == true)
                {
                    evaltype.Items.FindByValue("1").Enabled = true;
                }
                else
                {
                    evaltype.Items.FindByValue("1").Enabled = false;
                }

            }
        }

        protected void addinstitutioncomments_Click(object sender, EventArgs e)
        {
            try
            {
                string tApplicationno = txttechno.Text.Trim();
                int tUsertpe = txtusertype.SelectedIndex;
                Boolean error = false;
                String message = "";

                if (error)
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    String techNO = "";
                    Boolean newtechNO = false;
                    try
                    {

                        techNO = Request.QueryString["techNO"];
                        if (String.IsNullOrEmpty(techNO))
                        {
                            techNO = "";
                            newtechNO = true;
                        }
                    }
                    catch (Exception)
                    {

                        techNO = "";
                        newtechNO = true;
                    }

                    string vendono = Convert.ToString(Session["PeerCode"]);
                    String status = new Config().ObjNav().FnInsertTechnicalComments(techNO, vendono, tApplicationno, tUsertpe);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        if (newtechNO)
                        {
                            techNO = info[2];

                        }
                        Response.Redirect("InstitutionAccreditation.aspx?&&techNO=" + techNO);
                    }
                    else
                    {
                        commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
            }
            catch (Exception m)
            {
                commentfeedback.InnerHtml = "<div class='alert alert-danger'> "+m.Message+" <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void AddcommentCollab_Click(object sender, EventArgs e)
        {
            try
            {
                int nlineno = Convert.ToInt32(editLineno1.Text.Trim());
                string prjcode = editapp1.Text.Trim();
                string resource = editresource1.Text.Trim();
                string type = edittype1.Text.Trim();
                int EvalCategory = Convert.ToInt32(evaltype1.SelectedValue);
                Boolean error = false;
                String message = "";

                try
                {
                    EvalCategory = Convert.ToInt32(EvalCategory);
                }
                catch (Exception)
                {
                    error = true;
                    message = "Please select evaluation category";
                }
                if (error)
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    String evalNo = "";
                    Boolean newevalNo = false;
                    try
                    {

                        evalNo = Request.QueryString["evalNo"];
                        if (String.IsNullOrEmpty(evalNo))
                        {
                            evalNo = "";
                            newevalNo = true;
                        }
                    }
                    catch (Exception)
                    {

                        evalNo = "";
                        newevalNo = true;
                    }

                    string AppNo = Request.QueryString["AppNo"];
                    String status = new Config().ObjNav().FnAddCollaborationEvaluationAndSiteLines(evalNo, prjcode, resource, EvalCategory);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        if (newevalNo)
                        {
                            evalNo = info[2];

                        }
                        Response.Redirect("Evaluation_Component.aspx?&&evalNo=" + evalNo + "&&ApplicationNo=" + prjcode + "&&LineNo=" + nlineno + "&&type=" + type);
                    }
                    else
                    {
                        commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
            }
            catch (Exception m)
            {
                commentfeedback.InnerHtml = "<div class='alert alert-danger'> " + m.Message + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void AddCommentsVer_Click(object sender, EventArgs e)
        {
            try
            {
                int nlineno = Convert.ToInt32(editLineno2.Text.Trim());
                string prjcode = editapp2.Text.Trim();
                string resource = editresource2.Text.Trim();
                string type = edittype2.Text.Trim();
                int EvalCategory = Convert.ToInt32(evaltype2.SelectedValue);
                Boolean error = false;
                String message = "";

                try
                {
                    EvalCategory = Convert.ToInt32(EvalCategory);
                }
                catch (Exception)
                {
                    error = true;
                    message = "Please select evaluation category";
                }
                if (error)
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    String evalNo = "";
                    Boolean newevalNo = false;
                    try
                    {

                        evalNo = Request.QueryString["evalNo"];
                        if (String.IsNullOrEmpty(evalNo))
                        {
                            evalNo = "";
                            newevalNo = true;
                        }
                    }
                    catch (Exception)
                    {

                        evalNo = "";
                        newevalNo = true;
                    }

                    string AppNo = Request.QueryString["AppNo"];
                    String status = new Config().ObjNav().FnAddCollaborationVerificationEvaluationAndSiteLines(evalNo, prjcode, resource, EvalCategory);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        if (newevalNo)
                        {
                            evalNo = info[2];

                        }
                        Response.Redirect("Evaluation_Component.aspx?&&evalNo=" + evalNo + "&&ApplicationNo=" + prjcode + "&&LineNo=" + nlineno + "&&type=" + type);
                    }
                    else
                    {
                        commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
            }
            catch (Exception m)
            {
                commentfeedback.InnerHtml = "<div class='alert alert-danger'> " + m.Message + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
        //protected void addauditcomment_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string tAppno = txtappno.Text.Trim();
        //        string tFeedback = feedbacktype.SelectedValue;
        //        Boolean error = false;
        //        String message = "";

        //        if (error)
        //        {
        //            commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //        }
        //        else
        //        {
        //            String auditNo = "";
        //            Boolean newauditNo = false;
        //            try
        //            {

        //                auditNo = Request.QueryString["auditNo"];
        //                if (String.IsNullOrEmpty(auditNo))
        //                {
        //                    auditNo = "";
        //                    newauditNo = true;
        //                }
        //            }
        //            catch (Exception)
        //            {

        //                auditNo = "";
        //                newauditNo = true;
        //            }

        //            string resourceNo = Convert.ToString(Session["PeerCode"]);
        //            String status = new Config().ObjNav().FnInsertAuditExitReport(auditNo, tFeedback, resourceNo, tAppno);
        //            String[] info = status.Split('*');
        //            if (info[0] == "success")
        //            {
        //                if (newauditNo)
        //                {
        //                    auditNo = info[2];

        //                }
        //                Response.Redirect("AuditExitReport.aspx?&&auditNo=" + auditNo);
        //            }
        //            else
        //            {
        //                commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //            }

        //        }
        //    }
        //    catch (Exception m)
        //    {
        //        commentfeedback.InnerHtml = "<div class='alert alert-danger'> " + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //    }
        //}
    }
}