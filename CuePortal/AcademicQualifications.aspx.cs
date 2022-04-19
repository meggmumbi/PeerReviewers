using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Globalization;
using System.IO;

namespace CicPortal
{
    public partial class AcademicQualifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //_populateDdlList();
            }
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
           //     Response.Redirect("Settings.aspx");
            }
            
        }
        public string _getFileextension(HttpPostedFile filename)
        {
            return (Path.GetExtension(filename.FileName));
        }

        protected void addQualification_Click(object sender, EventArgs e)
        {
            //string tDescription = ddlAcQualific.SelectedItem.Text,
            //    tInstitution = institution.Text.Trim(),
            //    tSpecialization = areaOfSpecialization.Text.Trim(),
            //    countryofQualic = ddlCountries.SelectedItem.Text,
            //    tDuration = durationOfStudy.Text.Trim();
            //    int mDuration = Convert.ToInt32(tDuration);

            //    var filesFolder = Server.MapPath("~/Uploads");
            //    var newFilename = (string)Session["Name"];
            //    // string extension = Path.GetExtension(cvUpload.FileName);
            //    string ext0 = _getFileextension(certificate.PostedFile);
            //    string ext1 = _getFileextension(evidence.PostedFile);
            //    var vendorNo = Convert.ToString(Session["PeerCode"]);
            //    vendorNo = vendorNo.Replace("/", "[58]");
            //    vendorNo = vendorNo.Replace(":", "[47]");

            //if (new Config().IsAllowedExtension(ext0)|| new Config().IsAllowedExtension(ext1))
            //{
            //    var documentDirectory = Path.Combine(filesFolder, "Vendor Card/" + vendorNo);
            //    string savedF0 = newFilename + "_Certified Academic Certificate" + ext0;
            //    string savedF1 = newFilename + "_Evidence of Recognition" + ext1;


            //    if (!Directory.Exists(documentDirectory))
            //        Directory.CreateDirectory(documentDirectory);

            //    certificate.SaveAs(documentDirectory + "/" + savedF0);
            //    evidence.SaveAs(documentDirectory + "/" + savedF1);
            //    uploadfeedback.InnerHtml = "<div class='alert alert-success'>Your documents was successfully uploaded. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

            //}
            //else
            //{
            //    uploadfeedback.InnerHtml = "<div class='alert alert-danger'>Unaccepted file extension detected! <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            //}

            //string response = new Config().ObjNav().AddPeerAcademicQualifications(Convert.ToString(Session["PeerCode"]),
            //        Convert.ToString(Session["Password"]), tDescription, 2017, tInstitution, tSpecialization, mDuration, countryofQualic);
            //string[] info = response.Split('*');
            //feedback.InnerHtml = "<div class='alert alert-"+ info [0]+ "'>"+info[1]+"</div>";

        }
        protected void editQualifications_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "";
                bool error = false;
                string tDescription = editdesc.SelectedValue;
                //string tCountry = ddlCountries.SelectedValue;
                string tYearobtained = editdateobtained.Text.Trim();
                string tInstitution = editinstitution.Text.Trim();
                string tDuration = editduration.Text.Trim();
                string tAreaOfSpecialization = editareaofspecialization.Text.Trim();
                int mDuration = Convert.ToInt32(tDuration);
                if (string.IsNullOrEmpty(tInstitution))
                {
                    error = true;
                    message = "Please enter institution name";
                }
                if (error)
                {
                    headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {

                    string tlineno = editcode.Text.Trim();
                    int mlineno = Convert.ToInt32(tlineno);
                    string peercode = Convert.ToString(Session["PeerCode"]);
                    string status = new Config().ObjNav().FnEditPeerAcademicQualifications(peercode, mlineno, tDescription, tYearobtained, tInstitution, tAreaOfSpecialization, mDuration);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        headerfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
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
        protected void deleteQualification_Click(object sender, EventArgs e)
        {
            try
            {
                string tlineno = deletequalificationsCode.Text.Trim();
                int mlineno = Convert.ToInt32(tlineno);
                string peercode = Convert.ToString(Session["PeerCode"]);
                string status = new Config().ObjNav().FnDeletePeerAcademicQualifications(mlineno, peercode);
                String[] info = status.Split('*');
                if (info[0] == "success")
                {
                    headerfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
            catch (Exception ex)
            {
                headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + ex.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }

        }
        //public void _populateDdlList()
        //{
        //    var nav = Config.ReturnNav();
        //    var allountries = nav.countries.ToList();
        //    ddlCountries.DataSource = allountries;
        //    ddlCountries.DataTextField = "Name";
        //    ddlCountries.DataValueField = "Code";
        //    ddlCountries.DataBind();
        //    ddlCountries.Items.Insert(0, "--Select Country--");

        //    List<String> programLevels = new List<string>();
        //    programLevels.Add("--Select Program Level--");
        //    programLevels.Add("Bachelors");
        //    programLevels.Add("Masters");
        //    programLevels.Add("Doctorate");
        //    programLevels.Add("Postgraduate");
        //    programLevels.Add("Diploma");
        //    programLevels.Add("Certificate");
        //    ddlAcQualific.DataSource = programLevels;
        //    ddlAcQualific.DataBind();
        //}

        //protected void addPeerQualification_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string message = "";
        //        bool error = false;
        //        string tDescription = ddlAcQualific.SelectedValue;
        //        string tCountry = ddlCountries.SelectedValue;
        //        string tYearobtained = yearObtained.Text.Trim();
        //        string tInstitution = institution.Text.Trim();
        //        string tDuration = durationOfStudy.Text.Trim();
        //        string tAreaOfSpecialization = areaOfSpecialization.Text.Trim();
        //        int mDuration = Convert.ToInt32(tDuration);
        //        if (string.IsNullOrEmpty(tInstitution))
        //        {
        //            error = true;
        //            message = "Please enter institution name";
        //        }
        //        if (error)
        //        {
        //            headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //        }
        //        else
        //        {


        //            string peercode = Convert.ToString(Session["PeerCode"]);
        //            string status = new Config().ObjNav().AddPeerAcademicQualifications(peercode, tDescription,tYearobtained, tInstitution, tAreaOfSpecialization, mDuration, tCountry);
        //            String[] info = status.Split('*');
        //            if (info[0] == "success")
        //            {
        //                headerfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //            }
        //            else
        //            {
        //                headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + ex.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //    }
        //}
    }

}