using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Http.Results;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class Sub_Components : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertComponentItems(List<ComponentModel> cmpitems)
        {
            string tComponent = "", tSubcomponent = "", tWeakness = "", tStrength = "", tReccommendation = "", tEvalNo = "", tApplicationNo = "";
            decimal tScore = 0;
            decimal tMaxscore = 0;
            string results_0 = (dynamic)null;
            string tMystatus = "";
            try
            {
                
                //Check for NULL.
                if (cmpitems == null)
                    cmpitems = new List<ComponentModel>();

                //Loop and insert records.
                foreach (ComponentModel oneitem in cmpitems)
                {                
                    tComponent = oneitem.component;
                    tSubcomponent = oneitem.subcomponent;
                    tStrength = oneitem.strength;
                    tWeakness = oneitem.weakness;
                    tReccommendation = oneitem.recommendation;
                    tScore = oneitem.score;
                    tMaxscore = oneitem.maximumscore;
                    tEvalNo = oneitem.evalNo;
                    tMystatus = oneitem.mystatus;
                    tApplicationNo = oneitem.applicationNo;

                    if (string.IsNullOrWhiteSpace(tComponent))
                    {
                        results_0 = "Component cannot be null";
                        return results_0;
                    }

                    if (string.IsNullOrWhiteSpace(tStrength))
                    {
                        tStrength = "";
                        //results_0 = "Please enter strength";
                        //return results_0;
                    }

                    if (string.IsNullOrWhiteSpace(tSubcomponent))
                    {
                        tSubcomponent = "";
                        //results_0 = "Subcomponent cannot be null";
                        //return results_0;
                    }

                    if (string.IsNullOrWhiteSpace(tWeakness))
                    {
                        tWeakness = "";
                        //results_0 = "please enter weakness";
                        //return results_0;
                    }

                    if (string.IsNullOrWhiteSpace(tReccommendation))
                    {
                        tReccommendation = "";
                        //results_0 = "Please enter recommendation";
                        //return results_0;
                    }
                    if (string.IsNullOrWhiteSpace(tScore.ToString(CultureInfo.InvariantCulture)))
                    {
                        tScore = 0;
                        //results_0 = "Please enter score!";
                        //return results_0;
                    }
                    if (tScore > tMaxscore)
                    {
                        results_0 = "The score " + tScore + " entered is greater than the maximum score, kindly use a score that is between zero and the maximum score!!";
                        return results_0;
                    }
                    if (tScore < 0)
                    {
                        results_0 = "The score " + tScore + " entered is less than zero, kindly use a score that is between zero and the maximum score!!";
                        return results_0;
                    }
                    if (tMystatus == "Verification of Academic Resources")
                    {
                        //string status = new Config().ObjNav().AddProgrammeAccComments(tApplicationNo, tEvalNo, tComponent, tSubcomponent, tStrength, tWeakness, tReccommendation, tScore);
                        //string[] info = status.Split('*');
                        //results_0 = info[0];
                    }
                    else
                    {
                        string status = new Config().ObjNav().AddPeerReviewersEvaluation1(tApplicationNo, tEvalNo, tComponent, tSubcomponent, tStrength, tWeakness, tReccommendation, tScore,false);
                        string[] info = status.Split('*');
                        results_0 = info[0];
                    }
                }
            }
            catch (Exception ex)
            {
                results_0= ex.Message;
            }
            return results_0;
        }

        protected void Back_click(object sender, EventArgs e)
        {
            string evalNo = Request.QueryString["evalNo"]; 
            string ApplicationNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("Evaluation_Component.aspx?&&evalNo=" + evalNo + "&&ApplicationNo=" + ApplicationNo);
        }
        
    }
}