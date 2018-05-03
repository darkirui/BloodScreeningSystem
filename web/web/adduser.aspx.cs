using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class adduser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            string msg = DAL.userdal.AddUser(txtUsername.Text, txtUserPassword.Text, Int32.Parse(DDLUserRoles.SelectedValue));
            if (msg == null)
            {
                string message = "User Added Successfully";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + message + "');", true);
            }
            else
            {
                string message = "Error adding new user, please contact admin";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + message + "');", true);
            }
        }
    }
}