using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class cls_conexion
    {
        public SqlConnection connection = new SqlConnection("Data Source=AP-SE105-01\\SQLEXPRESS;Initial Catalog=db_sistema_academico;Integrated Security=True");
    }
}