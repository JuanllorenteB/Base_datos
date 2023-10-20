using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Drawing;

namespace Sistema_Academico
{
    public class cls_estudiante
    {
        private string str_mensaje;
        private string str_nombre;
        private string str_contacto;
        private string str_correo;
        private string str_direccion;
        private string str_acudiente;
        private int int_estrato;
        private int int_sexo;
        private string str_observaciones;

        public void fnt_agregar(string id, string nombre, string contacto, string correo, string direccion, string acudiente, int estrato, int sexo, string observaciones)
        {
            try
            {
                cls_conexion objConecta = new cls_conexion();
                SqlCommand con = new SqlCommand("sp_registrarestudiante", objConecta.connection);
                con.CommandType = CommandType.StoredProcedure;
                con.Parameters.AddWithValue("@id", id);
                con.Parameters.AddWithValue("@nombre", nombre);
                con.Parameters.AddWithValue("@contacto", contacto);
                con.Parameters.AddWithValue("@correo", correo);
                con.Parameters.AddWithValue("@direccion", direccion);
                con.Parameters.AddWithValue("@acudiente", acudiente);
                con.Parameters.AddWithValue("@fkcodigo_estrato", estrato);
                con.Parameters.AddWithValue("@fkcodigo_sexo", sexo);
                con.Parameters.AddWithValue("@observaciones", observaciones);
                objConecta.connection.Open();
                con.ExecuteNonQuery();
                objConecta.connection.Close();
                str_mensaje = "Registro exitoso";
            }
            catch (Exception ex)
            {
                str_mensaje = "Error: " + ex.Message;
            }


        }

        public void fnt_consultar(String id)
        {
            try
            {
                cls_conexion objConecta = new cls_conexion();
                SqlCommand con = new SqlCommand("sp_consultarestudiante", objConecta.connection);
                con.CommandType = CommandType.StoredProcedure;
                con.Parameters.AddWithValue("@id", id);
                objConecta.connection.Open();
                SqlDataReader reader = con.ExecuteReader();

                while (reader.Read())
                {
                    // Aquí puedes procesar los resultados directamente o imprimirlos como desees.
                    // Por ejemplo, puedes asignarlos a las propiedades de tu clase o imprimirlos.
                    str_nombre = reader["nombre"].ToString();
                    str_contacto = reader["contacto"].ToString();
                    str_correo = reader["correo"].ToString();
                    str_direccion = reader["direccion"].ToString();
                    str_acudiente = reader["acudiente"].ToString();

                    // Verificar si el valor del estrato es convertible a un entero.
                    if (int.TryParse(reader["fkcodigo_tbl_estrato"].ToString(), out int estratoValue))
                    {
                        int_estrato = estratoValue;
                    }
                    else
                    {
                        // Maneja el caso en el que el valor no sea convertible a un entero.
                        // Puedes asignar un valor predeterminado o tomar la acción adecuada.
                        int_estrato = -1; // Por ejemplo, asignar -1 como valor predeterminado.
                    }

                    int_sexo = Convert.ToInt32(reader["fkcodigo_tbl_sexo"]);
                    str_observaciones = reader["observaciones"].ToString();
                }

                objConecta.connection.Close();
                str_mensaje = "Consulta exitosa";
            }
            catch (Exception ex)
            {
                str_mensaje = "Error: " + ex.Message;
               
            }
        }

        public void fnt_actualizar(string id, string nombre, string contacto, string correo, string direccion, string acudiente, int estrato, int sexo, string observaciones)
        {
            try
            {
                cls_conexion objConecta = new cls_conexion();
                SqlCommand con = new SqlCommand("sp_actualizarestudiante", objConecta.connection);
                con.CommandType = CommandType.StoredProcedure;
                con.Parameters.AddWithValue("@id", id);
                con.Parameters.AddWithValue("@nombre", nombre);
                con.Parameters.AddWithValue("@contacto", contacto);
                con.Parameters.AddWithValue("@correo", correo);
                con.Parameters.AddWithValue("@direccion", direccion);
                con.Parameters.AddWithValue("@acudiente", acudiente);
                con.Parameters.AddWithValue("@fkcodigo_estrato", estrato);
                con.Parameters.AddWithValue("@fkcodigo_sexo", sexo);
                con.Parameters.AddWithValue("@observaciones", observaciones);
                objConecta.connection.Open();

                // Ejecutar el procedimiento almacenado
                con.ExecuteNonQuery();

                objConecta.connection.Close();
                str_mensaje = "Actualización exitosa";
            }
            catch (Exception ex)
            {
                str_mensaje = "Error: " + ex.Message;
            }
        }




        public string getMensaje() { return this.str_mensaje;}
        public string getNombre() { return this.str_nombre; }
        public string getContacto() { return this.str_contacto; }
        public string getCorreo() { return this.str_correo; }
        public string getDireccion() { return this.str_direccion; }
        public string getAcudiente() { return this.str_acudiente; }
        public int getEstrato() { return this.int_estrato; }
        public int getSexo() { return this.int_sexo;}
        public string getObservaciones() { return this.str_observaciones; }
    }
}