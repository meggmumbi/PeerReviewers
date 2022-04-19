using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class FeedBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getWorkOrder();
            }
        }
        protected void getWorkOrder()
        {
            var nav = Config.ReturnNav();
            string PeerCode = Convert.ToString(Session["PeerCode"]);
            var txtworkorder = nav.ResourceAllocation.Where(x=> x.Account_No == PeerCode && x.ApprovalStatus == "Approved").ToList();
            workorder.DataSource = txtworkorder;
            workorder.DataTextField = "Job_Name";
            workorder.DataValueField = "Job_No";
            workorder.DataBind();

        }

        protected void next_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "";
                bool error = false;
                string tWorkorder = workorder.SelectedValue;
                if (string.IsNullOrEmpty(tWorkorder))
                {
                    error = true;
                    message = "Please enter address";
                }
                if (error)
                {
                    headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    String feedbackNo = "";
                    Boolean newfeedbackNo = false;
                    try
                    {

                        feedbackNo = Request.QueryString["evalNo"];
                        if (String.IsNullOrEmpty(feedbackNo))
                        {
                            feedbackNo = "";
                            newfeedbackNo = true;
                        }
                    }
                    catch (Exception)
                    {

                        feedbackNo = "";
                        newfeedbackNo = true;
                    }

                    string peercode = Convert.ToString(Session["PeerCode"]);
                    string status = new Config().ObjNav().FnSubmitPeerFeedback(feedbackNo, peercode, tWorkorder);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        if (newfeedbackNo)
                        {
                            feedbackNo = info[2];
                        }
                        Response.Redirect("FeedBack.aspx?step=2&&feedbackNo=" + feedbackNo);
                    }
                    else
                    {
                        headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception ex)
            {
                headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + ex.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            string feedbackNo = Request.QueryString["feedbackNo"];
            Response.Redirect("FeedBack.aspx?step=1&&feedbackNo=" + feedbackNo);
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertComponentItems(List<FeedbackModel> cmpitems)
        {
            string tComponent = "", tfeedbackNo = "";
            decimal tScore = 0;
            decimal tMaxscore = 0;
            string results_0 = (dynamic)null;
            try
            {

                //Check for NULL.
                //if (cmpitems == null)
                //    cmpitems = new List<FeedbackModel>();

                //Loop and insert records.
                foreach (FeedbackModel oneitem in cmpitems)
                {
                    tfeedbackNo = oneitem.TfeedbackNo;
                    tComponent = oneitem.TcomponentCode;
                    tMaxscore = oneitem.Tmaximumscore;
                    tScore = oneitem.Tscore;

                    if (string.IsNullOrWhiteSpace(tScore.ToString(CultureInfo.InvariantCulture)))
                    {
                        results_0 = "Please enter score!";
                        return results_0;
                    }
                    if (tScore > tMaxscore)
                    {
                        results_0 = "The score " + tScore + "is greater than the maximum score, kindly use a score that is smaller than the maximum score!";
                        return results_0;
                    }
                    if (tScore < 0 )
                    {
                        results_0 = "The score " + tScore + "is less than zero, kindly use a score that is greater than zero and smaller than the maximum score!";
                        return results_0;
                    }

                    string status = new Config().ObjNav().FnSubmitPeerFeedbackLines(tfeedbackNo, tComponent, tScore);
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

        protected void workorder_SelectedIndexChanged(object sender, EventArgs e)
        {
            string jobno = workorder.SelectedValue;
            var nav = Config.ReturnNav();
            var jobs = nav.ResourceAllocation.Where(x => x.Job_No == jobno);
            foreach (var tJob in jobs)
            {
                programmename.Text = tJob.Programme_Name;
            }
        }
    }
}