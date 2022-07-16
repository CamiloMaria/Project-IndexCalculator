using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IndexCalculator.Student
{
    public partial class StudentMst : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuariologueado"] == null)
            {
                Response.Redirect("../Login/LoginHome.aspx");
            }
        }
        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuariologueado");
            Response.Redirect("../Login/LoginHome.aspx");
        }
    }
}