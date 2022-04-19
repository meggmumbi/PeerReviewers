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
    public partial class DownloadCurriculum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    String tFileName = "FinalCurriculum.pdf";
                    String filesFolder = @"D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card/";
                    String imprestNo = Request.QueryString["applicationNo"];
                    imprestNo = imprestNo.Replace('/', '_');
                    imprestNo = imprestNo.Replace(':', '_');
                    String documentDirectory = filesFolder + imprestNo + "/";
                    String myFile = documentDirectory + tFileName;
                    if (File.Exists(myFile))
                    {
                        string filePath = myFile;
                        Response.ContentType = ContentType;
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                        Response.WriteFile(filePath);
                        Response.End();
                }
                    else
                    {
                    documentsfeedback.InnerHtml = "<div class='alert alert-info'>Your Curriculum has not been generated, Kindly contact Commission For Universities Education, Programme Accreditation Department for more assistance!<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                }
            }
                catch(Exception m)
                {
                    documentsfeedback.InnerHtml = "<div class='alert alert-info'>"+m.Message+"<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
        }
    }
}