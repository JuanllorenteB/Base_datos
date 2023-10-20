using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Sistema_Academico
{
    public class cls_matricula
    {
        private string str_mensaje;
        private string str_idestudiante;
        private DateTime dt_fecha;
        private float flt_subtotal;
        private float flt_iva;
        private float flt_total;


        public bool fnt_agregarmatricula(string idEstudiante, DateTime fecha, float subtotal, float iva)
        {
            try
            {
                cls_conexion objConecta = new cls_conexion();
                SqlCommand con = new SqlCommand("sp_registrarmat", objConecta.connection);
                con.CommandType = CommandType.StoredProcedure;
                con.Parameters.AddWithValue("@fkid_tbl_estudiantes", idEstudiante);
                con.Parameters.AddWithValue("@fecha", fecha);
                con.Parameters.AddWithValue("@subtotal", subtotal);
                con.Parameters.AddWithValue("@iva", iva);
                objConecta.connection.Open();
                con.ExecuteNonQuery();
                objConecta.connection.Close();
                str_mensaje = "Registro de matrícula exitoso";

                float total = subtotal + (subtotal * (iva / 100));
                flt_total = total;

                return true; 
            }
            catch (Exception ex)
            {
                str_mensaje = "Error al registrar matrícula: " + ex.Message;
                return false; 
            }
        }



        public string getMensaje() { return this.str_mensaje; }

        public string getIdEstudiante() { return this.str_idestudiante;}

        public DateTime getFecha() { return this.dt_fecha; }

        public float getSubtotal() { return this.flt_subtotal; }

        public float getIva() { return this.flt_iva;}

        public float getTotal() { return this.flt_total;}
    }

}