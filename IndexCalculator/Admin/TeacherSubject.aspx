<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="TeacherSubject.aspx.cs" Inherits="IndexCalculator.Admin.TeacherSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="background-image:url('../Image/white.jpg'); width:100%; height:960px; background-repeat: no-repeat; background-size:cover; background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Materia Profesor</h3>

            <div class="row mob-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="ddlClass">Aula</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="Aula es requerida."
                        ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Eliga el Aula" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="ddlSubject">Materia</label>
                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Materia es requerida."
                        ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Eliga la Materia" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </div>

                <div class="col-md-6">
                    <label for="ddlTeacher">Profesor</label>
                    <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Profesor es requerida."
                        ControlToValidate="ddlTeacher" Display="Dynamic" ForeColor="Red" InitialValue="Eliga al Profesor" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row mob-3 mr-lg-5 ml-lg-5">
                 <div class="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#bd3219" Text="Asignar Materia" OnClick="btnAdd_Click" />
                 </div>
            </div>

            <div class="row mob-8 mr-lg-6 ml-lg-6">
                <div class="col-md-30">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="Id" AutoGenerateColumns="False" 
                        EmptyDataText="No datos para mostrar!" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" PageSize="4" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Aula.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Aula">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlClassGv" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                        DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlClassGv_SelectedIndexChanged">
                                        <asp:ListItem>Seleccione la clase</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" 
                                        ProviderName="<%$ ConnectionStrings:SchoolCS.ProviderName %>" SelectCommand="SELECT * FROM [Class]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Materia">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSubjectGv" runat="server" CssClass="form-control"></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Profesor">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlTeacherGv" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" 
                                        DataValueField="TeacherId" SelectedValue='<%# Eval("TeacherId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolCS %>" 
                                        ProviderName="<%$ ConnectionStrings:SchoolCS.ProviderName %>" SelectCommand="SELECT [TeacherId], [Name] FROM [Teacher]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:CommandField CausesValidation="False" HeaderText="Operacion" ShowEditButton="True" ShowDeleteButton="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle BackColor="#bd3219" foreColor="white"/>
                    </asp:GridView>
                </div>
            </div>

        </div>
     </div>

</asp:Content>
