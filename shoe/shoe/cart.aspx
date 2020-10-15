<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="shoe.cart" %>

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
                        <img src="img/logo1.JPG" alt="logo" width="100" height="100"/>
                    <img src="img/logoText.JPG" alt="text" width="170" height="170"/>
                    </div>
                    <div class="col-md-4">
                        <h1 class="mt-5">Cart Detail</h1>
                    </div>
                    <div class="col-md-4 ">
                        <asp:Image  CssClass="im" ID="imgUser" runat="server" BackColor="Black" Height="140px" Width="140px" /><br/>
                        <asp:Label ID="lbUsername" CssClass="username mt-1" runat="server" Text="Label"></asp:Label>
                    </div>                    
                </div>
        </div>
        <div class="container mt-3">
            <asp:GridView CssClass="gr" DataKeyNames="MaSp" ID="grCart"  runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="213px" Width="753px" AllowPaging="True" OnPageIndexChanging="grCart_PageIndexChanging" OnRowCancelingEdit="grCart_RowCancelingEdit" OnRowEditing="grCart_RowEditing" OnRowUpdating="grCart_RowUpdating" OnRowDeleting="grCart_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaSp" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSp" />
                    <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" SortExpression="TenSP" ReadOnly="True" />
                    <asp:ImageField DataImageUrlField="anh" HeaderText="Ảnh" ReadOnly="True">
                        <ControlStyle Height="200px" Width="200px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Màu sắc" SortExpression="MauSac">
                        <EditItemTemplate>
                            <asp:Label ID="lbMauSac" runat="server" Text='<%# Eval("MauSac") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("MauSac") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Size" SortExpression="name">
                        <EditItemTemplate>
                            <asp:Label ID="lbSize" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số lượng" SortExpression="SoLuong">
                        <EditItemTemplate>
                            <asp:TextBox ID="txSoLuongUp" runat="server" Text='<%# Bind("SoLuong") %>' TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SoLuong") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GiaBan" HeaderText="Giá Bán" ReadOnly="True" SortExpression="GiaBan" />
                    <asp:CommandField CausesValidation="false" ShowEditButton="true" SelectText="Edit">
                    <ControlStyle Font-Bold="True" ForeColor="Maroon" />
                    <ItemStyle Font-Bold="True" ForeColor="Maroon" />
                    </asp:CommandField>
                    
                    <asp:CommandField CausesValidation="false" ShowDeleteButton="true" SelectText="Delete">
                    <ControlStyle Font-Bold="True" ForeColor="Maroon" />
                    <ItemStyle Font-Bold="True" ForeColor="Maroon" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <h2 class="mt-3 ml-4">Tổng Tiền:<asp:Label ID="lbTongTien" runat="server" Font-Bold="True" ForeColor="#990000"></asp:Label></h2>

        </div>

         <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
       ></script>
    </form>
</body>
</html>
