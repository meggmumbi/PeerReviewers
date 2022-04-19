using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class InstitutionAccreditation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    string jobNo = Request.QueryString["jobNo"];
                    string role = Request.QueryString["Role"];
                    int mRole = 0;
                    if (role == "ARCHITECT")
                    {
                        mRole = 1;
                    }
                    if (role == "LIBRARIAN")
                    {
                        mRole = 2;
                    }
                    if (role == "PROGRAM SPECIALIST")
                    {
                        mRole = 3;
                    }
                    if (role == "GOVERNANCE")
                    {
                        mRole = 4;
                    }
                    if (role == "FINANCE")
                    {
                        mRole = 5;
                    }

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
                        string Role = Request.QueryString["Role"];
                        String status = new Config().ObjNav().FnInsertTechnicalComments(techNO, vendono, jobNo, mRole);
                        String[] info = status.Split('*');
                        if (info[0] == "success")
                        {
                            if (newtechNO)
                            {
                                techNO = info[2];

                            }
                            Session["techNO"] = techNO;
                            //Response.Redirect("InstitutionAccreditation.aspx?&&techNO=" + techNO);
                        }
                        else
                        {
                            commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        }

                    }
                }
                catch (Exception m)
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-danger'> " + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertComponentItems(List<InstitutionEvaluation> cmpitems)
        {
            string tTechNo = "", tChapterCode = "", tTopicCode = "", tObservation = "", tRecommendation = "";
            string results_0 = (dynamic)null;

            try
            {

                //Check for NULL.
                if (cmpitems == null)
                    cmpitems = new List<InstitutionEvaluation>();

                //Loop and insert records.
                foreach (InstitutionEvaluation oneitem in cmpitems)
                {
                    tTechNo = oneitem.TechNo;
                    tChapterCode = oneitem.ChapterCode;
                    tTopicCode = oneitem.TopicCode;
                    tObservation = oneitem.Observation;
                    tRecommendation = oneitem.Recommendation;

                    if (string.IsNullOrWhiteSpace(tObservation))
                    {
                        results_0 = "Please enter observation";
                        return results_0;
                    }

                    if (string.IsNullOrWhiteSpace(tRecommendation))
                    {
                        results_0 = "Please enter recommendation";
                        return results_0;
                    }
                    string status = new Config().ObjNav().FnInsertTechnicalCommentsLines(tTechNo, tChapterCode, tTopicCode, tObservation, tRecommendation);
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

        protected void submittocue_Click(object sender, EventArgs e)
        {
            try
            {
                string appNo = Convert.ToString(Session["techNO"]);
                string vendono = Convert.ToString(Session["PeerCode"]);
                String status = new Config().ObjNav().FnSendTechnicalInspectionVouchersToCUE(appNo, vendono);
                String[] info = status.Split('*');
                if (info[0] == "success")
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-success'> " + info[1] + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                    "setTimeout(function() { window.location.replace('Dashboard.aspx') }, 5000);", true);
                }
                else
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }               
            }
            catch (Exception m)
            {
                commentfeedback.InnerHtml = "<div class='alert alert-danger'> " + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void deleteFile_Click(object sender, EventArgs e)
        {
            try
            {
                String tFileName = fileName.Text.Trim();
                String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "Technical Evaluation Card/";
                string imprestNo = "";
                try
                {
                    imprestNo = Convert.ToString(Session["techNO"]);
                    //if (string.IsNullOrEmpty(imprestNo))
                    //{
                    //    imprestNo = Request.QueryString["applicationNo"];
                    //}
                }
                catch
                {
                    imprestNo = "";
                }
                imprestNo = imprestNo.Replace('/', '_');
                imprestNo = imprestNo.Replace(':', '_');
                String documentDirectory = filesFolder + imprestNo + "/";
                String myFile = documentDirectory + tFileName;
                if (File.Exists(myFile))
                {
                    File.Delete(myFile);
                    if (File.Exists(myFile))
                    {
                        commentfeedback.InnerHtml = "<div class='alert alert-danger'>The file could not be deleted <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                    else
                    {
                        commentfeedback.InnerHtml = "<div class='alert alert-success'>The file was successfully deleted <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                else
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-danger'>A file with the given name does not exist in the server <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }



            }
            catch (Exception m)
            {
                commentfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

            }

        }

        protected void uploadFile_Click(object sender, EventArgs e)
        {
            bool error = false;
            string message = "";
            string accreditationNo = Convert.ToString(Session["techNO"]);
            accreditationNo = accreditationNo.Replace('/', '_');
            accreditationNo = accreditationNo.Replace(':', '_');
            string path1 = Config.FilesLocation() + "Technical Inspection Voucher/";
            string str1 = Convert.ToString(accreditationNo);
            string folderName = path1 + str1 + "/";
            try
            {
                if (appletter.HasFile)
                {
                    string extension = System.IO.Path.GetExtension(appletter.FileName);
                    if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf" || extension == ".doc" || extension == ".docx")
                    {
                        string filename = "TECHNICAL_EVALUATION_DOCUMENT" + extension;
                        if (!Directory.Exists(folderName))
                        {
                            Directory.CreateDirectory(folderName);
                        }
                        if (File.Exists(folderName + filename))
                        {
                            File.Delete(folderName + filename);
                        }
                        appletter.SaveAs(folderName + filename);
                        if (File.Exists(folderName + filename))
                        {
                            commentfeedback.InnerHtml = "<div class='alert alert-success'>The Technical Evaluation document was uploaded successfully<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        }
                    }
                    else
                    {
                        commentfeedback.InnerHtml = "<div class='alert alert-danger'>The file extension of the Technical Evaluation document is not allowed,Kindly upload PDF/Word files only<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
                else
                {
                    commentfeedback.InnerHtml = "<div class='alert alert-danger'>The file extension of the Technical Evaluation document is not allowed,Kindly upload PDF/Word files only<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                }
            }
            catch (Exception ex)
            {
                commentfeedback.InnerHtml = "<div class='alert alert-danger'>The file extension of the Technical Evaluation document is not allowed,Kindly upload PDF/Word files only " + ex.Message+"<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }

        }
    }
}