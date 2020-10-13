using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
            }
        }
        void loadData()
        {
            String sql = "   select S.MaSp,S.TenSP,C.GiaBan,C.anh,C.MauSac from CTSP C,SanPham S where C.MaSP=S.MaSP";
            DataTable data = KetNoi.Excutequerry(sql);
            DataList1.DataSource = data;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "id")
            {
                Label lbPrice = null;
                Label lbMau = null;
                Label lbTenSP = null;
                LinkButton a = null;
                foreach (DataListItem item in DataList1.Items)
                {
                   a = item.FindControl("btnThem") as LinkButton;
                    if (a.CommandArgument == e.CommandArgument.ToString())
                    {
                        lbPrice = item.FindControl("lbPrice") as Label;
                        lbMau = item.FindControl("lbMau") as Label;
                        lbTenSP = item.FindControl("lbTenSp") as Label;
                    }
                }
                lbT.Text = lbTenSP.Text;
                lbM.Text = lbMau.Text;
                lbG.Text = lbPrice.Text;
                RadioButton radioButton = new RadioButton();
                radioButton.Text = "40";
                divSize.Controls.Add(radioButton);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);

            }
        }
    }
}