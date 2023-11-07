using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplicationVOne
{
    public partial class WebFormProduct : System.Web.UI.Page
    {
        // Taken from
        // https://www.codeproject.com/articles/50540/gridview-event-handling

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_grid();
            }
        }

        public void grid1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlCategory = (DropDownList)e.Row.FindControl("ddlCategory");
                if (ddlCategory != null)
                {
                    ddlCategory.DataSource = Product.FetchCategory();
                    ddlCategory.DataBind();
                    ddlCategory.SelectedValue = grid1.DataKeys[e.Row.RowIndex].Values[1].ToString();
                }
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlCategoryInput = (DropDownList)e.Row.FindControl("ddlCategoryInput");
                ddlCategoryInput.DataSource = Product.FetchCategory();
                ddlCategoryInput.DataBind();
            }
        }

        public void grid1_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtName = (TextBox)grid1.Rows[e.RowIndex].FindControl("txtName");
            TextBox txtProductNo = (TextBox)grid1.Rows[e.RowIndex].FindControl("txtProductNo");
            TextBox txtColor = (TextBox)grid1.Rows[e.RowIndex].FindControl("txtColor");
            DropDownList ddlCategory = (DropDownList)grid1.Rows[e.RowIndex].FindControl("ddlCategory");
            TextBox txtCost = (TextBox)grid1.Rows[e.RowIndex].FindControl("txtCost");
            int upd = Product.update(grid1.DataKeys[e.RowIndex].Values[0].ToString(),
                        txtName.Text,
                        txtProductNo.Text,
                        txtColor.Text,
                        ddlCategory.SelectedValue.ToString(),
                        txtCost.Text
                        );
            grid1.EditIndex = -1;
            fill_grid();
            result.Text = upd.ToString() + " : Row updated";
        }

        protected void fill_grid()
        {
            DataTable dt = Product.FetchProducts();
            if (dt.Rows.Count > 0)
            {
                DataView dv = new DataView(dt);
                if (Session["sortexp"] != null)
                {
                    string srtexpr = Session["sortexp"].ToString();
                    switch (srtexpr)
                    {
                        case "name":
                            dv.Sort = "name";
                            break;
                        case "color":
                            dv.Sort = "color";
                            break;
                        case "Category":
                            dv.Sort = "Category";
                            break;
                        case "Cost":
                            dv.Sort = "Cost";
                            break;
                        default:
                            grid1.DataSource = dv;
                            break;
                    }
                }
                grid1.DataSource = dv;
                grid1.DataBind();
            }
            else
            {
                result.Text = " No rows Selected.";
            }
        }

        public void grid1_OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            grid1.EditIndex = e.NewEditIndex;
            fill_grid();
        }

        public void grid1_OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grid1.EditIndex = -1;
            result.Text = " ";
            fill_grid();
        }

        public void grid1_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {

                TextBox1.Text = "Clive B";
                /*
                int i = Convert.ToInt32(e.CommandArgument);
                GridViewRow gvRow = (GridViewRow)grid1.Rows[i];
                TextBox1.Text = gvRow.Cells[2].Text;
                */
            }

            if (e.CommandName == "Add_Rec")
            {
                TextBox txtNameInput = (TextBox)grid1.FooterRow.FindControl("txtNameInput");
                TextBox txtProductNumberInput = (TextBox)grid1.FooterRow.FindControl("txtProductNumberInput");
                TextBox txtColorInput = (TextBox)grid1.FooterRow.FindControl("txtColorInput");
                DropDownList ddlCategoryInput = (DropDownList)grid1.FooterRow.FindControl("ddlCategoryInput");
                TextBox txtCostInput = (TextBox)grid1.FooterRow.FindControl("txtCostInput");
                int rowInsert
                    = Product.insertRow(
                                         txtNameInput.Text,
                                         txtProductNumberInput.Text,
                                         txtColorInput.Text,
                                         ddlCategoryInput.SelectedValue.ToString(),
                                         txtCostInput.Text
                    );
                fill_grid();
                result.Text = rowInsert.ToString() + " :Row was Inserted Successfully";
            }
        }

        public void grid1_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string product_Id = grid1.DataKeys[e.RowIndex].Values[0].ToString();
            int rowdel = Product.RowDelete(product_Id);
            result.Text = rowdel.ToString() + " : Row was Deleted.";
            fill_grid();
        }

        public void grid1_OnSorting(object sender, GridViewSortEventArgs e)
        {
            string sortexp = e.SortExpression;
            Session["sortexp"] = sortexp;
            fill_grid();
        }

        public void grid1_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid1.PageIndex = e.NewPageIndex;
            fill_grid();
        }

    }
}