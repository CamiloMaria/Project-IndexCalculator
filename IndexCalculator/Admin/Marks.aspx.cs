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
                DataTable dttbl = fn.Fetch("Select StudentId from Student where ClassId = '" + classId + "' and Cedula = '" 
                                                + cedula + "' ");

                if (dttbl.Rows.Count > 0)
                {
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
                else
                {
                    lblMsg.Text = "El ID ingresado <b>"+ cedula +"</b> no existe para dicha clase!";
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
            GridView1.PageIndex = e.NewPageIndex;
            GetMarks();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetMarks();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetMarks();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int examId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlClassGv")).SelectedValue;
                string subjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlSubjectId")).SelectedValue;
                string cedula = (row.FindControl("txtCedulaGv") as TextBox).Text.Trim();
                string studMarks = (row.FindControl("txtStudMarksGv") as TextBox).Text.Trim();
                string outOfMarks = (row.FindControl("txtOutOfMarksGv") as TextBox).Text.Trim();
                fn.Query(@"Update Exam set ClassId = '" + classId + "', SubjectId = '" + subjectId + "', Cedula = '" + cedula + "', TotalMarks = '"
                                  + studMarks + "', OutOfMarks = '" + outOfMarks + "' where Id = '" + examId + "' ");
                lblMsg.Text = "Actualizada correctamente!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetMarks();
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
                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassGv");
                    DataTable dt = fn.Fetch("Select * from Subject where SubjectId = '" + ddlClass.SelectedValue + "' ");
                    ddlClass.DataSource = dt;
                    ddlClass.DataTextField = "SubjectName";
                    ddlClass.DataValueField = "SubjectId";
                    ddlClass.DataBind();
                    ddlClass.Items.Insert(0, "Seleccione la materia");
                    string selectedSubject = DataBinder.Eval(e.Row.DataItem, "SubjectName").ToString();
                    ddlClass.Items.FindByText(selectedSubject).Selected = true;
                }
            }
        }

        protected void ddlClassGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlClassSelected = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlClassSelected.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlSubjectGv = (DropDownList)row.FindControl("ddlSubjectGv");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + ddlClassSelected.SelectedValue + "' ");
                    ddlSubjectGv.DataSource = dt;
                    ddlSubjectGv.DataTextField = "SubjectName";
                    ddlSubjectGv.DataValueField = "SubjectId";
                    ddlSubjectGv.DataBind();
                }
            }
        }
    }
}