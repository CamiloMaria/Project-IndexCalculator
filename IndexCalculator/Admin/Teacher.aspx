<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="IndexCalculator.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image:url('../Image/white.jpg'); width:100%; height:960px; background-repeat: no-repeat; background-size:cover; background-attachment:fixed;">

            <div class="container p-md-4 p-sm-4">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Profesor</h3>

            <div class="row mob-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="ddlClass">Nombre Completo</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Ingrese Nombre" required>
                    </asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="El nombre debe ser letras" ForeColor="Red" 
                        ValidationExpression="^[A-zÀ-ú\s]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                    </asp:RegularExpressionValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtDoB">Fecha de Nacimiento</label>
                    <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date" required>
                    </asp:TextBox>   
                </div>
            </div>

            <div class="row mob-3 mr-lg-5 ml-lg-5 mt-md-5">
                 <div class="col-md-6">
                        <label for="txtCedula">Cedula</label>
                        <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" placeholder="00000000000" required>
                        </asp:TextBox>    
                 </div>
            </div>           
            
            <div class="row mob-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="ddlGender">Genero</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Eliga el genero</asp:ListItem>
                        <asp:ListItem>Hombre</asp:ListItem>
                        <asp:ListItem>Mujer</asp:ListItem>
                        <asp:ListItem>Otros</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Genero es requerido"
                        ForColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Eliga el genero">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtMobile">Telefono</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="0000000000" required>
                    </asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numero invalido" ForeColor="Red" 
                        ValidationExpression="^[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                    </asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="row mob-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtEmail">Correo</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Ingrese el correo" TextMode="Email" required>
                    </asp:TextBox>                    
                </div>
                <div class="col-md-6">
                    <label for="txtPassword">Contraseña</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Ingrese la contraseña" TextMode="Password" required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mob-3 mr-lg-5 ml-lg-5">
                 <div class="col-md-3 col-md-offset-2 mb-3">
                     <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#bd3219" Text="Agregar Profesor" OnClick="btnAdd_Click" />
                 </div>
            </div>

            <div class="row mob-3 mr-lg-5 ml-lg-5">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="TeacherId" AutoGenerateColumns="False" 
                        EmptyDataText="No datos para mostrar!" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" PageSize="4" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Aula.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Nombre">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control"
                                        width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Telefono">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control"
                                        width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Correo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>' CssClass="form-control"
                                        width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
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


</asp:Content>
