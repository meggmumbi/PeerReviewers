using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var nav = Config.ReturnNav();


                //var postCodes = nav.postcodes;
                //postCode.DataSource = postCodes;
                //postCode.DataValueField = "Code";
                //postCode.DataTextField = "Code";
                //postCode.DataBind();
                //var titles = nav.Titles;
                //title.DataSource = titles;
                //title.DataValueField = "Title_Code";
                //title.DataTextField = "Title_Name";
                //title.DataBind();
                //var academicLevels = nav.AcademicLevels;
                //highestAcademicQualification.DataSource = academicLevels;
                //highestAcademicQualification.DataValueField = "Code";
                //highestAcademicQualification.DataTextField = "Level_Name";
                //highestAcademicQualification.DataBind();
                //UpdateCity();
                var vendors = nav.Vendor.Where(r => r.No == Convert.ToString(Session["PeerCode"]));
                foreach (var vendor in vendors)
                {
                    name.Text = vendor.Name;
                    idNo.Text = vendor.ID_Number;
                    kraPin.Text = vendor.PIN_Number;
                    postAddress.Text = vendor.Address;
                    postCode1.Text = vendor.Post_Code;
                    phoneNumber.Text = vendor.Phone_No;
                    emailAddress.Text = vendor.E_Mail;
                    highestAcademicQualification1.Text = vendor.Highest_Academic_Qualification;
                    title1.Text = vendor.Title;
                    //UpdateCity();
                }

            }
        }

        protected void postCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateCity();
        }

        protected void updateProfile_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    string tName = name.Text.Trim(),
            //        tIdNo = idNo.Text.Trim(),
            //        tKraPin = kraPin.Text.Trim(),
            //        tPostAddress = postAddress.Text.Trim(),
            //        tPostCode = postCode.SelectedValue,
            //        tPhoneNumber = phoneNumber.Text.Trim(),
            //        tEmailAddress = emailAddress.Text.Trim();
            //    string tHighestAcademicLevels = highestAcademicQualification.SelectedValue;
            //    string tTitle = title.SelectedValue;
            //    string status = new Config().ObjNav()
            //        .UpdatePeerReviewer(tName,Convert.ToString(Session["PeerCode"]), tIdNo, tPhoneNumber, tEmailAddress, tKraPin, tPostAddress, tPostCode,tHighestAcademicLevels, tTitle);
            //    string[] info = status.Split('*');
            //    feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + " </div>";
            //}
            //catch (Exception t)
            //{
            //    feedback.InnerHtml = "<div class='alert alert-danger'>We encountered an error while signing you up. Please try again later. </div>";
            //}
        }
        public void UpdateCity()
        {
            //var nav = Config.ReturnNav();
            //var cities = nav.postcodes.Where(r => r.Code == postCode.SelectedValue);
            //foreach (var myCity in cities)
            //{
            //    city.Text = myCity.City;
            //}
        }
    }
}