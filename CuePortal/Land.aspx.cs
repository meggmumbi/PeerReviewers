using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class Land : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var nav = Config.ReturnNav();
                var ownerships = nav.ResourceCategorization.Where(r => r.Department == "Land");
                ownership.DataSource = ownerships;
                ownership.DataValueField = "Id";
                ownership.DataTextField = "Category";
                ownership.DataBind();
                var campuses = nav.campuses;
                campus.DataSource = campuses;
                campus.DataTextField = "Description";
                campus.DataValueField = "No";
                campus.DataBind();
            }




        }

  

       
    }
}