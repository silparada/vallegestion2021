program vallegestion;

uses
  System.SysUtils,
  vcl.forms,
  main in 'main.pas' {FmMain},
  articulos in 'class\articulos.pas',
  presenta in 'forms\sistema\presenta.pas' {SplashForm},
  recibovta_fm in 'forms\comprobantes\recibovta_fm.pas' {FmReciboVta},
  ArticulosMovim_fm in 'forms\archivos\ArticulosMovim_fm.PAS' {FmArticulosMovim},
  clientesCtaCte_fm in 'forms\archivos\clientesCtaCte_fm.pas' {FmCtaCteClientes},
  Ajustes_fm in 'forms\sistema\Ajustes_fm.pas' {FmAjustes},
  ComprobVtaImpxTipo_fm in 'forms\sistema\ComprobVtaImpxTipo_fm.pas' {FmComprobImpuestos},
  ComprobVtaImp_fm in 'forms\sistema\ComprobVtaImp_fm.pas' {FmImpuestos},
  articulos_fm in 'forms\archivos\articulos_fm.pas' {FmArticulos},
  ComprobVtaPtosVta_fm in 'forms\sistema\ComprobVtaPtosVta_fm.pas' {FmConfPuntosVta},
  ComprobVta_fm in 'forms\comprobantes\ComprobVta_fm.pas' {FmListaComprobVta},
  ComprobVtaTipos_fm in 'forms\sistema\ComprobVtaTipos_fm.pas' {FmConfTiposComprob},
  ComprobVtaDefinidos_fm in 'forms\sistema\ComprobVtaDefinidos_fm.pas' {FmConfigComprobDefinidos},
  EAN13Util in 'librerias\EAN13Util.pas',
  EncryptIt in 'librerias\EncryptIt.pas',
  Hashes in 'librerias\Hashes.pas',
  registro_fm in 'forms\sistema\registro_fm.pas' {FmRegistro},
  rp_ctacte in 'forms\reportes\rp_ctacte.pas' {Fm_RpCtaCte},
  gr_ventas in 'forms\reportes\gr_ventas.pas' {Fm_GRVentas},
  rp_comprobvta in 'forms\reportes\rp_comprobvta.pas' {FmRp_CompVta},
  rp_listaprecio in 'forms\reportes\rp_listaprecio.pas' {Fm_INFPrecios},
  afiputils in 'librerias\afiputils.pas',
  rp_utils in 'forms\reportes\rp_utils.pas',
  PrintComprob in 'forms\comprobantes\PrintComprob.pas' {FmPrintComprob},
  rp_codigosbarra in 'forms\reportes\rp_codigosbarra.pas' {Fm_RpCodBarra},
  Vcl.Themes,
  Vcl.Styles,
  eventos_fm in 'forms\archivos\eventos_fm.pas' {FmEventos},
  clientes_fm in 'forms\archivos\clientes_fm.pas' {FmClientes},
  formaspago_fm in 'forms\archivos\formaspago_fm.pas' {FmFormasPago},
  vendedores_fm in 'forms\archivos\vendedores_fm.pas' {FmVendedores},
  usuarios_fm in 'forms\archivos\usuarios_fm.pas' {FmUsuarios},
  ciudades_fm in 'forms\archivos\ciudades_fm.pas' {FmCiudades},
  ComprobVtaEstados_fm in 'forms\sistema\ComprobVtaEstados_fm.pas' {FmCompVtaEstados},
  ComprobvtaAdd_fm in 'forms\comprobantes\ComprobvtaAdd_fm.pas' {FmComprobVta_add},
  ReportesMain in 'forms\reportes\ReportesMain.pas' {FmReportesVta},
  ActPrecios in 'forms\procesos\ActPrecios.pas' {FmActPrecios},
  DashBoard in 'forms\reportes\DashBoard.pas' {FmDashboard},
  comprobvta in 'class\comprobvta.pas',
  eventos in 'class\eventos.pas',
  ciudades in 'class\ciudades.pas',
  clientes in 'class\clientes.pas',
  formaspago in 'class\formaspago.pas',
  usuarios in 'class\usuarios.pas',
  categimpositiva in 'class\categimpositiva.pas',
  rubros in 'class\rubros.pas',
  movimvta in 'class\movimvta.pas',
  ComprobVtaEstados in 'class\ComprobVtaEstados.pas',
  fondos in 'class\fondos.pas',
  itemsvta in 'class\itemsvta.pas',
  articuloBuscar in 'forms\archivos\articuloBuscar.pas' {FmFindaRTICULO},
  Clientebuscar in 'forms\archivos\Clientebuscar.pas' {FmFindCliente},
  ActPreciosExcel in 'forms\procesos\ActPreciosExcel.pas' {FmActPreciosExcel},
  ImportarExcel in 'forms\procesos\ImportarExcel.pas' {FmImportExcel},
  main_tablas in 'forms\archivos\main_tablas.pas' {FmMainTablas},
  comprobvtaImpxTipos in 'class\comprobvtaImpxTipos.pas',
  comprobvtaTipos in 'class\comprobvtaTipos.pas',
  comprobvtaPtosVta in 'class\comprobvtaPtosVta.pas',
  utilsfunc in 'librerias\utilsfunc.pas',
  fondos_fm in 'forms\archivos\fondos_fm.pas' {FmFondos},
  articulosmovim in 'class\articulosmovim.pas',
  ajustes in 'class\ajustes.pas',
  vendedores in 'class\vendedores.pas',
  ComprobVtaImpuestos in 'class\ComprobVtaImpuestos.pas',
  importsdll in 'librerias\importsdll.pas',
  ComprobVtaDefinidos in 'class\ComprobVtaDefinidos.pas',
  rubros_fm in 'forms\archivos\rubros_fm.pas' {FmRubros},
  main_procesos in 'forms\procesos\main_procesos.pas' {FmMainProcesos};

{$R *.res}

begin
  Application.Initialize;
 SplashForm := TSplashForm.Create(nil) ;
  SplashForm.Show;
  SplashForm.Update;
 // Application.MainFormOnTaskbar := True;     //si lo pongo me deja dos botones en la BARRA DE WINDOWS. �?
  TStyleManager.TrySetStyle('Lavender Classico');
  Application.CreateForm(TFmMain, FmMain);
  Application.CreateForm(TFmPrintComprob, FmPrintComprob);
  Application.CreateForm(TFmMainProcesos, FmMainProcesos);
  while SplashForm.ProgressBar1.Position < 100 do
  begin
    SplashForm.ProgressBar1.Position := SplashForm.ProgressBar1.Position+20;
    Sleep(100);
  end;
  SplashForm.Hide;
  SplashForm.Free;

  Application.Run;
 // RunAsAdmin('vallegestion.exe');
end.
