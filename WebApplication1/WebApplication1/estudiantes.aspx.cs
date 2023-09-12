using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Matricula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            cls_estudiante obj_cls_credito_agregar = new cls_estudiante();
            obj_cls_credito_agregar.fnt_agregar
                (
                id.Text,
                nombre.Text,
                contacto.Text,
                correo.Text,
                direccion.Text,
                acudiente.Text,
                estrato.SelectedValue,
                genero.SelectedValue,
                observacion.Text

                );
            lbl_mensaje.Text = obj_cls_credito_agregar.getMensaje();
        }

        protected void btn_consultar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {

        }
    }
}