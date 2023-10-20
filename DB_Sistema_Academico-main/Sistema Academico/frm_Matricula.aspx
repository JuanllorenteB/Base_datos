<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Matricula.aspx.cs" Inherits="Sistema_Academico.frm_Matricula" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario de Matriculas</title>



</head>
<body>
    <section class="vh-100" style="background-color: #c5e0dc;">
        <div class="container py-3 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                            
                            </div>
                            <div class="col-md-1 col-lg-1 d-flex align-items-center">
                                <div class="card-body p-3 p-lg-3 text-black">



                                    <h5 class="fw-normal mb-1 pb-1" style="letter-spacing: 1px;">Registro Estudiantil</h5>

                                    <form id="form1" runat="server">

                                        <div class="form-outline mb-2">
                                            <asp:TextBox ID="txt_idestudiante" runat="server" class="form-control form-control-sm" placeholder="ID Estudiante"></asp:TextBox>
                                        </div>

                                        <div class="form-outline mb-2">
                                            <asp:TextBox ID="txt_fecha" runat="server" class="form-control form-control-sm" placeholder="Date"></asp:TextBox>
                                        </div>

                                        <div class="form-outline mb-2">
                                            <asp:TextBox ID="txt_subtotal" runat="server" class="form-control form-control-sm" placeholder="Subtotal"></asp:TextBox>
                                        </div>

                                        <div class="form-outline mb-2">
                                            <asp:TextBox ID="txt_iva" runat="server" class="form-control form-control-sm" placeholder="IVA"></asp:TextBox>
                                        </div>

                                        <div class="form-outline mb-2">
                                            <asp:Label ID="lbl_total" runat="server" class="form-control form-control-sm" Text=""></asp:Label>
                                        </div>

                                        <div class="pt-1 mb-4">
                                            <div class="btn-group" role="group">
                                                <asp:Button ID="btn_guardar" class="btn btn-dark btn-md mr-2" runat="server" Text="Guardar" OnClick="btn_guardar_Click1" />
                                                <asp:Button ID="btn_consultar" class="btn btn-dark btn-md mr-2" runat="server" Text="Consultar"  />             
                                                <asp:Button ID="btn_actualizar" class="btn btn-dark btn-md mr-2"  runat="server" Text="Actualizar" />
                                                <asp:Button ID="btn_nuevo" class="btn btn-dark btn-md mr-2"  runat="server" Text="Nuevo" />
                                                
                                            </div>
                                        </div>

                                        <div class="form-outline mb-2">
                                            <asp:Label ID="lbl_mensaje" runat="server" Text="" class="form-control form-control-sm"></asp:Label>
                                        
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
