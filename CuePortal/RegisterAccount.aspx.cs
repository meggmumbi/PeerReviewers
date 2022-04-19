using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class RegisterAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            selectedCountry.Visible = false;

            if (!IsPostBack)
            {

                getCountries();
                getCities();
                getPostalCodes();
                _populateDdlList();
            }
        }
        protected void getCountries()
        {
            var nav = Config.ReturnNav();
            var countries = nav.Countries;
            country.DataSource = countries;
            country.DataTextField = "Name";
            country.DataValueField = "Code";
            country.DataBind();
        }
        protected void getCities()
        {
            var nav = Config.ReturnNav();
            var cities = nav.PostCodes;
            city.DataSource = cities;
            city.DataTextField = "City";
            city.DataValueField = "City";
            city.DataBind();
        }
        protected void getPostalCodes()
        {
            var nav = Config.ReturnNav();
            var codes = nav.PostCodes;
            postalcode.DataSource = codes;
            postalcode.DataTextField = "Code";
            postalcode.DataValueField = "Code";
            postalcode.DataBind();
        }

        protected void btn_accountcreation_Click(object sender, EventArgs e)
        {
            try
            {
                string tIdnumber = idnumber.Text.Trim();
                string tFname = fname.Text.Trim();
                string tMname = mName.Text.Trim();
                string tLname = lName.Text.Trim();
                string tCity = city.SelectedValue;
                string tCountry = country.SelectedValue;
                string tPostalcode = postalcode.SelectedValue;
                string tPhoneNumber = phonenumber.Text.Trim();
                string tEmailAddress = emailaddress.Text.Trim();
                string tAddress = address.Text.Trim();
                string message = "";
                bool error = false;
                if (string.IsNullOrEmpty(tIdnumber))
                {
                    error = true;
                    message = "Please enter Id number";
                }
                if (string.IsNullOrEmpty(tFname))
                {
                    error = true;
                    message = "Please enter your first name";
                }
                if (string.IsNullOrEmpty(tMname))
                {
                    error = true;
                    message = "Please enter your middle name";
                }
                if (string.IsNullOrEmpty(tLname))
                {
                    error = true;
                    message = "Please enter your last name";
                }
                if (string.IsNullOrEmpty(tCity))
                {
                    error = true;
                    message = "Please enter your city of origin";
                }
                if (string.IsNullOrEmpty(tCountry))
                {
                    error = true;
                    message = "Please enter your country of origin";
                }
                if (string.IsNullOrEmpty(tPhoneNumber))
                {
                    error = true;
                    message = "Please enter phone number";
                }
                if (string.IsNullOrEmpty(tEmailAddress))
                {
                    error = true;
                    message = "Please enter valid email address";
                }
                if (string.IsNullOrEmpty(tAddress))
                {
                    error = true;
                    message = "Please enter address";
                }
                if (error)
                {
                    registerfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    string ApplicationNo = "";
                    string status = new Config().ObjNav().Fnuseraccountcreation(tIdnumber, tFname, tMname, tLname, tPhoneNumber, tEmailAddress, tAddress, tPostalcode, tCity, tCountry);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        ApplicationNo = info[2];
                        Response.Redirect("RegisterAccount.aspx?step=2&&ApplicationNo=" + ApplicationNo);
                    }
                    else
                    {
                        registerfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                registerfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
        protected void addPeerQualification_Click(object sender, EventArgs e)
        {
            try
            {
                string message = "";
                bool error = false;
                string tDescription = ddlAcQualific.SelectedValue;
                string tCountry = ddlCountries.SelectedValue;
                string tYearobtained = yearObtained.Text.Trim();
                string tInstitution = institution.Text.Trim();
                string tDuration = durationOfStudy.Text.Trim();
                string tAreaOfSpecialization = areaOfSpecialization.Text.Trim();
                int mDuration = Convert.ToInt32(tDuration);

                if (string.IsNullOrEmpty(tInstitution))
                {
                    error = true;
                    message = "Please enter institution name";
                }
                if (string.IsNullOrEmpty(tCountry))
                {
                    error = true;
                    message = "Please select country of study";
                }
                if (string.IsNullOrEmpty(tYearobtained))
                {
                    error = true;
                    message = "Please enter the year when the qualification was obtained";
                }
                if (string.IsNullOrEmpty(tDescription))
                {
                    error = true;
                    message = "Please select title of qualification obtained";
                }
                if (string.IsNullOrEmpty(tAreaOfSpecialization))
                {
                    error = true;
                    message = "Please enter the qualification area of specialization";
                }
                if (mDuration < 1)
                {
                    error = true;
                    message = "Please enter duration of study";
                }
                if (error)
                {
                    headerfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    string ApplicationNo = Request.QueryString["ApplicationNo"];
                    string status = new Config().ObjNav().AddPeerAcademicQualifications(ApplicationNo, tDescription, tYearobtained, tInstitution, tAreaOfSpecialization, mDuration, tCountry);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        string accreditationNo = Request.QueryString["ApplicationNo"];
                        accreditationNo = accreditationNo.Replace('/', '_');
                        accreditationNo = accreditationNo.Replace(':', '_');
                        string path1 = Config.FilesLocation() + "Peer Reviewer Application/";
                        string str1 = Convert.ToString(accreditationNo);
                        string folderName = path1 + str1 + "/";
                        try
                        {
                            if (uploadrecognition.HasFile)
                            {
                                string extension = System.IO.Path.GetExtension(uploadrecognition.FileName);
                                if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf")
                                {
                                    string filename = "EVIDENCE_OF_RECOGNITION" + extension;
                                    if (!Directory.Exists(folderName))
                                    {
                                        Directory.CreateDirectory(folderName);
                                    }
                                    if (File.Exists(folderName + filename))
                                    {
                                        File.Delete(folderName + filename);
                                    }
                                    uploadrecognition.SaveAs(folderName + filename);
                                    //string imagePath = folderName + filename;
                                    //System.Drawing.Image img = System.Drawing.Image.FromFile(imagePath);
                                    //byte[] ImageuniversityFacilities = ImageToByteArray(img);
                                    //facilitiesbytes = Convert.ToBase64String(ImageuniversityFacilities);
                                    if (File.Exists(folderName + filename))
                                    {
                                       // CVDocUploaded = true;
                                    }
                                }
                                else
                                {
                                    error = true;
                                    message += message.Length > 0 ? "<br>" : "";
                                    message += "The file extension of the Evidence Of Recognition is not allowed,Kindly upload pdf files only";
                                }

                            }
                            else
                            {
                                error = true;
                                message += message.Length > 0 ? "<br>" : "";
                                message += "The file extension of the Evidence Of Recognition is not allowed,Kindly upload pdf files only";

                            }
                        }
                        catch (Exception ex)
                        {
                            error = true;
                            message += message.Length > 0 ? "<br>" : "";
                            message += "The file extension of the Evidence Of Recognition is not allowed,Kindly upload pdf files only" + ex;
                        }

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
        public void _populateDdlList()
        {
            var nav = Config.ReturnNav();
            var allountries = nav.countries.ToList();
            ddlCountries.DataSource = allountries;
            ddlCountries.DataTextField = "Name";
            ddlCountries.DataValueField = "Code";
            ddlCountries.DataBind();
            ddlCountries.Items.Insert(0, "--Select Country--");

            List<String> programLevels = new List<string>();
            programLevels.Add("--Select Program Level--");
            programLevels.Add("Bachelors");
            programLevels.Add("Masters");
            programLevels.Add("Doctorate");
            programLevels.Add("Postgraduate");
            programLevels.Add("Diploma");
            programLevels.Add("Certificate");
            ddlAcQualific.DataSource = programLevels;
            ddlAcQualific.DataBind();
        }
        protected void addRecord_Click(object sender, EventArgs e)
        {
            string message = "";
            bool error = false;
            string tEmployer = employer.Text.Trim(),
                tPosition = postion.Text.Trim(),
                tAddress = txtAddress.Text.Trim(),
                tEmail = txtEmail.Text.Trim(),
                tPhone = txtPhonenumber.Text.Trim(),
                tContact = contactPerson.Text.Trim();
            string tDateFrom = dateFrom.Text.Trim();
            string tDateTo = dateTo.Text.Trim();
            string temployeremail = employeremail.Text.Trim();
            string tyearsworked = yearsworked.Text.Trim();
            string tcurrentplace = currentplace.Text.Trim();
            bool mCurrentplace = false;
            decimal mYearsworked = 0;

            mYearsworked = Convert.ToDecimal(tyearsworked);

            if (tcurrentplace == "YES")
            {
                mCurrentplace = true;
            }
            DateTime mDateFrom = new DateTime();
            DateTime mDateTo = new DateTime();
            try
            {
                mDateFrom = DateTime.ParseExact(tDateFrom, "M/d/yyyy", CultureInfo.InvariantCulture);
            }
            catch (Exception)
            {

            }
            try
            {
                mDateTo = DateTime.ParseExact(tDateTo, "M/d/yyyy", CultureInfo.InvariantCulture);
            }
            catch (Exception)
            {

            }

            if (string.IsNullOrEmpty(tEmployer))
            {
                error = true;
                message = "Please enter the employer";
            }
            if (string.IsNullOrEmpty(tPosition))
            {
                error = true;
                message = "Please enter your job position";
            }
            if (string.IsNullOrEmpty(tAddress))
            {
                error = true;
                message = "Please enter address";
            }
            if (string.IsNullOrEmpty(tEmail))
            {
                error = true;
                message = "Please enter contact person email address";
            }
            if (string.IsNullOrEmpty(tContact))
            {
                error = true;
                message = "Please enter contact full name";
            }
            if (string.IsNullOrEmpty(tPhone))
            {
                error = true;
                message = "Please enter contact person phone number";
            }
            if (string.IsNullOrEmpty(temployeremail))
            {
                error = true;
                message = "Please enter employer official email address";
            }
            if (string.IsNullOrEmpty(tyearsworked))
            {
                error = true;
                message = "Please enter the total number of years worked";
            }

            string ApplicationNo = Request.QueryString["ApplicationNo"];
            string response = new Config().ObjNav().AddPeerEmploymentRecord(ApplicationNo, tEmployer, tPosition, mDateFrom, mDateTo, tContact, tAddress, tEmail, tPhone, temployeremail, mYearsworked, mCurrentplace);
            string[] info = response.Split('*');
            if (info[0] == "success")
            {
                recordfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
            else
            {
                recordfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
        protected void deleteEmploymentRecord_Click(object sender, EventArgs e)
        {
            string tEmployer = editEmployer.Text.Trim(),
                tPosition = editPosition.Text.Trim(),
                tContact = editContact.Text.Trim();
            string tDateFrom = editDateFrom.Text.Trim();
            string tDateTo = editDateTo.Text.Trim();
            DateTime mDateFrom = new DateTime();
            DateTime mDateTo = new DateTime();
            int code = 0;
            try
            {
                code = Convert.ToInt32(deleteEmploymentRecordCode.Text.Trim());
            }
            catch (Exception)
            {
                code = 0;
            }

            string response = new Config().ObjNav()
                .DeletePeerEmploymentRecord(Convert.ToString(Session["PeerCode"]), code);
            string[] info = response.Split('*');
            recordfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";

        }

        protected void editEmploymentRecord_Click(object sender, EventArgs e)
        {
            string tEmployer = editEmployer.Text.Trim(),
                tPosition = editPosition.Text.Trim(),
                tContact = editContact.Text.Trim();
            string tDateFrom = editDateFrom.Text.Trim();
            string tDateTo = editDateTo.Text.Trim();
            DateTime mDateFrom = new DateTime();
            DateTime mDateTo = new DateTime();
            int code = 0;
            try
            {
                code = Convert.ToInt32(editEmploymentRecordCode.Text.Trim());
            }
            catch (Exception)
            {
                code = 0;
            }
            try
            {
                mDateFrom = DateTime.ParseExact(tDateFrom, "M/d/yyyy", CultureInfo.InvariantCulture);
            }
            catch (Exception)
            {

            }
            try
            {
                mDateTo = DateTime.ParseExact(tDateTo, "M/d/yyyy", CultureInfo.InvariantCulture);
            }
            catch (Exception)
            {

            }

            string response = new Config().ObjNav()
                .EditPeerEmploymentRecord(Convert.ToString(Session["PeerCode"]), code, tEmployer, tPosition, mDateFrom, mDateTo, tContact);
            string[] info = response.Split('*');
            recordfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
        }
        protected void submitapplication_Click(object sender, EventArgs e)
        {
            try
            {

                string accreditationNo = Request.QueryString["ApplicationNo"];
                accreditationNo = accreditationNo.Replace('/', '_');
                accreditationNo = accreditationNo.Replace(':', '_');
                string path1 = Config.FilesLocation() + "Peer Reviewer Application/";
                string str1 = Convert.ToString(accreditationNo);
                string folderName = path1 + str1 + "/";
                bool CVDocUploaded = false;
                bool KRADocUploaded = false;
                bool HELBDocUploaded = false;
                bool CIDDocUploaded = false;
                bool EACCDocUploaded = false;
                bool CRBDocUploaded = false;
                bool PBODYDocUploaded = false;

                bool error = false;
                string message = "";
                try
                {
                    if (cv.HasFile)
                    {
                        string extension = System.IO.Path.GetExtension(cv.FileName);
                        if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf")
                        {
                            string filename = "CURRICULUM VITAE" + extension;
                            if (!Directory.Exists(folderName))
                            {
                                Directory.CreateDirectory(folderName);
                            }
                            if (File.Exists(folderName + filename))
                            {
                                File.Delete(folderName + filename);
                            }
                            cv.SaveAs(folderName + filename);
                            //string imagePath = folderName + filename;
                            //System.Drawing.Image img = System.Drawing.Image.FromFile(imagePath);
                            //byte[] ImageuniversityFacilities = ImageToByteArray(img);
                            //facilitiesbytes = Convert.ToBase64String(ImageuniversityFacilities);
                            if (File.Exists(folderName + filename))
                            {
                                CVDocUploaded = true;
                            }
                        }
                        else
                        {
                            error = true;
                            message += message.Length > 0 ? "<br>" : "";
                            message += "The file extension of the CURRICULUM VITAE is not allowed,Kindly upload pdf files only";
                        }

                    }
                    else
                    {
                        error = true;
                        message += message.Length > 0 ? "<br>" : "";
                        message += "Please upload your CURRICULUM VITAE, Kindly upload pdf files only";

                    }
                }
                catch (Exception ex)
                {
                    error = true;
                    message += message.Length > 0 ? "<br>" : "";
                    message += "The file extension of the CURRICULUM VITAE is not allowed,Kindly upload pdf files only" + ex;
                }
                try
                {
                    if (kra.HasFile)
                    {
                        string extension = System.IO.Path.GetExtension(kra.FileName);
                        if (new Config().IsAllowedExtension(extension))
                        {
                            string filename = "KRA CERTIFICATE" + extension;
                            if (!Directory.Exists(folderName))
                            {
                                Directory.CreateDirectory(folderName);
                            }
                            if (File.Exists(folderName + filename))
                            {
                                File.Delete(folderName + filename);
                            }
                            kra.SaveAs(folderName + filename);
                            if (File.Exists(folderName + filename))
                            {
                                KRADocUploaded = true;
                            }
                        }
                        else
                        {
                            error = true;
                            message += message.Length > 0 ? "<br>" : "";
                            message += "The file extension of the KRA Certificate is not allowed,Kindly upload pdf files only";
                        }

                    }
                    else
                    {
                        error = true;
                        message += message.Length > 0 ? "<br>" : "";
                        message += "Please upload KRA Certificate, Kindly upload pdf files only";
                    }
                }
                catch (Exception ex)
                {
                    error = true;
                    message += message.Length > 0 ? "<br>" : "";
                    message += "The file extension of the KRA Certificate is not allowed,Kindly upload pdf files only" + ex;
                }

                try
                {
                    if (helb.HasFile == true)
                    {
                        string extension = System.IO.Path.GetExtension(helb.FileName);
                        if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf")
                        {
                            string filename = "HELB CLEARANCE" + extension;
                            if (!Directory.Exists(folderName))
                            {
                                Directory.CreateDirectory(folderName);
                            }
                            if (File.Exists(folderName + filename))
                            {
                                File.Delete(folderName + filename);
                            }
                            helb.SaveAs(folderName + filename);
                            //string imagePath = folderName + filename;
                            //System.Drawing.Image img = System.Drawing.Image.FromFile(imagePath);
                            //byte[] ImageuniversityEquipments = ImageToByteArray(img);
                            //equipmentsbytes = Convert.ToBase64String(ImageuniversityEquipments);
                            if (File.Exists(folderName + filename))
                            {
                                HELBDocUploaded = true;
                            }
                        }
                        else
                        {
                            error = true;
                            message += message.Length > 0 ? "<br>" : "";
                            message += "The file extension of the HELB Certificate is not allowed,Kindly upload pdf files only";
                        }

                    }
                    else
                    {
                        error = true;
                        message += message.Length > 0 ? "<br>" : "";
                        message += "Please upload HELB Clearance Certificate, Kindly upload pdf files only";
                    }
                }
                catch (Exception ex)
                {
                    error = true;
                    message += message.Length > 0 ? "<br>" : "";
                    message += "The file extension of the KRA Certificate is not allowed,Kindly upload pdf files only" + ex;

                }
                try
                {
                    if (cid.HasFile == true)
                    {
                        string extension = System.IO.Path.GetExtension(cid.FileName);
                        if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf")
                        {
                            string filename = "CID CERTIFICATE" + extension;
                            if (!Directory.Exists(folderName))
                            {
                                Directory.CreateDirectory(folderName);
                            }
                            if (File.Exists(folderName + filename))
                            {
                                File.Delete(folderName + filename);
                            }
                            cid.SaveAs(folderName + filename);
                            //string imagePath = folderName + filename;
                            //System.Drawing.Image img = System.Drawing.Image.FromFile(imagePath);
                            //byte[] ImageuniversityCoreTexts = ImageToByteArray(img);
                            //coreTextsbytes = Convert.ToBase64String(ImageuniversityCoreTexts);
                            if (File.Exists(folderName + filename))
                            {
                                CIDDocUploaded = true;
                            }
                        }
                        else
                        {
                            error = true;
                            message += message.Length > 0 ? "<br>" : "";
                            message += "The file extension of the CID Certificate is not allowed,Kindly upload pdf files only";
                        }

                    }
                    else
                    {
                        error = true;
                        message += message.Length > 0 ? "<br>" : "";
                        message += "Please upload CID Clearance Certificate, Kindly upload pdf files only";
                    }
                }
                catch (Exception ex)
                {
                    error = true;
                    message += message.Length > 0 ? "<br>" : "";
                    message += "The file extension of the CID Certificate is not allowed,Kindly upload pdf files only" + ex;
                }
                try
                {
                    if (eacc.HasFile == true)
                    {
                        string extension = System.IO.Path.GetExtension(eacc.FileName);
                        if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf")
                        {
                            string filename = "EACC CERTIFICATE" + extension;
                            if (!Directory.Exists(folderName))
                            {
                                Directory.CreateDirectory(folderName);
                            }
                            if (File.Exists(folderName + filename))
                            {
                                File.Delete(folderName + filename);
                            }
                            eacc.SaveAs(folderName + filename);
                            //string imagePath = folderName + filename;
                            //System.Drawing.Image img = System.Drawing.Image.FromFile(imagePath);
                            //byte[] ImageuniversityAcademicStaff = ImageToByteArray(img);
                            //academicStaffbytes = Convert.ToBase64String(ImageuniversityAcademicStaff);
                            if (File.Exists(folderName + filename))
                            {
                                EACCDocUploaded = true;
                            }
                        }
                        else
                        {
                            error = true;
                            message += message.Length > 0 ? "<br>" : "";
                            message += "The file extension of the EACC Certificate is not allowed,Kindly upload pdf files only";
                        }

                    }
                    else
                    {
                        error = true;
                        message += message.Length > 0 ? "<br>" : "";
                        message += "Please upload EACC Certificate, Kindly upload pdf files only";
                    }
                }
                catch (Exception ex)
                {
                    error = true;
                    message += message.Length > 0 ? "<br>" : "";
                    message += "The file extension of the EACC Certificate is not allowed,Kindly upload pdf files only" + ex;
                }
                try
                {
                    if (crb.HasFile == true)
                    {
                        string extension = System.IO.Path.GetExtension(crb.FileName);
                        if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf")
                        {
                            string filename = "CRB CERTIFICATE" + extension;
                            if (!Directory.Exists(folderName))
                            {
                                Directory.CreateDirectory(folderName);
                            }
                            if (File.Exists(folderName + filename))
                            {
                                File.Delete(folderName + filename);
                            }
                            crb.SaveAs(folderName + filename);
                            //string imagePath = folderName + filename;
                            //System.Drawing.Image img = System.Drawing.Image.FromFile(imagePath);
                            //byte[] ImageuniversitySupportStaff = ImageToByteArray(img);
                            //supportStaffbytes = Convert.ToBase64String(ImageuniversitySupportStaff);
                            if (File.Exists(folderName + filename))
                            {
                                CRBDocUploaded = true;
                            }
                        }
                        else
                        {
                            error = true;
                            message += message.Length > 0 ? "<br>" : "";
                            message += "The file extension of the CRB Certificate is not allowed,Kindly upload pdf files only";
                        }

                    }
                    else
                    {
                        error = true;
                        message += message.Length > 0 ? "<br>" : "";
                        message += "Please upload CRB Clearance Certificate, Kindly upload pdf files only";
                    }
                }
                catch (Exception ex)
                {
                    error = true;
                    message += message.Length > 0 ? "<br>" : "";
                    message += "The file extension of the CRB Certificate is not allowed,Kindly upload pdf files only" + ex;
                }
                try
                {

                    if (professionalbody.HasFile == true)
                    {
                        string extension = System.IO.Path.GetExtension(professionalbody.FileName);
                        if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf")
                        {
                            string filename = "PROFESSIONAL BODY" + extension;
                            // 1. Step to convert the image to the Byte Array
                            if (!Directory.Exists(folderName))
                            {
                                Directory.CreateDirectory(folderName);
                            }
                            if (File.Exists(folderName + filename))
                            {
                                File.Delete(folderName + filename);
                            }
                            professionalbody.SaveAs(folderName + filename);
                            //string imagePath = folderName + filename;
                            //System.Drawing.Image img = System.Drawing.Image.FromFile(imagePath);
                            //byte[] Imageuniversitypolicy = ImageToByteArray(img);
                            // policybytes =Convert.ToBase64String(Imageuniversitypolicy);
                            if (File.Exists(folderName + filename))
                            {
                                PBODYDocUploaded = true;
                            }

                        }
                        else
                        {
                            error = true;
                            message += message.Length > 0 ? "<br>" : "";
                            message += "The file extension of the PROFESSIONAL BODY Certificate is not allowed,Kindly upload pdf files only";
                        }

                    }
                    else
                    {
                        error = true;
                        message += message.Length > 0 ? "<br>" : "";
                        message += "Please upload PROFESSIONAL BODY Certificate, Kindly upload pdf files only";
                    }
                }
                catch (Exception ex)
                {
                    error = true;
                    message += message.Length > 0 ? "<br>" : "";
                    message += "The file extension of the PROFESSIONAL BODY Certificate is not allowed,Kindly upload pdf files only" + ex;
                }

                if (error)
                {
                    documentsfeedback.InnerHtml = Config.GetAlert("danger", message);
                }
                else
                {
                    string applicationNo = Request.QueryString["ApplicationNo"];
                    string status = new Config().ObjNav().FnInsertPeerAccountCreationsDocs(applicationNo, KRADocUploaded, HELBDocUploaded, CIDDocUploaded, EACCDocUploaded, CRBDocUploaded, PBODYDocUploaded);
                    string[] info = status.Split('*');
                    documentsfeedback.InnerHtml = Config.GetAlert(info[0], info[1]);
                }

            }
            catch (Exception y)
            {
                documentsfeedback.InnerHtml = Config.GetAlert("danger", y.Message);
            }
        }

        protected void submitapplicationdata_Click(object sender, EventArgs e)
        {
            
            try
            {
                string applicationNo = Request.QueryString["ApplicationNo"];
                string status = new Config().ObjNav().FnSubmitApplicationCUE(applicationNo);
                String[] info = status.Split('*');
                if (info[0] == "success")
                {
                    headerfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                    "setTimeout(function() { window.location.replace('Login.aspx') }, 7000);", true);
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

        protected void BackToLoginPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountries.SelectedValue == "KE")
            {
                selectedCountry.Visible = false;
            }
            else if (ddlCountries.SelectedValue == "--Select Country--")
            {
                selectedCountry.Visible = false;
            }
            else
            {
                selectedCountry.Visible = true;
            }
        }

        protected void nexttopage3_Click(object sender, EventArgs e)
        {
            string ApplicationNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("RegisterAccount.aspx?step=3&&ApplicationNo=" + ApplicationNo);
        }

        protected void previoustopage1_Click(object sender, EventArgs e)
        {
            string ApplicationNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("RegisterAccount.aspx?step=1&&ApplicationNo=" + ApplicationNo);
        }

        protected void nexttopage4_Click(object sender, EventArgs e)
        {
            string ApplicationNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("RegisterAccount.aspx?step=4&&ApplicationNo=" + ApplicationNo);
        }

        protected void previoustopage2_Click(object sender, EventArgs e)
        {
            string ApplicationNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("RegisterAccount.aspx?step=2&&ApplicationNo=" + ApplicationNo);
        }

        protected void previoustopage3_Click(object sender, EventArgs e)
        {
            string ApplicationNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("RegisterAccount.aspx?step=3&&ApplicationNo=" + ApplicationNo);
        }
    }
}