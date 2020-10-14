 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="shoe.index" %>

<!DOCTYPE html>

<html id="top" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HTV Shop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"       />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"/>
    <link rel="stylesheet" href="Css/index.css"/>
    
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
    
</head>
<body>
    <a href="#top"  id="myBtn" title="top">
        <i class="fa fa-arrow-up"></i>
    </a>
    
    
    <form id="form1" runat="server">
    
    
    <header id="header" class="py-2">
        <div class="container-fluid">
            <div class="row">
               <div class="col-md-6 text-center text-md-left header-left pt-1 ">
                    <div class="row pt-2">
                        <div class="col-md-4 detail">
                            <i class="fa fa-phone"></i>
                            <span class="mr-8">0938745361</span>
                        </div>
                        <div class="col-md-6">
                            <i class="fa fa-envelope-square"></i>
                            <span>dinhhoangnguyen6399@gmail.com</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 text-center text-md-left header-right ">
                    <div class="row">
                        <div class="col-md-8 pt-2 text-right ">                            
                            <asp:LinkButton ID="lbDangNhap" OnClick="lbDangNhap_Click"  runat="server" Font-Bold="True" ForeColor="Black">Login</asp:LinkButton>
                        </div>
                        <div class="col-md-4 text-left">
                            <i class="fa fa-shopping-cart "></i>
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
    </header>

    <nav class="navbar navbar-expand-md navbar-light ">
        <div class="container">
            <a href="index.html" class="navbar-brand navbar-brand--logo text-center">
                <div>
                    <img src="img/logo1.JPG" alt="logo" width="100" height="100"/>
                    <img src="img/logoText.JPG" alt="text" width="170" height="170"/>
                </div>
            </a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#myMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="myMenu">
                <ul class="navbar-nav navbar-nav--menu m-auto">
                    <li class="nav-item active">
                        <a href="#header" class="nav-link">HOME</a>                 
                    </li>
                    <li class="nav-item ">
                        <a href="#product" class="nav-link">MEN</a>                    
                    </li>
                    <li class="nav-item">
                        <a href="#product" class="nav-link">WOMEN</a>                       
                    </li>
                    <li class="nav-item">
                        <a href="#product" class="nav-link">KID</a>                  
                    </li>
                    <li class="nav-item">
                        <a href="#new_item" class="nav-link">NEW</a>
                    </li>
                    <li class="nav-item">
                        <a href="#best_seller" class="nav-link">SELLER</a>
                    </li>
                </ul>
            </div>
            <div class="search">
                <input type="text" placeholder="Input keyword"/>
                <i class="fa fa-search"></i>
            </div>
        </div>
    </nav>


    <section class="my-carousel">
        <div class="carousel slide" data-ride="carousel" id="carousel-slider">
            <ol class="carousel-indicators carousel-indicators--config">
                <li class="active" data-target="#carousel-slider" data-slide-to="0"></li>
                <li data-target="#carousel-slider" data-slide-to="1"></li>
                <li data-target="#carousel-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/attachment_63681242.jpg" class="img-fluid"/>
                    <div class="carousel-caption carousel-caption--config">
                        <h1>Football Shoes <b>Sport</b></h1>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                            Ullam sit voluptas explicabo </p>
                        <button class="btn btn-outline-light btn--read-more py-1 px-2 py-sm-2 px-sm-3"
                            data-toggle="modal" data-target="#modal-carousel-1">Read more
                            <i class="fa fa-angle-double-right"></i>
                        </button>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/KD.jpg" class="img-fluid"/>
                    <div class="carousel-caption carousel-caption--config">
                        <h1>Football Shoes <b>Sport</b></h1>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                            Ullam sit voluptas explicabo </p>
                        <button class="btn btn-outline-light btn--read-more py-1 px-2 py-sm-2 px-sm-3"
                            data-toggle="modal" data-target="#modal-carousel-2">Read more
                            <i class="fa fa-angle-double-right"></i>
                        </button>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/Pegasus_Turbo_Banner.jpg" class="img-fluid"/>
                    <div class="carousel-caption carousel-caption--config">
                        <h1>Football Shoes <b>Sport</b></h1>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                            Ullam sit </p>
                        <button class="btn btn-outline-light btn--read-more py-1 px-2 py-sm-2 px-sm-3"
                            data-toggle="modal" data-target="#modal-carousel-3">Read more
                            <i class="fa fa-angle-double-right"></i>
                        </button>
                    </div>
                </div>
            </div>
            <a href="#carousel-slider" data-slide="prev" class="carousel-control-prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a href="#carousel-slider" data-slide="next" class="carousel-control-next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        </section>


   
    <!--New item-->
    <section id="new_item">
        <div class="container">
            <h1 class="new_item_title"> New Item </h1>
            <div class="row">
                <div class="col-3 text-center">
                    <div class="Shoes_item text-white">
                        <img src="img/item/zoom-pegasus-turbo-2-.jpg" alt="jd_270" class="w-100" width="50"
                            height="300"/>
                        <img src="img/item/zoom-pegasus-turbo-2-running-shoe-sQMJVQ.jpg" alt="jd_270"
                            class="item_overlay"/>
                        <!-- <div class="item_overlay"></div> -->
                        <div class="item_detail">
                            <i class="fa fa-dollar-sign d-block"></i>
                            <a class="d-block"> BUY NOW </a>
                            <span>172$</span>
                        </div>
                    </div>
                    <p class="item_name font-weight-bold">Nike Zoom Pegasus Turbo 2</p>
                </div>
                <div class="col-3 text-center">
                    <div class="Shoes_item text-white">
                        <img src="img/item/custom-nike-air-zoom-pegasus-37.jpg" alt="jd_270" class="w-100" width="50"
                            height="300"/>
                        <img src="img/item/custom-nike-air-zoom-pegasus-37-shield-by-you.jpg" alt="jd_270"
                            class="item_overlay"/>
                        <!-- <div class="item_overlay"></div> -->
                        <div class="item_detail">
                            <i class="fa fa-dollar-sign d-block"></i>
                            <a class="d-block"> BUY NOW </a>
                            <span>160$</span>
                        </div>
                    </div>
                    <p class="item_name font-weight-bold">Nike Air Zoom Pegasus 37</p>
                </div>
                <div class="col-3 text-center">
                    <div class="Shoes_item text-white">
                        <img src="img/item/blazer-mid-77.jpg" alt="jd_270" class="w-100" width="50" height="300"/>
                        <img src="img/item/blazer-mid-77-vintage-shoe-dNWPTj.jpg" alt="jd_270" class="item_overlay"/>
                        <!-- <div class="item_overlay"></div> -->
                        <div class="item_detail">
                            <i class="fa fa-dollar-sign d-block"></i>
                            <a class="d-block"> BUY NOW </a>
                            <span>102$</span>
                        </div>
                    </div>
                    <p class="item_name font-weight-bold">Nike Blazer Mid '77 Vintage</p>
                </div>
                <div class="col-3 text-center">
                    <div class="Shoes_item text-white">
                        <img src="img/item/mercurial-vapor-13-pro-neymar-jr-fg-.jpg" alt="jd_270" class="w-100"
                            width="50" height="300"/>
                        <img src="img/item/mercurial-vapor-13-elite-neymar-jr-fg-football-boot-cQlM6G.jpg" alt="jd_270"
                            class="item_overlay"/>
                        <!-- <div class="item_overlay"></div> -->
                        <div class="item_detail">
                            <i class="fa fa-dollar-sign d-block"></i>
                            <a class="d-block"> BUY NOW </a>
                            <span>172$</span>
                        </div>
                    </div>
                    <p class="item_name font-weight-bold">Mercurial Vapor 13 Pro neymarjr Fg-</p>
                </div>
            </div>
        </div>
    </section>
    <!--Best Seller-->
    <section id="best_seller">
        <div class="container">
            <h1 class="new_item_title"> Best Seller </h1>
            <div class="row">
                <div class="col-3 text-center">
                    <div class="Shoes_item text-white">
                        <img src="img/item/novice-.jpg" alt="jd_270" class="w-100" width="50" height="300"/>
                        <img src="img/item/novice-younger-shoe-9T3BHG.jpg" alt="jd_270" class="item_overlay"/>
                        <!-- <div class="item_overlay"></div> -->
                        <div class="item_detail">
                            <i class="fa fa-dollar-sign d-block"></i>
                            <a class="d-block"> BUY NOW </a>
                            <span>160$</span>
                        </div>
                    </div>
                    <p class="item_name font-weight-bold">Nike Novice</p>
                </div>
                <div class="col-3 text-center">
                    <div class="Shoes_item text-white">
                        <img src="img/item/jordan-zoom-92-.jpg" alt="jd_270" class="w-100" width="50" height="300"/>
                        <img src="img/item/jordan-zoom-92-shoe-0kfcnp.jpg" alt="jd_270" class="item_overlay"/>
                        <!-- <div class="item_overlay"></div> -->
                        <div class="item_detail">
                            <i class="fa fa-dollar-sign d-block"></i>
                            <a class="d-block"> BUY NOW </a>
                            <span>172$</span>
                        </div>
                    </div>
                    <p class="item_name font-weight-bold">Nike Jordan Zoom '92</p>
                </div>
                <div class="col-3 text-center">
                    <div class="Shoes_item text-white">
                        <img src="img/item/mercurial-vapor-13-club-mg.jpg" alt="jd_270" class="w-100" width="50"
                            height="300"/>
                        <img src="img/item/mercurial-vapor-13-club-mg-multi-ground-football-boot-HrdKrp.jpg"
                            alt="jd_270" class="item_overlay"/>
                        <!-- <div class="item_overlay"></div> -->
                        <div class="item_detail">
                            <i class="fa fa-dollar-sign d-block"></i>
                            <a class="d-block"> BUY NOW </a>
                            <span>102$</span>
                        </div>
                    </div>
                    <p class="item_name font-weight-bold">Mercurial Vapor 13 Club Mg</p>
                </div>
                <div class="col-3 text-center">
                    <div class="Shoes_item text-white">
                        <img src="img/item/custom-air-max-95-unlocked-by-you.jpg" alt="jd_270" class="w-100" width="50"
                            height="300"/>
                        <img src="img/item/custom-air-max-95-unlocked-by-you (1).jpg" alt="jd_270" class="item_overlay"/>
                        <!-- <div class="item_overlay"></div> -->
                        <div class="item_detail">
                            <i class="fa fa-dollar-sign d-block"></i>
                            <a class="d-block"> BUY NOW </a>
                            <span>172$</span>
                        </div>
                    </div>
                    <p class="item_name font-weight-bold">Air Max 95 Unlocked By You</p>
                </div>
            </div>            
        </div>
    </section>

        <section id="product">
        <div class="container">
            <h1 class="new_item_title"> Product </h1>     
                <div class="row">
                <div class="col-md-3 text-center ">
                    <asp:DataList ID="DataList1" runat="server" Height="300px" RepeatColumns="4" RepeatDirection="Horizontal" CellSpacing="16" CellPadding="16" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <div class="Shoes_item text-center">
                                <asp:Label ID="Label4" runat="server"  ForeColor="#333333" Text="Mã sản phẩm: "></asp:Label>
                                <asp:Label ID="lbMaSp" runat="server" Text='<%# Bind("MaSP") %>' ForeColor="#333333"></asp:Label>
                                <asp:Image ID="Image1" runat="server" Height="300px" ImageUrl='<%# Bind("anh") %>' Width="248px" />
                                <div class="item_detail text-center">
                                    <i class="fa fa-dollar-sign d-block"></i>
                                     
                                    <asp:LinkButton ID="btnThem" CommandName="id" CommandArgument='<%# Eval("MaSP") %>'  runat="server" Text="BUY NOW" 
                                          BorderWidth="2px" 
                                        CssClass="btn-add" Font-Bold="True" Font-Size="Medium" ForeColor="Black"  />
                                   
                                 </div>
                                 <asp:Label ID="lbTenSp" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Medium" ForeColor="#333333" Text='<%# Bind("TenSP") %>'></asp:Label><br/>
                                 <asp:Label ID="lb" runat="server" ForeColor="#333333">Màu: </asp:Label><asp:Label ID="lbMau" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Medium" ForeColor="#333333" Text='<%# Bind("MauSac") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
          </div>   
    </section>
    <!--Contact-->
    <section class="my_ contact"></section>
    <!--Footer-->
    <footer id="footer">
        <div class="footer-detail mt-4">
            <div class="container">
                <div class="row">
                    <div class="col md-4 footer_about-us">
                        <h2>About Us</h2>
                        <p>ISC Quang Trung, Lô 14, Đường số 5, Công viên Phần mềm Quang Trung, Q.12, Tp.HCM, Việt Nam</p>
                    </div>
                    <div class="col md-4 footer_information">
                        <h2>Information</h2>
                        <p>
                            <i class="fa fa-check"></i>
                            <span>Tran Anh Vu.</span>
                        </p>
                        <p>
                            <i class="fa fa-check"></i>
                            <span>Nguyen Dinh Hoang.</span>
                        </p>
                        <p>
                            <i class="fa fa-check"></i>
                            <span>Vuong Thi Thao.</span>
                        </p>
                    </div>
                    <div class="col md-4 footer_contact">
                        <h2>Contact</h2>
                        <p>
                            <i class="fab fa-facebook-f"></i>
                            <i class="fab fa-instagram"></i>
                            <i class="fab fa-youtube"></i>
                        </p>
                        <p>
                            <img src="img/duong-quoc-cuong-thong-bao-bo-cong-thuong.png" alt="thongbao" width="170"
                                height="50"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right py-3 text-center text-black-50 text-bold">
            <p class="mb-0">Copyright © 2020 HTV Sneakers. Powered by ....</p>
        </div>
    </footer>
    <div class="modal fade" id="mymodal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5>My Modal</h5>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Bạn đã đăng kí thành công</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="loginmodal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:Label ID="Label3" runat="server" CssClass="font-weight-bold" Text="Mã Giày: "> </asp:Label>
                    <label>&nbsp</label>
                    <asp:Label ID="lbMaGiay" runat="server"  Text=""> </asp:Label>
                    <label>&nbsp</label>
                    <label>&nbsp</label>
                    <asp:Label ID="Label1" runat="server" CssClass="font-weight-bold" Text="Tên Giày: "> </asp:Label>
                    <label>&nbsp</label>
                    <asp:Label ID="lbT" runat="server"  Text=""> </asp:Label>
                    <label>&nbsp</label>
                    <label>&nbsp</label>
                    <asp:Label ID="Label2" runat="server" CssClass="font-weight-bold" Text="Màu: "> </asp:Label>
                    <label>&nbsp</label>
                    <asp:Label ID="lbM" runat="server"  Text=""> </asp:Label>
                    <label>&nbsp</label>
                     <asp:Label ID="lbG" runat="server"   Text=""> </asp:Label>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    
                    <h3 >Chọn Size Giày</h3>
                    <asp:DropDownList AppendDataBoundItems="true" AutoPostBack="true"  OnSelectedIndexChanged="cbSize_SelectedIndexChanged" ID="cbSize" runat="server">
                        <asp:listitem selected="True" text="" value="-1"></asp:listitem>
                    </asp:DropDownList>                  
                    <h4>Số Lượng:<asp:TextBox ID="txSoLuong" CssClass="w-25" runat="server" TextMode="Number"></asp:TextBox></h4>
                    <div runat="server" class="mt-3">                        
                        <h3>Giá: <asp:Label ID="lbGia" runat="server" Text=""></asp:Label></h3>
                    </div>
                   

                </div>
                <div class="modal-footer ">
                    <asp:Button ID="btnCart" CssClass="btn btn-info" OnClick="btnCart_Click" runat="server" Text="ADD" />                    
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>

    </div>
        <div class="modal fade" id="login">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5>Đăng Nhập</h5>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label> User name</label>
                            <input class="form-control" id="user_name" type="text" placeholder="Your user name"/>
                        </div>
                        <div class="form-group">
                            <label> PassWord</label>
                            <input class="form-control" id="pass" type="password" placeholder="Your user name"/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">Submit</button>
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>

    </div>
        <asp:LinkButton ID="btnShowPopup"  runat="server" 
                                          BorderWidth="2px" 
                                         Font-Bold="True" Font-Size="Medium" ForeColor="Black" data-toggle="modal" 
                                        data-target="#loginmodal" Enabled="False" />
        <asp:LinkButton ID="btnLogin"  runat="server" 
                                          BorderWidth="2px" 
                                         Font-Bold="True" Font-Size="Medium" ForeColor="Black" data-toggle="modal" 
                                        data-target="#login" Enabled="False" />

        <script type="text/javascript">
            function ShowPopup() {
                $("#btnShowPopup").click();
            }
            function ShowLogin() {
                $("#btnLogin").click();
            }
        </script> 
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script>
       $(document).on('click', 'a[href^="#"]', function (event) {
           event.preventDefault();

           $('html, body').animate({
               scrollTop: $($.attr(this, 'href')).offset().top
           }, 500);
       });
   </script>
     <script>
         //Get the button
         var mybutton = document.getElementById("myBtn");

         // When the user scrolls down 20px from the top of the document, show the button
         window.onscroll = function () { scrollFunction() };

         function scrollFunction() {
             if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                 mybutton.style.display = "block";
             } else {
                 mybutton.style.display = "none";
             }
         }
     </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
       ></script>
     

    </form>
    

</body>
</html>

