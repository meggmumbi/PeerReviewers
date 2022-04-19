using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class Graduation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //  new Config().ObjNav().AddStudentDraft("1234", "victor");
            var nav = Config.ReturnNav();
          //  var counties = nav.cou
          List<string> myCategory = new List<string>();
            myCategory.Add("Publication");
            myCategory.Add("Innovation");
            myCategory.Add("Patent");
            category.DataSource = myCategory;
            category.DataBind();
            List<string> myDomains = new List<string>();
            myDomains.Add("Education");
            myDomains.Add("Arts and Humanities");
            domain.DataSource = myDomains;
            domain.DataBind();
          

        }

        protected void clerkApprove_Click(object sender, EventArgs e)
        {
            bool response =  new Config().ObjNav().Approve("finance", Session["Code"].ToString() , Session["Password"].ToString(), true);
        }

        protected void clerkReject_Click(object sender, EventArgs e)
        {
            bool response = new Config().ObjNav().Approve("finance", Session["Code"].ToString(), Session["Password"].ToString(), false);
        }

        protected void dvcApprove_Click(object sender, EventArgs e)
        {
            bool response = new Config().ObjNav().Approve("finance", Session["Code"].ToString(), Session["Password"].ToString(), true);
        }

        protected void dvcReject_Click(object sender, EventArgs e)
        {
            bool response = new Config().ObjNav().Approve("finance", Session["Code"].ToString(), Session["Password"].ToString(), false);
        }

        protected void vcApprove_Click(object sender, EventArgs e)
        {
            bool response = new Config().ObjNav().Approve("finance", Session["Code"].ToString(), Session["Password"].ToString(), true);
        }

        protected void vcReject_Click(object sender, EventArgs e)
        {
            bool response = new Config().ObjNav().Approve("finance", Session["Code"].ToString(), Session["Password"].ToString(), false);
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
          /*  new Config().ObjNav()
                .AddStudentDraft(idNumber.Text.Trim(), lastName.Text.Trim(), middleName.Text.Trim(),
                    firstName.Text.Trim(), 1, new DateTime(), homeCounty.SelectedValue, "", nationality.SelectedValue, 1,
                    "", yearOfStudy.SelectedValue, disabilityCode.Text.Trim(), "", false, program.Text.Trim(),
                    programLevel.Text.Trim(), new DateTime(), nationality.SelectedValue, Session["Code"].ToString());
       */ }
    }
}