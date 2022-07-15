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
    public partial class Student : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetStudents();
            }
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string cedula = txtCedula.Text.Trim();
                    DataTable dt = fn.Fetch("Select * from Student where ClassId = '" + ddlClass.SelectedValue + "' and Cedula = '" + cedula + "' ");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Student values('" + txtName.Text.Trim() + "', '" + ddlGender.SelectedValue
                                            + "', '" + txtDoB.Text.Trim() + "', '" + txtMobile.Text.Trim() + "', '"
                                            + txtCarrera.Text.Trim() + "', '" + ddlClass.SelectedValue + "', '" + cedula + "')";
                        fn.Query(query);
                        lblMsg.Text = "Agregado Correctamente!";
                        lblMsg.CssClass = "alert alert-success";
                        ddlGender.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                        txtCedula.Text = string.Empty;
                        txtMobile.Text = string.Empty;
                        txtCarrera.Text = string.Empty;
                        txtDoB.Text = string.Empty;
                        ddlClass.SelectedIndex = 0;
                        GetStudents();
                    }
                    else
                    {
                        lblMsg.Text = "Ese estudiante ya existe!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "El genero es requerido";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void GetStudents()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], s.StudentId, s.[Name], s.Cedula, s.Gender, s.Mobile, 
                                       s.Carrera, c.ClassId, c.ClassName from Student s inner join Class c on c.ClassId = s.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetStudents();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetStudents();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetStudents();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtName") as TextBox).Text;
                string mobile = (row.FindControl("txtMobile") as TextBox).Text;
                string carrera = (row.FindControl("txtCarrera") as TextBox).Text;
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[4].FindControl("ddlClass")).SelectedValue;
                fn.Query("Update Student set Name = '" + name.Trim() + "', Mobile = '" + mobile.Trim() + "', Carrera = '" + carrera.Trim() + "', ClassId = '" 
                                  + classId + "' where StudentId = '" + studentId + "' ");
                lblMsg.Text = "Estudiante actualizada correctamente!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetStudents();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClass");
                    DataTable dt = fn.Fetch("Select * from Class");
                    ddlClass.DataSource = dt;
                    ddlClass.DataTextField = "ClassName";
                    ddlClass.DataValueField = "ClassId";
                    ddlClass.DataBind();
                    ddlClass.Items.Insert(0, "Seleccione la aula");
                    string selectedClass = DataBinder.Eval(e.Row.DataItem, "ClassName").ToString();
                    ddlClass.Items.FindByText(selectedClass).Selected = true;
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Student where StudentId = '" + studentId + "' ");
                lblMsg.Text = "Estudiante eliminado correctamente!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetStudents();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}