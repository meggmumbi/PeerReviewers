using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class Sanitation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var nav = Config.ReturnNav();
                var categories = nav.ResourceCategorization.Where(r => r.Department == "Sanitation");
                type.DataSource = categories;
                type.DataValueField = "Id";
                type.DataTextField = "Category";
                type.DataBind();
                var campuses = nav.campuses;
                campus.DataSource = campuses;
                campus.DataTextField = "Description";
                campus.DataValueField = "No";
                campus.DataBind();
                }



        }

  

       
    }
}