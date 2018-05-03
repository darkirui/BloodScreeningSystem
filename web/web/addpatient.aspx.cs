using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace web
{
    public partial class addpatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddPatient_Click(object sender, EventArgs e)
        {
            DataSet theDS = DAL.userdal.AddPatient(txtsurname.Text, txtfirstname.Text, txtlastname.Text, txtPhonenumber.Text, txtidno.Text, txtGender.Text, txtDOB.Text, txtSystolic.Text, txtDiastolic.Text,txtsarttransdate.Text);
        }
    }
}