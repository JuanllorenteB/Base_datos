<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="estudiantes.aspx.cs" Inherits="WebApplication1.Matricula" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Matricula</title>
    <link rel="stylesheet" type="text/css" href="css_estudiantes.css"/>
   
       
  
</head>
<body>
    <form id="estudiante" runat="server">
        <div id="estudiante_post">
            <h3>Formulario de Registro de estudiante</h3>
            <div class="caja">
                <asp:TextBox ID="id" runat="server" placeholder="ID" required ="true"></asp:TextBox> 
            </div>
            <div class="caja">
                <asp:TextBox ID="nombre" runat="server" placeholder="Nombres *"></asp:TextBox> 
            </div>
            <div class="caja">
                <asp:TextBox ID="contacto" runat="server" placeholder="Apellidos *" ></asp:TextBox> 
            </div>
            <div class="caja">
                <asp:TextBox ID="correo" runat="server" placeholder="Contacto *" ></asp:TextBox> 
            </div>
            <div class="caja">
                <asp:TextBox ID="direccion" runat="server" placeholder="Correo *" ></asp:TextBox> 
            </div>
            <div class="caja">
                <asp:TextBox ID="acudiente" runat="server" placeholder="Dirección *" ></asp:TextBox> 
            </div>
             <div>
                 <h4>estrato</h4>
              <asp:DropDownList ID="estrato" runat="server" CssClass="estrato">
              
              </asp:DropDownList>
             </div>                      
           <h4>genero</h4>
            <asp:DropDownList ID="genero" runat="server" CssClass="sexo">
         
             </asp:DropDownList>
                    
            <div class="diseño">
                <h4>observacion</h4>
                <textarea id="observacion"></textarea>
            </div>

            <div class="btn-group">
                <asp:Button ID="registrar" runat="server" Text="Registrar" CssClass="btn" OnClick="btn_registrar_Click"  />
                <asp:Button ID="consultar" runat="server" Text="Consulta" CssClass="btn" OnClick="btn_consultar_Click" />
                <asp:Button ID="actualizar" runat="server" Text="actualizar" CssClass="btn" OnClick="btn_actualizar_Click" />
            </div>
            
            <asp:Label ID="lbl_mensaje" runat="server" ForeColor="Black"></asp:Label>
        </div>
    </form>
</body>
</html>