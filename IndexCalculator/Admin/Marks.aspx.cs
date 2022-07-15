using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static IndexCalculator.Models.CommonFn;

namespace IndexCalculator.Admin
{
    public partial class Marks : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetMarks();
            }
        } 

        private void GetMarks()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], e.Id, e.ClassId, c.ClassName, e.SubjectId, 
                                       s.SubjectName, e.Cedula, e.TotalMarks, e.OutOfMarks from Exam e inner join Class c on e.ClassId = c.ClassId
                                        inner join Subject s on e.SubjectId = s.SubjectId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + classId + "' ");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Selecciona la Materia");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {               

                    string classId = ddlClass.SelectedValue;
                string subjectId = ddlSubject.SelectedValue;
                string cedula = txtCedula.Text.Trim();
                string studMarks = txtStudMarks.Text.Trim();
                DataTable dt = fn.Fetch("Select * from Exam where ClassId = '" + classId + "' and SubjectId = '" + subjectId 
                                                + "' and Cedula = '" + cedula + "' ");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Exam (ClassId, SubjectId, Cedula, TotalMarks) values('" + classId + "', '" + subjectId + "', '"
                                            + cedula + "', '" + studMarks + "')";
                        fn.Query(query);
                        lblMsg.Text = "Agregado Correctamente!";
                        lblMsg.CssClass = "alert alert-success";
                        ddlClass.SelectedIndex = 0;
                    ddlSubject.SelectedIndex = 0;
                    txtCedula.Text = string.Empty;
                        txtStudMarks.Text = string.Empty;
                    ddlClass.SelectedIndex = 0;
                        GetMarks();
                    }
                    else
                    {
                        lblMsg.Text = "Los <b>Datos</> ingresados ya existen!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void ddlClassGv_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}