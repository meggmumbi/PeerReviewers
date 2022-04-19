using System;
using System.Linq;
using System.Web.UI;
namespace CicPortal
{
    public partial class Signup : Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var nav = Config.ReturnNav();
               
             
                 var postCodes = nav.postcodes;
                postCode.DataSource = postCodes;
                postCode.DataValueField = "Code";
                postCode.DataTextField = "Code";
                postCode.DataBind();
                var titles = nav.Titles;
                title.DataSource = titles;
                title.DataValueField = "Title_Code";
                title.DataTextField = "Title_Name";
                title.DataBind();
                var academicLevels = nav.AcademicLevels;
                highestAcademicQualification.DataSource = academicLevels;
                highestAcademicQualification.DataValueField = "Code";
                highestAcademicQualification.DataTextField = "Level_Name";
                highestAcademicQualification.DataBind();
                UpdateCity();

            }
            
        }


        protected void signup_Click(object sender, EventArgs e)
        {
            try
            {
                string tName = name.Text.Trim(),
                    tIdNo = idNo.Text.Trim(),
                    tKraPin = kraPin.Text.Trim(),
                    tPostAddress = postAddress.Text.Trim(),
                    tPostCode = postCode.SelectedValue,
                    tPhoneNumber = phoneNumber.Text.Trim(),
                    tEmailAddress = emailAddress.Text.Trim(),
                    tPassword = password.Text.Trim(),
                    tConfirmPassword = confirmPassword.Text.Trim();
                string tHighestAcademicLevels = highestAcademicQualification.SelectedValue;
                string tTitle = title.SelectedValue;
                string status = new Config().ObjNav()
                    .RegisterPeerReviewer(tName, tIdNo, tPhoneNumber, tEmailAddress, tKraPin, tPostAddress, tPostCode,
                        tPassword, tConfirmPassword, tHighestAcademicLevels,tTitle);
                string[] info = status.Split('*');
                feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + " </div>";
            }
                 catch (Exception t)
             {
                 feedback.InnerHtml = "<div class='alert alert-danger'>We encountered an error while signing you up. Please try again later. </div>";
             }
           
        }

        protected void postCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateCity();
        }

        public void UpdateCity()
        {
            var nav = Config.ReturnNav();
            var cities = nav.postcodes.Where(r => r.Code == postCode.SelectedValue);
            foreach (var myCity in cities)
            {
                city.Text = myCity.City;
            }
        }
      
        
    }

}