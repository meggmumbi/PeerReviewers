using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace CicPortal
{
    public partial class Login : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {

         
    }

        protected void login_Click(object sender, EventArgs e)
        {
            string mUsername = username.Text.Trim();
            string mPassword = password.Text.Trim();
            bool error = false;
            if (mUsername.Length < 4)
            {
                error = true;
                feedback.InnerHtml = "<div class='alert alert-danger'>Please input a correct username</div>";
            } if (mPassword.Length < 4)
            {
                error = true;
                feedback.InnerHtml = "<div class='alert alert-danger'>Please input a correct password</div>";
            }
            if (!error)
            {
                bool exists = false;
                var nav = Config.ReturnNav();
                var peers = nav.PeerReviewersPortalUsers .Where(r=> r.Authentication_Email == mUsername && r.Password_Value == mPassword);
                foreach (var vendor in peers)
                {
                    exists = true;
                    Session["Name"] = vendor.Full_Name;
                    Session["PeerCode"] = vendor.Vendor_Number;
                    Session["Password"] = vendor.Password_Value;

                    if(vendor.PasswordChanged == false)
                    {
                        Response.Redirect("ChangePassword.aspx");
                    }
                    else
                    {
                        Response.Redirect("Dashboard.aspx");
                    }               
                }
                if (!exists)
                {
                    feedback.InnerHtml = "<div class='alert alert-danger'>The details you entered are not correct, Kindly enter a correct email address or password</div>";
                }
            }
            
        }
    }
}