using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var nav = Config.ReturnNav();
            if (!IsPostBack)
            {
                var postcode = nav.postcodes;
                editpostcodes.DataSource = postcode;
                editpostcodes.DataTextField = "Code";
                editpostcodes.DataValueField = "Code";
                editpostcodes.DataBind();
            }

        }

        protected void editGeneralDetails_Click(object sender, EventArgs e)
        {
            try
            {
                string tEditname = editname.Text.Trim();
                string tEditEmail = editEmail.Text.Trim();
                string tAddress = editaddress.Text.Trim();
                string tEditPhone = editPhone.Text.Trim();
                string tPostCode = editpostcodes.SelectedValue;
                string message = "";
                bool error = false;
                if (error)
                {
                    registerfeedback.InnerHtml = "<div class='alert alert-danger'>" + message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    string peercode = Convert.ToString(Session["PeerCode"]);
                    string status = new Config().ObjNav().FnEditPeer(peercode, tEditname, tEditPhone, tAddress, tPostCode, tEditEmail);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        registerfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
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

        protected void NotificationCounter()
        {
            var navref = Config.ReturnNav();
            var notifs = navref.peerRevNotifications
                .Where(r => r.Peer_Code == (string) Session["PeerCode"] && r.Notified == false).ToList();
            Session["notifcount"] = notifs.Count;
        }
    }
}