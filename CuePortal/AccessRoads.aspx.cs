using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class AccessRoads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var nav = Config.ReturnNav();
                var categories = nav.ResourceCategorization.Where(r => r.Department == "Access Roads");
                status.DataSource = categories;
                status.DataValueField = "Id";
                status.DataTextField = "Category";
                status.DataBind();
                var campuses = nav.campuses;
                campus.DataSource = campuses;
                campus.DataTextField = "Description";
                campus.DataValueField = "No";
                campus.DataBind();
            }




        }




    }
}