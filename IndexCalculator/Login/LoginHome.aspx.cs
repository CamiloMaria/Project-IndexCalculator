using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace IndexCalculator.Login
{
    public partial class LoginHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["SchoolCS"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd = new SqlCommand("SP_ValidarAdmin", sqlConectar)
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand cmt = new SqlCommand("SP_ValidarTeacher", sqlConectar)
            {
                CommandType = CommandType.StoredProcedure
            };
            SqlCommand cms = new SqlCommand("SP_ValidarStudent", sqlConectar)
            {
                CommandType = CommandType.StoredProcedure
            };
            try
            {
                cmd.Connection.Open();
                cmd.Parameters.Add("@Cedula", SqlDbType.VarChar, 20).Value = txtID.Text;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = txtPassword.Text;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session["Usuariologueado"] = txtID.Text;
                    Response.Redirect("../Admin/AdminHome.aspx");
                }
                else
                {
                    lblError.Text = "Ingresaste erroneamente el ID o Contraseña";
                }
                cmd.Connection.Close();
            }
            catch (Exception)
            {
                throw;
            }

            try
            {
                cmt.Connection.Open();
                cmt.Parameters.Add("@Cedula", SqlDbType.VarChar, 20).Value = txtID.Text;
                cmt.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = txtPassword.Text;
                SqlDataReader dt = cmt.ExecuteReader();
                if (dt.Read())
                {
                    Session["Usuariologueado"] = txtID.Text;
                    Response.Redirect("../Teacher/TeacherHome.aspx");
                }
                else
                {
                    lblError.Text = "Ingresaste erroneamente el ID o Contraseña";
                }
                cmt.Connection.Close();
            }
            catch (Exception)
            {

                throw;
            }

            try
            {
                cms.Connection.Open();
                cms.Parameters.Add("@Cedula", SqlDbType.VarChar, 20).Value = txtID.Text;
                cms.Parameters.Add("@Password", SqlDbType.VarChar, 50).Value = txtPassword.Text;
                SqlDataReader ds = cms.ExecuteReader();

                if (ds.Read())
                {
                    Session["Usuariologueado"] = txtID.Text;
                    Response.Redirect("../Student/StudentHome.aspx");
                }
                else
                {
                    lblError.Text = "Ingresaste erroneamente el ID o Contraseña";
                }
                cms.Connection.Close();
            }
            catch (Exception)
            {

                throw;
            }      
        }

    }
}