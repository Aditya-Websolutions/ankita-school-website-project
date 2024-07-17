<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="AnkitaLaxmiFinal.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Profile.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header">
    <div class="container">
        <h1>Student Profile Dashboard</h1>
        <div class="logout">
            <a href="Login.aspx" class="btn btn-light btn-sm">Logout</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="student-info">
        <h2>Student Information</h2>
        <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server"></asp:Label></p>
        <p><strong>Class:</strong> <asp:Label ID="lblClass" runat="server"></asp:Label></p>
        <p><strong>Roll No:</strong> <asp:Label ID="lblRollNo" runat="server"></asp:Label></p>
        <p><strong>DOB:</strong> <asp:Label ID="lblDOB" runat="server"></asp:Label></p>
        <p><strong>Blood Group:</strong> <asp:Label ID="lblBloodGroup" runat="server"></asp:Label></p>
        <p><strong>Phone Number:</strong> <asp:Label ID="lblPhoneNumber" runat="server"></asp:Label></p>
        <p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server"></asp:Label></p>
    </div>
</div>
</asp:Content>
