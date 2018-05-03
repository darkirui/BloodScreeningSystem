using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.Configuration;

namespace web
{
    public class database
    {
        static public String ConnectionString 
    {
       get
       {    // get connection string with name  database from  web.config.
           return WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
       }
    }
    }
}