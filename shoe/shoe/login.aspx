<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="shoe.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"       />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"/>
     <link rel="stylesheet" href="Css/cart.css"/>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container">
           
                <div class="row text-center mt-3">
                    <div class="col-md-4">
                        <a href="index.aspx">
                            <img src="img/logo1.JPG" alt="logo" width="100" height="100"/>
                            <img src="img/logoText.JPG" alt="text" width="170" height="170"/>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <h1 class="mt-5">Sign Up</h1>
                    </div>
                                       
                </div>
             <div class="row mt-5 align-items-center">
                 <div class="col-md-4 text-right">
                    <h3>UserName:</h3>
                 </div>
                 <div class="col-md-8 text-left">
                     <div class="form-group">
                         <asp:TextBox ID="txUserName" CssClass="form-control w-75 float-left " runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator CssClass="ml-1" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txUserName" ErrorMessage="Enter Username" ForeColor="Maroon" Font-Bold="True" Font-Size="20px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                     </div>                     
                  </div>
                 <div class="col-md-4 text-right">
                     <h3>Password:</h3>
                 </div>
                 <div class="col-md-8 text-left">
                     <div class="form-group">
                         <asp:TextBox ID="txPassword" TextMode="Password" CssClass="form-control w-75 float-left " runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="ml-1" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txPassword" ErrorMessage="Enter password" ForeColor="Maroon" Font-Bold="True" Font-Size="20px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                     </div>                     
                  </div>
                 <div class="col-md-4 text-right">
                     <h3>Password Again:</h3>
                 </div>
                 <div class="col-md-8 text-left">
                     <div class="form-group">
                         <asp:TextBox ID="txPassAgain" TextMode="Password" CssClass="form-control w-75 float-left " runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="ml-1" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txPassAgain" ErrorMessage="Enter password again" ForeColor="Maroon" Font-Bold="True" Font-Size="20px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                     </div>                     
                  </div>
                 <div class="col-md-4 text-right">
                     <h3>Phone Nummber:</h3>
                 </div>
                 <div class="col-md-8 text-left">
                     <div class="form-group">
                         <asp:TextBox ID="txPhone" TextMode="Number" CssClass="form-control w-75 float-left " runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="ml-1" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txPhone" ErrorMessage="Enter phone number" ForeColor="Maroon" Font-Bold="True" Font-Size="20px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                     </div>                     
                  </div>
                 <div class="col-md-4 text-right">
                     <h3>Address:</h3>
                 </div>
                 <div class="col-md-8 text-left">
                     <div class="form-group">
                         <asp:TextBox ID="txAddress" TextMode="MultiLine" CssClass="form-control w-75 h-75 float-left " runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="ml-1" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txAddress" ErrorMessage="Enter address" ForeColor="Maroon" Font-Bold="True" Font-Size="20px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                     </div>                     
                  </div>
                 <div class="col-md-4 text-right">
                     <h3>Email:</h3>
                 </div>
                 <div class="col-md-8 text-left">
                     <div class="form-group">
                         <asp:TextBox ID="txEmail" CssClass="form-control w-75 float-left " runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator CssClass="ml-1" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txEmail" ErrorMessage="Enter Email" ForeColor="Maroon" Font-Bold="True" Font-Size="20px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                     </div>                     
                  </div>
                 <div class="col-md-4 text-right">
                     <h3>Image:</h3>
                 </div>
                 <div class="col-md-8 text-left">
                     <div class="form-group">
                         <asp:FileUpload ID="fulImage"  runat="server"></asp:FileUpload>
                         
                     </div>                     
                  </div>
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Maroon" />
                

             </div>
              <div class="row mt-3">
                      <div class="col-md-6 text-right">
                        <asp:Button runat="server" OnClick="btnSignUp_Click" CssClass="btn btn-info" ID="btnSignUp" Text="SignUp" />
                       </div>
                        <div class="col-md-6 text-left">
                            <asp:Button runat="server" OnClick="btnCancel_Click" CausesValidation="false" CssClass="btn btn-secondary" ID="btnCancel" Text="Cancel" />             
                         </div>
                 </div>
        </div>
    </form>
</body>
</html>
