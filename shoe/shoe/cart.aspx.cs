using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cartId = Session["cart"] as string;
             if (Session["cart"] == null)
                 Response.Redirect("index.aspx");
             else
             {
                if (!IsPostBack)
                {
                    string userId = getUserId(cartId);
                    string sql = "Select anh,userName from users where userId='" + userId + "'";
                    DataTable data = KetNoi.Excutequerry(sql);
                    foreach (DataRow row in data.Rows)
                    {
                        lbUsername.Text = row["username"].ToString();
                        imgUser.ImageUrl = row["anh"].ToString();

                    }
                    loadCart(cartId);
                }
            }
            
               
        }
        string getUserId(string cartId)
        {
            string sql = "Select UserId from cart where cartId='" + cartId + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            foreach (DataRow row in data.Rows)
                return row["UserId"].ToString();
            return "";
        }
        void loadCart(string cartId)
        {
            string sql = "select C.MaSP,S.TenSP,C.MauSac,z.name,C.SoLuong,C.giaBan from SanPham S,CartDetail C,Size z where S.MaSP=C.MaSP and z.SizeId=C.SizeId and C.Cartid='" + cartId + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            grCart.DataSource = data;
            grCart.DataBind();
        }
       
    }
}