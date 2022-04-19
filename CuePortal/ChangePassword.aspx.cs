using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void changepassword_Click(object sender, EventArgs e)
        {
            try
            {
                String message = "";
                Boolean error = false;
                string temail = email.Text.Trim();
                bool isValid = IsValidEmail(temail);
                if (isValid == false)
                {
                    error = true;
                    message = "<div class='alert alert-danger'>Please enter a valid email address! It should be like test@gmail.com<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                String tCurrentPassword = currentPassword.Text.Trim();
                String tNewPassword = newPassword.Text.Trim();
                String tConfirmPassword = confirmPassword.Text.Trim();
                if (temail.Length < 1)
                {
                    error = true;
                    message = "Please enter a valid current password. Atleast 4 charaters";
                }
                if (tCurrentPassword.Length < 4)
                {
                    error = true;
                    message = "Please enter a valid current password. Atleast 4 charaters";
                }
                if (tNewPassword.Length < 4)
                {
                    error = true;
                    message += message.Length > 0 ? "<br\\>" : "";
                    message += "Please enter a valid new password. Atleast 4 charaters";
                }
                if (tNewPassword != tConfirmPassword)
                {
                    error = true;
                    message += message.Length > 0 ? "<br\\>" : "";
                    message += "New Password and Confirm new password do not match.";
                }

                if (error)
                {
                    feedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    String status = new Config().ObjNav().ChangePassword(temail, tCurrentPassword, tNewPassword, tConfirmPassword);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                    }


                }
            }
            catch (Exception t)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>" + t.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }
        public static bool IsValidEmail(string email)
        {
            string pattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|" + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)" + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";
            var regex = new Regex(pattern, RegexOptions.IgnoreCase);
            return regex.IsMatch(email);
        }
    }
}