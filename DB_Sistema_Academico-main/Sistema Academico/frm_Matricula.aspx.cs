using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Academico
{
    public partial class frm_Matricula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btn_guardar_Click1(object sender, EventArgs e)
        {
            cls_matricula objMatricula = new cls_matricula();

            string idEstudiante = txt_idestudiante.Text;
            DateTime fecha = DateTime.Parse(txt_fecha.Text);
            float subtotal = float.Parse(txt_subtotal.Text);
            float iva = float.Parse(txt_iva.Text);

            // Llama al método fnt_agregarmatricula y verifica si se realizó con éxito.
            bool registroExitoso = objMatricula.fnt_agregarmatricula(idEstudiante, fecha, subtotal, iva);

            if (registroExitoso)
            {
                lbl_mensaje.Text = objMatricula.getMensaje();

                float total = objMatricula.getTotal();
                lbl_total.Text = total.ToString();
            }
            else
            {
                
                lbl_mensaje.Text = objMatricula.getMensaje();
            }
        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            txt_idestudiante.Text = string.Empty;
            txt_idestudiante.Focus();
            txt_fecha.Text = string.Empty;
            txt_subtotal.Text = string.Empty;
            txt_iva.Text = string.Empty;
            lbl_total.Text = string.Empty;
            lbl_mensaje.Text = string.Empty;
        }
    }
}