<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginHome.aspx.cs" Inherits="IndexCalculator.Login.LoginHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/newLoginStyle.css" rel="stylesheet" />
    <title>Login</title>     
</head>
<body>
   <form id="form1" runat="server">

    <div style="background-image:url('../Image/sign-up.png.jpg'); width:100%; height:900px; background-repeat: no-repeat; background-size:cover; background-attachment:fixed;">
    <div class="container login-container">
        <div class="m-0 row justify-content-center">
                <div class="col-md-6 login-form-2">
                    <h3>Login</h3>
                        <div class="form-group">
                           <asp:TextBox ID="txtID" runat="server" CssClass="form-control" placeholder="Ingrese su ID*" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingrese su contraseña*" required></asp:TextBox>                         
                        </div>
                        <div>
                            <asp:Label runat="server" ID="lblError" CssClass="alert-danger"></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="BtnIngresar" CssClass="form-control btn btn-primary btn-dark" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click"/>
                        </div>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
