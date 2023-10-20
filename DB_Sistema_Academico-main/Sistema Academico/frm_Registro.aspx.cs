using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Sistema_Academico
{
    public partial class frm_Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            txt_id.Text = string.Empty;
            txt_id.Focus();
            txt_nombre.Text = string.Empty;
            txt_contacto.Text = string.Empty;
            txt_correo.Text = string.Empty;
            txt_direccion.Text = string.Empty;
            txt_acudiente.Text = string.Empty;
            ddl_estrato.SelectedIndex = 0; 
            ddl_sexo.SelectedIndex = 0; // Establece el valor predeterminado en el DropDownList
            txt_observacion.Text = string.Empty;
            lbl_mensaje.Text = string.Empty;

        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
          
            cls_estudiante objEstudiante = new cls_estudiante();

          
            string id = txt_id.Text;
            string nombre = txt_nombre.Text;
            string contacto = txt_contacto.Text;
            string correo = txt_correo.Text;
            string direccion = txt_direccion.Text;
            string acudiente = txt_acudiente.Text;

          
            if (int.TryParse(ddl_estrato.SelectedValue, out int estrato) && int.TryParse(ddl_sexo.SelectedValue, out int sexo))
            {
                string observaciones = txt_observacion.Text;

                
                objEstudiante.fnt_agregar(id, nombre, contacto, correo, direccion, acudiente, estrato, sexo, observaciones);

                
                lbl_mensaje.Text = objEstudiante.getMensaje();
            }
            else
            {
                lbl_mensaje.Text = "Error: Los valores de estrato y sexo no son números enteros válidos.";
            }
        }

        protected void btn_consultar_Click(object sender, EventArgs e)
        {

            // Obtén el valor del ID que se debe consultar desde el TextBox txtId.
            string id = txt_id.Text;

            // Crea una instancia de tu clase cls_estudiante.
            cls_estudiante Objestudiante = new cls_estudiante();



            // Llama al método fnt_consultar para realizar la consulta.
            Objestudiante.fnt_consultar(id);

            // Accede a los resultados y mensajes de estado desde la instancia de cls_estudiante.

            // Actualiza el mensaje en la etiqueta lblMensaje.
            lbl_mensaje.Text = Objestudiante.getMensaje();

            // Actualiza los valores en las etiquetas correspondientes.
            txt_nombre.Text = Objestudiante.getNombre();
            txt_contacto.Text = Objestudiante.getContacto();
            txt_correo.Text = Objestudiante.getCorreo();
            txt_direccion.Text = Objestudiante.getDireccion();
            txt_acudiente.Text = Objestudiante.getAcudiente();
            txt_observacion.Text = Objestudiante.getObservaciones();

            // El valor del estrato es un DropDownList, así que debes establecerlo según el resultado.
            string estratoValue = Objestudiante.getEstrato().ToString();
            ListItem estratoItem = ddl_estrato.Items.FindByValue(estratoValue);
            if (estratoItem != null)
            {
                ddl_estrato.SelectedValue = estratoValue;
            }
            

            // El valor del sexo es un DropDownList, de manera similar, debes establecerlo según el resultado.
            string sexoValue = Objestudiante.getSexo().ToString();
            ListItem sexoItem = ddl_sexo.Items.FindByValue(sexoValue);
            if (sexoItem != null)
            {
                ddl_sexo.SelectedValue = sexoValue;
            }
      
        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {
            // Obtén los valores actualizados del formulario
            string id = txt_id.Text;
            string nombre = txt_nombre.Text;
            string contacto = txt_contacto.Text;
            string correo = txt_correo.Text;
            string direccion = txt_direccion.Text;
            string acudiente = txt_acudiente.Text;

            if (int.TryParse(ddl_estrato.SelectedValue, out int estrato) && int.TryParse(ddl_sexo.SelectedValue, out int sexo))
            {
                string observaciones = txt_observacion.Text;

                // Crea una instancia de tu clase cls_estudiante
                cls_estudiante objEstudiante = new cls_estudiante();

                // Llama al método fnt_actualizar para actualizar los datos del estudiante
                objEstudiante.fnt_actualizar(id, nombre, contacto, correo, direccion, acudiente, estrato, sexo, observaciones);

                // Actualiza el mensaje en la etiqueta lbl_mensaje
                lbl_mensaje.Text = objEstudiante.getMensaje();
            }
            else
            {
                lbl_mensaje.Text = "Error: Los valores de estrato y sexo no son números enteros válidos.";
            }
        }

    }
}
