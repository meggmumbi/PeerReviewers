using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class EmploymentRecord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        //protected void addRecord_Click(object sender, EventArgs e)
        //{
        //    string tEmployer = employer.Text.Trim(),
        //        tPosition = postion.Text.Trim(),
        //        tAddress =txtAddress.Text.Trim(),
        //        tEmail = txtEmail.Text.Trim(),
        //        tPhone = txtPhonenumber.Text.Trim(),
        //        tContact = contactPerson.Text.Trim();
        //    string tDateFrom = dateFrom.Text.Trim();
        //    string tDateTo = dateTo.Text.Trim();
        //    DateTime mDateFrom = new DateTime();
        //    DateTime mDateTo = new DateTime();
        //    try
        //    {
        //        mDateFrom = DateTime.ParseExact(tDateFrom, "M/d/yyyy", CultureInfo.InvariantCulture);
        //    }
        //    catch(Exception)
        //    {}
        //    try
        //    {
        //        mDateTo = DateTime.ParseExact(tDateTo, "M/d/yyyy", CultureInfo.InvariantCulture); 
        //    }
        //    catch (Exception)
        //    {
                
        //    }

        //    string response = new Config().ObjNav()
        //        .AddPeerEmploymentRecord(Convert.ToString(Session["PeerCode"]), Convert.ToString(Session["Password"]),
        //        tEmployer,tPosition, mDateFrom,mDateTo, tContact, tAddress, tEmail,tPhone);
        //    string[] info = response.Split('*');
        //    feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
        //}

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
            feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";

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
            feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
        }
    }
}