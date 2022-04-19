using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Http.Results;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace CicPortal
{
    public partial class Signup_Wizard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateControlsfromDb();
            }
        }

        protected void PopulateControlsfromDb()
        {
            var nav = Config.ReturnNav();
            var postCodes = nav.postcodes;
            ddlPostCodes.DataSource = postCodes;
            ddlPostCodes.DataValueField = "Code";
            ddlPostCodes.DataTextField = "Code";
            ddlPostCodes.DataBind();
            var titles = nav.Titles;
            ddlSelTitle.DataSource = titles;
            ddlSelTitle.DataValueField = "Title_Code";
            ddlSelTitle.DataTextField = "Title_Name";
            ddlSelTitle.DataBind();
            var academicLevels = nav.AcademicLevels;
            ddlhighestAcademicQlic.DataSource = academicLevels;
            ddlhighestAcademicQlic.DataValueField = "Code";
            ddlhighestAcademicQlic.DataTextField = "Level_Name";
            ddlhighestAcademicQlic.DataBind();
          
        }

      
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string SelectedPosta(List<SignupModel> postcode)
        {
            var nav = Config.ReturnNav();
            string respostacity = "";
            string postacoda = "";
            try
            {
                //Check for NULL.
                if (postcode == null)
                    postcode = new List<SignupModel>();

                //Loop and insert records.
                foreach (SignupModel oneitem in postcode)
                {
                    postacoda = oneitem.aPostacode;
                }
                var cities = nav.postcodes.Where(r => r.Code == postacoda).ToList();
                var result = cities.FirstOrDefault();
                if (result != null)
                {
                    respostacity = result.City;
                }
            }
            catch (Exception er)
            {
               return er.Message;
               // return "notfound";
            }
            return respostacity;
        }

       // [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertNewPeerItems(List<SignupModel> signitems)
        {
            string tName = "",tIdNo = "",
                tKraPin = "",tPostAddress = "",
                tPostCode = "",tPhoneNumber = "",
                tEmailAddress = "",tPassword = "",
                tConfirmPassword = "";
                string tHighestAcademicLevels= "";
                string tTitle = "";
                string results_0 = (dynamic)null;
                string results_1 = (dynamic)null;
            try
            {
                //Check for NULL.
                if (signitems == null)
                    signitems = new List<SignupModel>();

                //Loop and insert records.
                foreach (SignupModel oneitem in signitems)
                {
                    tName = oneitem.fullName;
                    tIdNo = oneitem.idNumber;
                    tPostCode = oneitem.postCode;
                    tPostAddress = oneitem.postAddress;
                    tPhoneNumber = oneitem.phoneNumber;
                    tEmailAddress = oneitem.eMail;
                    tPassword = oneitem.password;
                    tConfirmPassword = oneitem.passwordConfirmed;
                }

                //if (string.IsNullOrWhiteSpace(oneitems.Unit_Price.ToString(CultureInfo.InvariantCulture)))
                //    return Json("unitpriceEmpty", JsonRequestBehavior.AllowGet);

                string status = new Config().ObjNav()
                    .FnRegisterPeerReviewer(tName, tIdNo, tPhoneNumber, tEmailAddress, tKraPin, tPostAddress, tPostCode,
                        tPassword, tConfirmPassword, tHighestAcademicLevels, tTitle);
                HttpContext.Current.Session["iVendorNo"] = new Config().ObjNav().FnGetVendornNumber(tIdNo);
                var vendNo = HttpContext.Current.Session["iVendorNo"].ToString();
                string[] info = status.Split('*');
                results_0 = status + "*"+vendNo;
            }
            catch (Exception ex)
            {
                return ex.Message;
               // return results_1;
            }
            return results_0;
        }

        public static string _getFileextension(HttpPostedFileBase filename)
        {
            return (Path.GetExtension(filename.FileName));
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string FnUploadDocs(List<UploadedFile> fileitems)
        {
            try
            {
                HttpPostedFileBase krpin=null, helbpin=null, cidpin=null, eaccpin=null, profpin=null, crbpin=null;
                var vendorNo = (dynamic)null;
                //Check for NULL.
                if (fileitems == null)
                    fileitems = new List<UploadedFile>();

                //Loop and insert records.
                foreach (UploadedFile oneitem in fileitems)
                {
                    krpin = oneitem.krapinFile;
                    helbpin = oneitem.helbFile;
                    cidpin = oneitem.cidFile;
                    eaccpin = oneitem.eaccFile;
                    profpin = oneitem.profdFile;
                    crbpin = oneitem.crbFile;
                    vendorNo = oneitem.vendorNo;
                }


                if (vendorNo == null)
                    return "vendorNonull";
                //if (helbFile == null)
                //    return "helbFilenull";
                //if (krapinFile == null)
                //    return "KRApinnull";
                //if (cidFile == null)
                //    return "cidFilenull";
                //if (eaccFile == null)
                //    return "eaccFileFilenull";
                //if (profdFile == null)
                //    return "profdFileFilenull";
                //if (crbFile == null)
                //    return "crbFileFileFilenull";

                if (vendorNo.Contains(":"))
                    vendorNo = vendorNo.Replace(":", "[58]");
                    vendorNo = vendorNo.Replace("/", "[47]");

                var rootFolder = HttpContext.Current.Server.MapPath("~/Uploads");
                var subfolder = Path.Combine(rootFolder, "Vendor Card/" + vendorNo);
               

                if (!Directory.Exists(subfolder))
                    Directory.CreateDirectory(subfolder);

                //code to save the application on DB to come here
                string fileName0 = Path.GetFileName(krpin.FileName);
                string ext0 = _getFileextension(krpin);
                string savedF0 = vendorNo + "_KRAPIN" + ext0;

                string fileName1 = Path.GetFileName(helbpin.FileName);
                string ext1 = _getFileextension(helbpin);
                string savedF1 = vendorNo + "_HELB CERT" + ext1;

                string fileName2 = Path.GetFileName(cidpin.FileName);
                string ext2 = _getFileextension(cidpin);
                string savedF2 = vendorNo + "_CID CERT" + ext2;

                string fileName3 = Path.GetFileName(eaccpin.FileName);
                string ext3 = _getFileextension(eaccpin);
                string savedF3 = vendorNo + "_EACC CERT" + ext3;

                string fileName4 = Path.GetFileName(profpin.FileName);
                string ext4 = _getFileextension(profpin);
                string savedF4 = vendorNo + "_PROF CERT" + ext4;

                string fileName5 = Path.GetFileName(crbpin.FileName);
                string ext5 = _getFileextension(crbpin);
                string savedF5 = vendorNo + "_CRB CERT" + ext5;

                krpin.SaveAs(subfolder + "/" + savedF0);
                helbpin.SaveAs(subfolder + "/" + savedF1);
                cidpin.SaveAs(subfolder + "/" + savedF2);
                eaccpin.SaveAs(subfolder + "/" + savedF3);
                profpin.SaveAs(subfolder + "/" + savedF4);
                crbpin.SaveAs(subfolder + "/" + savedF5);
                string uploads = string.Format("{0}",
                    "<div class='form-group'>" +
                    "<h4><strong style='color: chocolate'>List of files you uploaded successfully!</strong></h4>" +
                    fileName0 + "<br/>" + fileName1 + "<br/>" + fileName2 + "<br/>" + fileName3 + "<br/>" + fileName4  +"<br/>" + fileName5 +
                    "<br/></div>");
                return "success*" + uploads;

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string FnUploadSpecRfQDocsTest(HttpPostedFileBase krapinFile,
            HttpPostedFileBase helbFile, HttpPostedFileBase cidFile,
            HttpPostedFileBase eaccFile, HttpPostedFileBase profdFile, 
            HttpPostedFileBase crbFile, string vendorNo)
        {
            try
            {
                //HttpPostedFileBase krpin = null, helbpin = null, cidpin = null, eaccpin = null, profpin = null, crbpin = null;
                //var vendorNo = (dynamic)null;
                ////Check for NULL.
                //if (fileitems == null)
                //    fileitems = new List<UploadedFile>();

                ////Loop and insert records.
                //foreach (UploadedFile oneitem in fileitems)
                //{
                //    krpin = oneitem.krapinFile;
                //    helbpin = oneitem.helbFile;
                //    cidpin = oneitem.cidFile;
                //    eaccpin = oneitem.eaccFile;
                //    profpin = oneitem.profdFile;
                //    crbpin = oneitem.crbFile;
                //    vendorNo = oneitem.vendorNo;
                //}


                if (vendorNo == null)
                    return "vendorNonull";
                //if (helbFile == null)
                //    return "helbFilenull";
                //if (krapinFile == null)
                //    return "KRApinnull";
                //if (cidFile == null)
                //    return "cidFilenull";
                //if (eaccFile == null)
                //    return "eaccFileFilenull";
                //if (profdFile == null)
                //    return "profdFileFilenull";
                //if (crbFile == null)
                //    return "crbFileFileFilenull";

                if (vendorNo.Contains(":"))
                    vendorNo = vendorNo.Replace(":", "[58]");
                vendorNo = vendorNo.Replace("/", "[47]");

                var rootFolder = HttpContext.Current.Server.MapPath("~/Uploads");
                var subfolder = Path.Combine(rootFolder, "Vendor Card/" + vendorNo);


                if (!Directory.Exists(subfolder))
                    Directory.CreateDirectory(subfolder);

                //code to save the application on DB to come here
                string fileName0 = Path.GetFileName(krapinFile.FileName);
                string ext0 = _getFileextension(krapinFile);
                string savedF0 = vendorNo + "_KRAPIN" + ext0;

                string fileName1 = Path.GetFileName(helbFile.FileName);
                string ext1 = _getFileextension(helbFile);
                string savedF1 = vendorNo + "_HELB CERT" + ext1;

                string fileName2 = Path.GetFileName(cidFile.FileName);
                string ext2 = _getFileextension(cidFile);
                string savedF2 = vendorNo + "_CID CERT" + ext2;

                string fileName3 = Path.GetFileName(eaccFile.FileName);
                string ext3 = _getFileextension(eaccFile);
                string savedF3 = vendorNo + "_EACC CERT" + ext3;

                string fileName4 = Path.GetFileName(profdFile.FileName);
                string ext4 = _getFileextension(profdFile);
                string savedF4 = vendorNo + "_PROF CERT" + ext4;

                string fileName5 = Path.GetFileName(crbFile.FileName);
                string ext5 = _getFileextension(crbFile);
                string savedF5 = vendorNo + "_CRB CERT" + ext5;

                krapinFile.SaveAs(subfolder + "/" + savedF0);
                helbFile.SaveAs(subfolder + "/" + savedF1);
                cidFile.SaveAs(subfolder + "/" + savedF2);
                eaccFile.SaveAs(subfolder + "/" + savedF3);
                profdFile.SaveAs(subfolder + "/" + savedF4);
                crbFile.SaveAs(subfolder + "/" + savedF5);
                string uploads = string.Format("{0}",
                    "<div class='form-group'>" +
                    "<h4><strong style='color: chocolate'>List of files you uploaded successfully!</strong></h4>" +
                    fileName0 + "<br/>" + fileName1 + "<br/>" + fileName2 + "<br/>" + fileName3 + "<br/>" + fileName4 + "<br/>" + fileName5 +
                    "<br/></div>");
                return "success*" + uploads;

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

    }
}