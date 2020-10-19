<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageProduct.aspx.cs" Inherits="shoe.manageProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-4 text-center">
                    <img src="img/logo1.JPG" alt="logo" width="100" height="100" />
                    <img src="img/logoText.JPG" alt="text" width="170" height="170" />
                </div>
                <div class="col-md-4 text-center">
                    <h1 class="mt-5 text-warning">Manage Product</h1>
                </div>
            </div>
            <asp:LinkButton ID="lbThemSp" runat="server" Font-Bold="True" ForeColor="Black" BorderColor="Black" OnClick="lbThemSp_Click">Thêm Sản Phẩm</asp:LinkButton>
        </div>
        <div class="container mt-3">
            <asp:GridView ID="grvMana" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" Height="379px" Width="1036px" OnSelectedIndexChanged="grvMana_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaSp" HeaderText="Mã Sản Phẩm">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenSP" HeaderText="Tên Sản Phẩm">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Loại sản phẩm">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenNhaCC" HeaderText="Nhà Cung Cấp">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="Chi Tiết Sản Phẩm" SelectText="Xem" ShowSelectButton="True">
                        <ItemStyle HorizontalAlign="Center" />
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
        </div>
        <!--Modal them sp-->
        <div class="modal fade" id="addProduct">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>Thêm sản phẩm</h5>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label>Tên Sản Phẩm</label>
                                <asp:TextBox CssClass="form-control" ID="txTenSp" placeholder="Nhập Tên sản phẩm" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Loại Giày</label>
                                <asp:DropDownList CssClass="form-control" ID="DropLoaiGiay" runat="server"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Nhà Cung Cấp</label>
                                <asp:DropDownList CssClass="form-control" ID="DropNcc" runat="server"></asp:DropDownList>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnThem" CssClass="btn btn-info" runat="server" Text="ADD" OnClick="btnThem_Click" />
                        <button class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <asp:LinkButton ID="btnAdd" runat="server"
            BorderWidth="2px"
            Font-Bold="True" Font-Size="Medium" ForeColor="Black" data-toggle="modal"
            data-target="#addProduct" Enabled="false" />


        <script type="text/javascript">
            //function ShowPopup() {
            //    $("#btnShowPopup").click();
            //}
            function ShowAdd() {
                $("#btnAdd").click();
            }
            function showalert() {
                $("#showalert").click();
            }
            //function showPro() {
            //    document.getElementById('product').scrollIntoView(true);
            //}

        </script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
