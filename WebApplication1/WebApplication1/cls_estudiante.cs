using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class cls_estudiante
    {
        private string str_mensaje;
        SqlCommand con; SqlDataReader Lectura;

        private string str_nombre;
        private string str_contacto;
        private string str_correo;
        private string str_direccion;
        private string str_acudiente;
        private string str_estrato;
        private string str_genero;
        private string str_observacion;

        public void fnt_agregar(string id, string nombre,  string contacto, string correo,
            string direccion, string acudiente, string estrato, string genero, string observacion)
        {
            if ((id == "") || (nombre == "") || (contacto == "") || (correo == "") || (direccion == "") ||
                (acudiente == "")  || (observacion == ""))
            {
                str_mensaje = "Llene los campos obligatorios";
            }
            else
            {
                try
                {
                    cls_conexion objConecta = new cls_conexion();
                    SqlCommand con = new SqlCommand("SP_registrar", objConecta.connection);
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.AddWithValue("@id", id);
                    con.Parameters.AddWithValue("@nombre", nombre);
                    con.Parameters.AddWithValue("@contacto", contacto);
                    con.Parameters.AddWithValue("@correo", correo);
                    con.Parameters.AddWithValue("@direccion", direccion);
                    con.Parameters.AddWithValue("@acudiente", acudiente);
                    con.Parameters.AddWithValue("@estrato", estrato);
                    con.Parameters.AddWithValue("@genero", genero);
                    con.Parameters.AddWithValue("@observacion", observacion);

                    objConecta.connection.Open();
                    con.ExecuteNonQuery();
                    objConecta.connection.Close();
                    str_mensaje = "Registro exitoso";
                }
                catch (Exception) { str_mensaje = "Faltan campos / este registro ya existe"; }
            }
        }


        public void fnt_consultar(string codigo)
        {
            try
            {
                cls_conexion objConecta = new cls_conexion();
                con = new SqlCommand("SP_Consultar", objConecta.connection);
                con.CommandType = CommandType.StoredProcedure;
                con.Parameters.AddWithValue("@Id", codigo);
                objConecta.connection.Open();
                Lectura = con.ExecuteReader();
                if (Lectura.Read() == true)
                {
                    str_nombre = Convert.ToString(Lectura[0]);
                    
                    str_contacto = Convert.ToString(Lectura[2]);
                    str_correo = Convert.ToString(Lectura[3]);
                    str_direccion = Convert.ToString(Lectura[4]);
                    
                    str_mensaje = "";
                }
            }
            catch (Exception)
            {
                str_mensaje = "No se encontraron registros";
            }
        }
        public string getMensaje() { return this.str_mensaje; }
        public string getNombre() { return this.str_nombre; }
      
        public string getContacto() { return this.str_contacto; }
        public string getCorreo() { return this.str_correo; }
        public string getDireccion() { return this.str_direccion; }
       
    }
}
