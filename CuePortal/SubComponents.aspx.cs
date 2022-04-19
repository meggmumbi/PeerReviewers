using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class SubComponents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string evalNo = Request.QueryString["evalNo"];

            }
        }

        protected void savesubcomponent_Click(object sender, EventArgs e)
        {
            try
            {
                bool err = false;
                string msg = "";
                string tdocNo = Request.QueryString["evalNo"];
                string tAppNo = Request.QueryString["ApplicationNo"];
                string tComponentCode = Request.QueryString["cCode"];
                string tsubcomponentcode = txtsubcomponentcode.Text.Trim();
                string tstrength = txtstrength.Text.Trim();
                string tweakness = txtweakness.Text.Trim();
                string treccomendation = txtreccomendation.Text.Trim();
                string tMystatus = "";
                decimal tscore = Convert.ToDecimal(txtscore.Text.Trim());
                decimal tmaxscore = Convert.ToDecimal(ntxtmaxscore.Text.Trim());
                bool na = false;
                bool nrecchecked = txtreccomendationchecked.Checked;
                if (nrecchecked)
                {
                    na = true;
                }
                if (tscore > tmaxscore)
                {
                    err = true;
                    msg = "The score " + tscore + " entered is greater than the maximum score, kindly use a score that is between zero and the maximum score!!";
                }
                if (tscore < 0)
                {
                    err = true;
                    msg = "The score " + tscore + " entered is less than zero, kindly use a score that is between zero and the maximum score!!";
                }
                if(err)
                {
                    myfeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    string status = new Config().ObjNav().AddPeerReviewersEvaluation1(tAppNo, tdocNo, tComponentCode, tsubcomponentcode, tstrength, tweakness, treccomendation, tscore, na);
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        myfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                    else
                    {
                        myfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch(Exception m)
            {
                myfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void backtocomponents_Click(object sender, EventArgs e)
        {
            string evalNo = Request.QueryString["evalNo"];
            string mystatus = Request.QueryString["type"];
            string ApplicationNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("Evaluation_Component.aspx?&&evalNo=" + evalNo + "&&ApplicationNo=" + ApplicationNo + "&&mystatus=" + mystatus);
        }

        protected void saveResources_Click(object sender, EventArgs e)
        {
            try
            {
                bool err = false;
                string msg = ""; 
               
                string tdocNo = Request.QueryString["evalNo"];
                string tAppNo = Request.QueryString["ApplicationNo"];
                string tComponentCode = Request.QueryString["cCode"];
                int tlineno = Convert.ToInt32(mlineNo.Text.Trim());
                string tsubcomponentcode = nxtsubcomponentcode.Text.Trim();
                decimal tscore = Convert.ToDecimal(nxtscore.Text.Trim());
                decimal tmaxscore = Convert.ToDecimal(mtxtmaxscore.Text.Trim());
                bool na = false;
                bool nrecchecked = nxtreccomendationchecked.Checked;
                if (nrecchecked)
                {
                    tscore = 0;
                    na = true;
                }
                if (tscore > tmaxscore)
                {
                    err = true;
                    msg = "The score " + tscore + " entered is greater than the maximum score, kindly use a score that is between zero and the maximum score!!";
                }
                if (tscore < 0)
                {
                    err = true;
                    msg = "The score " + tscore + " entered is less than zero, kindly use a score that is between zero and the maximum score!!";
                }
                if (err)
                {
                    myfeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    var site = Config.ReturnNav().CollaborationSiteLines.Where(x => x.Evaluation_Header_No == tdocNo && x.Component_Code == tComponentCode).ToList();
                    if (site.Count > 0)
                    {
                        string mystatus = Request.QueryString["mystatus"];
                        if (mystatus == "Awaiting Peer Review")
                        {
                            string status = new Config().ObjNav().AddCollaborationComments(tlineno, tdocNo, tComponentCode, tsubcomponentcode, tscore, na);
                            string[] info = status.Split('*');
                            if (info[0] == "success")
                            {
                                myfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                            }
                            else
                            {
                                myfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                            }

                        }
                        else if (mystatus == "Awaiting Site Visit")
                        {
                            string status = new Config().ObjNav().AddCollaborationComments(tlineno, tdocNo, tComponentCode, tsubcomponentcode, tscore, na);
                            string[] info = status.Split('*');
                            if (info[0] == "success")
                            {
                                myfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                            }
                            else
                            {
                                myfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                            }
                        }
                    }
                    else
                    {
                        string status = new Config().ObjNav().AddProgrammeAccComments(tlineno, tdocNo, tComponentCode, tsubcomponentcode, tscore, na);
                        string[] info = status.Split('*');
                        if (info[0] == "success")
                        {
                            myfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        }
                        else
                        {
                            myfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        }
                    }
                }
            }
            catch (Exception m)
            {
                myfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
    }
}