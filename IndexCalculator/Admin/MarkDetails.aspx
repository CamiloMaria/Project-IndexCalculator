<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="IndexCalculator.Admin.MarkDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div style="background-image:url('../Image/white.jpg'); width:100%; height:960px; background-repeat: no-repeat; background-size:cover; background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Agregar Notas</h3>

            <div class="row mob-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="ddlClass">Aula</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" ></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="Aula es requerida."
                        ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Eliga el Aula" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </div>
                
                <div class="col-md-6">
                    <label for="txtCedula">ID</label>
                    <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" placeholder="Ingrese estudiante ID" required></asp:TextBox>
                </div>
           </div>

                <div class="row mob-3 mr-lg-5 ml-lg-5">
                 <div class="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#bd3219" Text="Obtener Notas" OnClick="btnAdd_Click" />
                 </div>
                </div>

            <div class="row mob-3 mr-lg-5 ml-lg-5">
                <div class="col-md-30">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="False" 
                        EmptyDataText="No datos para mostrar!" AllowPaging="True" PageSize="8" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Aula.No">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Id" HeaderText="Examen ID">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="ClassName" HeaderText="Aula">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>     
                            
                            <asp:BoundField DataField="SubjectName" HeaderText="Materia">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>   

                            <asp:BoundField DataField="Cedula" HeaderText="ID">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>   

                            <asp:BoundField DataField="TotalMarks" HeaderText="Nota Total">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>   

                            <asp:BoundField DataField="OutOfMarks" HeaderText="Nota Literal">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>   

                        </Columns>
                        <HeaderStyle BackColor="#bd3219" foreColor="white"/>
                    </asp:GridView>
                </div>
            </div>
        </div>
      </div>

</asp:Content>
