using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxDataView1_CustomCallback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        Session["CategoryID"] = e.Parameter;
        AccessDataSource1.SelectParameters["CategoryID"].DefaultValue = e.Parameter;
        (sender as ASPxDataView).DataBind();
    }
    protected void ASPxDataView1_Load(object sender, EventArgs e)
    {
        if (Session["CategoryID"] == null) return;
        AccessDataSource1.SelectParameters["CategoryID"].DefaultValue = Session["CategoryID"].ToString();
        (sender as ASPxDataView).DataBind();
    }
}