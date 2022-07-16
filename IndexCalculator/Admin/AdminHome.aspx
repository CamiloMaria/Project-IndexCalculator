<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="IndexCalculator.Admin.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .card-counter{
    box-shadow: 2px 2px 10px #DADADA;
    margin: 5px;
    padding: 20px 10px;
    background-color: #fff;
    height: 100px;
    border-radius: 5px;
    transition: .3s linear all;
  }

  .card-counter:hover{
    box-shadow: 4px 4px 20px #DADADA;
    transition: .3s linear all;
  }

  .card-counter.primary{
    background-color: #007bff;
    color: #FFF;
  }

  .card-counter.danger{
    background-color: #ef5350;
    color: #FFF;
  }  

  .card-counter.success{
    background-color: #66bb6a;
    color: #FFF;
  }  

  .card-counter.info{
    background-color: #26c6da;
    color: #FFF;
  }  

  .card-counter i{
    font-size: 5em;
    opacity: 0.2;
  }

  .card-counter .count-numbers{
    position: absolute;
    right: 35px;
    top: 20px;
    font-size: 32px;
    display: block;
  }

  .card-counter .count-name{
    position: absolute;
    right: 35px;
    top: 65px;
    font-style: italic;
    text-transform: capitalize;
    opacity: 0.5;
    display: block;
    font-size: 18px;
  }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div style="background-image:url('../Image/white.jpg'); width:100%; height:960px; background-repeat: no-repeat; background-size:cover; background-attachment:fixed;">
       <%-- <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Inicio</h2>
        </div>--%>
        <div class="container">
            <div class="row pt-5">
            <div class="col-md-3">
              <div class="card-counter primary">
                <i class="fa fa-users"></i>
                <span class="count-numbers"><% Response.Write(Session["student"]); %>;</span>
                <span class="count-name">Estudiantes Totales</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter danger">
                <i class="fa fa-chalkboard-teacher"></i>
                <span class="count-numbers"><% Response.Write(Session["teacher"]); %>;</span>
                <span class="count-name">Profesores Totales</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter success">
                <i class="fa fa-building"></i>
                <span class="count-numbers"><% Response.Write(Session["subject"]); %></span>
                <span class="count-name">Aulas Totales</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter info">
                <i class="fa fa-book"></i>
                <span class="count-numbers"><% Response.Write(Session["Subject"]); %></span>
                <span class="count-name">Materias Totales</span>
              </div>
            </div>
          </div>
        </div>
    </div>

</asp:Content>
