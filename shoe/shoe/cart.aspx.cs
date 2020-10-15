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
        string cartId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
             cartId = Session["cart"] as string;
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
                    getTongTien(cartId);
                }
            }
            
               
        }
        void getTongTien(string cartId)
        {
            string sql = "Select tongTien from cart where cartId='" + cartId + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            foreach(DataRow row in data.Rows)
            {
                lbTongTien.Text= row["tongTien"].ToString()+"$";
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
            string sql = "select C.MaSP,S.TenSP,C.MauSac,CT.anh,z.name,C.SoLuong,C.giaBan " +
                "from SanPham S,CTSP CT,CartDetail C,Size z " +
                "where S.MaSP=C.MaSP and z.SizeId=C.SizeId and CT.MaSP=S.MaSP " +
                "and C.MaSP=CT.MaSP and  C.MauSac=CT.MauSac and C.SizeId=CT.maSize " +
                "and C.Cartid='" + cartId + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            grCart.DataSource = data;
            grCart.DataBind();
        }

        protected void grCart_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grCart.PageIndex = e.NewPageIndex;
            loadCart(cartId);
        }

        protected void grCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grCart.EditIndex = -1;
            loadCart(cartId);
        }
        string getsizeid(string name)
        {
            string sql = "Select sizeId from size where name='" + name + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            foreach (DataRow row in data.Rows)
                return row["sizeId"].ToString();
            return "";
        }
        protected void grCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grCart.Rows[e.RowIndex];
            string MaSp = grCart.DataKeys[e.RowIndex].Value.ToString();
            Label MauSac = (Label)row.FindControl("lbMauSac");
            TextBox SoLuong = (TextBox)row.FindControl("txSoLuongUp");
             Label sizeName= (Label)row.FindControl("lbSize");
             string sizeId = getsizeid(sizeName.Text);
            

             string sql = "Update cartDetail set soLuong=" + SoLuong.Text + " where " +
                        "cartId='" + cartId + "' and maSp='" + MaSp + "' and sizeId='" + sizeId + "' and MauSac=N'" + MauSac.Text + "'";
             KetNoi.Excutequerry(sql);
            Response.Write("<script>alert('Sửa thành công')</script>");
             grCart.EditIndex = -1;
             loadCart(cartId);
            getTongTien(cartId);
        }

        protected void grCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grCart.EditIndex = e.NewEditIndex;
            loadCart(cartId);
        }

        protected void grCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = grCart.Rows[e.RowIndex];
            int maSp = int.Parse(grCart.DataKeys[e.RowIndex].Value.ToString());
            Label mausac =(Label)row.FindControl("Label2");
            Label sizeName = (Label)row.FindControl("Label3");
            string sizeId = getsizeid(sizeName.Text);
            string sql = "Delete cartDetail where masp='" + maSp + "'and MauSac=N'" + mausac.Text + "' and sizeId='" + sizeId + "' and cartId='" + cartId + "'";
            DataTable data = KetNoi.Excutequerry(sql);

            Response.Write("<script> alert('Xóa thành công') </script>");

            loadCart(cartId);
            getTongTien(cartId);
         
        }
    }
}