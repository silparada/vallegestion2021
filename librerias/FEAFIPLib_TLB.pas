unit FEAFIPLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 17244 $
// File generated on 5/17/2015 11:30:26 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Website\FEAFIP\FEAFIP.dll (1)
// LIBID: {DAE2CF79-E2C1-40C0-90CD-43C9688F108E}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  FEAFIPLibMajorVersion = 1;
  FEAFIPLibMinorVersion = 1;

  LIBID_FEAFIPLib: TGUID = '{DAE2CF79-E2C1-40C0-90CD-43C9688F108E}';

  IID_Iwsaa: TGUID = '{47BE3547-1C9B-4BCA-9F4E-A65234F2C129}';
  CLASS_wsaa: TGUID = '{33B45EE7-0219-4BE1-A9CA-2B57CA4FD209}';
  IID_Iwsfexv1: TGUID = '{10891378-BAE5-4F40-AF39-70C54F4E8175}';
  CLASS_wsfexv1: TGUID = '{CBC36AD9-1D16-4590-A82C-2ED017AAAB4C}';
  IID_Iwsfev1: TGUID = '{E0A95BBC-E328-4AA6-84E2-405C10AD41A2}';
  CLASS_wsfev1: TGUID = '{6804CFD5-32DD-43AE-A463-CB64FCBE32D2}';
  IID_Iwsbfev1: TGUID = '{A5C9683D-3D72-4392-AD49-A4DFB83D8C63}';
  CLASS_wsbfev1: TGUID = '{2E472E22-AD8A-4071-8C62-D2D9B8CE47D3}';
  IID_Iwsmtxca: TGUID = '{C297BD2B-A528-446B-BF55-FAF195383E0E}';
  CLASS_wsmtxca: TGUID = '{C3DD12A3-EAA2-4F45-8F5D-4A25CBD19838}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TipoComprobante
type
  TipoComprobante = TOleEnum;
const
  tcFacturaA = $00000001;
  tcNotaDebitoA = $00000002;
  tcNotaCreditoA = $00000003;
  tcFacturaB = $00000006;
  tcNotaDebitoB = $00000007;
  tcNotaCreditoB = $00000008;
  tcFacturaC = $0000000B;
  tcNotaDebitoC = $0000000C;
  tcNotaCreditoC = $0000000D;

// Constants for enum UnidadesDeMedida
type
  UnidadesDeMedida = TOleEnum;
const
  const0 = $00000000;
  Const1 = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  Iwsaa = interface;
  IwsaaDisp = dispinterface;
  Iwsfexv1 = interface;
  Iwsfexv1Disp = dispinterface;
  Iwsfev1 = interface;
  Iwsfev1Disp = dispinterface;
  Iwsbfev1 = interface;
  Iwsbfev1Disp = dispinterface;
  Iwsmtxca = interface;
  IwsmtxcaDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  wsaa = Iwsaa;
  wsfexv1 = Iwsfexv1;
  wsfev1 = Iwsfev1;
  wsbfev1 = Iwsbfev1;
  wsmtxca = Iwsmtxca;


// *********************************************************************//
// Interface: Iwsaa
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {47BE3547-1C9B-4BCA-9F4E-A65234F2C129}
// *********************************************************************//
  Iwsaa = interface(IDispatch)
    ['{47BE3547-1C9B-4BCA-9F4E-A65234F2C129}']
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString; const Servicio: WideString): OLE_CANCELBOOL; safecall;
    function Get_Token: WideString; safecall;
    function Get_Sign: WideString; safecall;
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDesc: WideString; safecall;
    function Get_CUIT: WideString; safecall;
    procedure Set_CUIT(const Value: WideString); safecall;
    function Get_XMLRequest: WideString; safecall;
    function Get_XMLResponse: WideString; safecall;
    property Token: WideString read Get_Token;
    property Sign: WideString read Get_Sign;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDesc: WideString read Get_ErrorDesc;
    property CUIT: WideString read Get_CUIT write Set_CUIT;
    property XMLRequest: WideString read Get_XMLRequest;
    property XMLResponse: WideString read Get_XMLResponse;
  end;

// *********************************************************************//
// DispIntf:  IwsaaDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {47BE3547-1C9B-4BCA-9F4E-A65234F2C129}
// *********************************************************************//
  IwsaaDisp = dispinterface
    ['{47BE3547-1C9B-4BCA-9F4E-A65234F2C129}']
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString; const Servicio: WideString): OLE_CANCELBOOL; dispid 101;
    property Token: WideString readonly dispid 104;
    property Sign: WideString readonly dispid 105;
    property ErrorCode: Integer readonly dispid 102;
    property ErrorDesc: WideString readonly dispid 103;
    property CUIT: WideString dispid 206;
    property XMLRequest: WideString readonly dispid 201;
    property XMLResponse: WideString readonly dispid 202;
  end;

// *********************************************************************//
// Interface: Iwsfexv1
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {10891378-BAE5-4F40-AF39-70C54F4E8175}
// *********************************************************************//
  Iwsfexv1 = interface(IDispatch)
    ['{10891378-BAE5-4F40-AF39-70C54F4E8175}']
    procedure AgregaFactura(Id: Double; const Fecha_cbte: WideString; Tipo_cbte: Integer; 
                            Punto_vta: Integer; Cbte_nro: Double; Tipo_expo: Integer; 
                            const Permiso_existente: WideString; Dst_cmp: Integer; 
                            const Cliente: WideString; Cuit_pais_cliente: Double; 
                            const Domicilio_cliente: WideString; const Id_impositivo: WideString; 
                            const Moneda_Id: WideString; Moneda_ctz: Double; 
                            const Obs_comerciales: WideString; Imp_total: Double; 
                            const Obs: WideString; const Forma_pago: WideString; 
                            const Incoterms: WideString; Idioma_cbte: Integer); safecall;
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString): OLE_CANCELBOOL; safecall;
    function Autorizar: OLE_CANCELBOOL; safecall;
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDesc: WideString; safecall;
    function Get_URL: WideString; safecall;
    procedure Set_URL(const Value: WideString); safecall;
    function Get_CUIT: Double; safecall;
    procedure Set_CUIT(Value: Double); safecall;
    function AutorizarRespuesta(out Cae: WideString; out Fch_venc_Cae: WideString; 
                                out Resultado: WideString; out Reproceso: WideString): OLE_CANCELBOOL; safecall;
    function RecuperaLastCMP(PtoVta: Integer; TipoComp: Integer; out Cbte_nro: Double; 
                             out Cbte_fecha: WideString): OLE_CANCELBOOL; safecall;
    procedure AgregaPermiso(const Id_permiso: WideString; Dst_merc: Integer); safecall;
    procedure AgregaCompAsoc(Cbte_tipo: Integer; Cbte_punto_vta: Integer; Cbte_nro: Double; 
                             Cbte_cuit: Double); safecall;
    procedure AgregaItem(const Pro_codigo: WideString; const Pro_ds: WideString; Pro_qty: Double; 
                         Pro_umed: Integer; Pro_precio_uni: Double; Pro_total_item: Double; 
                         Pro_bonificacion: Double); safecall;
    function Get_Token: WideString; safecall;
    procedure Set_Token(const Value: WideString); safecall;
    function Get_Sign: WideString; safecall;
    procedure Set_Sign(const Value: WideString); safecall;
    function Get_XMLRequest: WideString; safecall;
    function Get_XMLResponse: WideString; safecall;
    function SFRecuperaLastCMP(PtoVta: Integer; TipoComp: Integer): OLE_CANCELBOOL; safecall;
    function Get_SFLastCMP: Double; safecall;
    function Get_SFCAE: WideString; safecall;
    function Get_SFVencimiento: WideString; safecall;
    function Get_SFResultado: WideString; safecall;
    function Get_SFReproceso: WideString; safecall;
    function SFCmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double): OLE_CANCELBOOL; safecall;
    function Get_SFCmpConsultarCAE: WideString; safecall;
    function Get_SFCmpConsultarVencimiento: WideString; safecall;
    function UltimoIdTrans(out Resultado: Double): OLE_CANCELBOOL; safecall;
    function AutorizarRespuestaObs: WideString; safecall;
    function CmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                          out Cae: WideString; out Vencimiento: WideString): OLE_CANCELBOOL; safecall;
    function SFUltimoIdTrans: OLE_CANCELBOOL; safecall;
    function Get_SFLastId: Double; safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDesc: WideString read Get_ErrorDesc;
    property URL: WideString read Get_URL write Set_URL;
    property CUIT: Double read Get_CUIT write Set_CUIT;
    property Token: WideString read Get_Token write Set_Token;
    property Sign: WideString read Get_Sign write Set_Sign;
    property XMLRequest: WideString read Get_XMLRequest;
    property XMLResponse: WideString read Get_XMLResponse;
    property SFLastCMP: Double read Get_SFLastCMP;
    property SFCAE: WideString read Get_SFCAE;
    property SFVencimiento: WideString read Get_SFVencimiento;
    property SFResultado: WideString read Get_SFResultado;
    property SFReproceso: WideString read Get_SFReproceso;
    property SFCmpConsultarCAE: WideString read Get_SFCmpConsultarCAE;
    property SFCmpConsultarVencimiento: WideString read Get_SFCmpConsultarVencimiento;
    property SFLastId: Double read Get_SFLastId;
  end;

// *********************************************************************//
// DispIntf:  Iwsfexv1Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {10891378-BAE5-4F40-AF39-70C54F4E8175}
// *********************************************************************//
  Iwsfexv1Disp = dispinterface
    ['{10891378-BAE5-4F40-AF39-70C54F4E8175}']
    procedure AgregaFactura(Id: Double; const Fecha_cbte: WideString; Tipo_cbte: Integer; 
                            Punto_vta: Integer; Cbte_nro: Double; Tipo_expo: Integer; 
                            const Permiso_existente: WideString; Dst_cmp: Integer; 
                            const Cliente: WideString; Cuit_pais_cliente: Double; 
                            const Domicilio_cliente: WideString; const Id_impositivo: WideString; 
                            const Moneda_Id: WideString; Moneda_ctz: Double; 
                            const Obs_comerciales: WideString; Imp_total: Double; 
                            const Obs: WideString; const Forma_pago: WideString; 
                            const Incoterms: WideString; Idioma_cbte: Integer); dispid 101;
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString): OLE_CANCELBOOL; dispid 102;
    function Autorizar: OLE_CANCELBOOL; dispid 103;
    property ErrorCode: Integer readonly dispid 104;
    property ErrorDesc: WideString readonly dispid 105;
    property URL: WideString dispid 107;
    property CUIT: Double dispid 108;
    function AutorizarRespuesta(out Cae: WideString; out Fch_venc_Cae: WideString; 
                                out Resultado: WideString; out Reproceso: WideString): OLE_CANCELBOOL; dispid 110;
    function RecuperaLastCMP(PtoVta: Integer; TipoComp: Integer; out Cbte_nro: Double; 
                             out Cbte_fecha: WideString): OLE_CANCELBOOL; dispid 111;
    procedure AgregaPermiso(const Id_permiso: WideString; Dst_merc: Integer); dispid 112;
    procedure AgregaCompAsoc(Cbte_tipo: Integer; Cbte_punto_vta: Integer; Cbte_nro: Double; 
                             Cbte_cuit: Double); dispid 113;
    procedure AgregaItem(const Pro_codigo: WideString; const Pro_ds: WideString; Pro_qty: Double; 
                         Pro_umed: Integer; Pro_precio_uni: Double; Pro_total_item: Double; 
                         Pro_bonificacion: Double); dispid 114;
    property Token: WideString dispid 201;
    property Sign: WideString dispid 202;
    property XMLRequest: WideString readonly dispid 203;
    property XMLResponse: WideString readonly dispid 204;
    function SFRecuperaLastCMP(PtoVta: Integer; TipoComp: Integer): OLE_CANCELBOOL; dispid 219;
    property SFLastCMP: Double readonly dispid 220;
    property SFCAE: WideString readonly dispid 216;
    property SFVencimiento: WideString readonly dispid 217;
    property SFResultado: WideString readonly dispid 218;
    property SFReproceso: WideString readonly dispid 224;
    function SFCmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double): OLE_CANCELBOOL; dispid 221;
    property SFCmpConsultarCAE: WideString readonly dispid 222;
    property SFCmpConsultarVencimiento: WideString readonly dispid 225;
    function UltimoIdTrans(out Resultado: Double): OLE_CANCELBOOL; dispid 115;
    function AutorizarRespuestaObs: WideString; dispid 205;
    function CmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                          out Cae: WideString; out Vencimiento: WideString): OLE_CANCELBOOL; dispid 228;
    function SFUltimoIdTrans: OLE_CANCELBOOL; dispid 230;
    property SFLastId: Double readonly dispid 229;
  end;

// *********************************************************************//
// Interface: Iwsfev1
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E0A95BBC-E328-4AA6-84E2-405C10AD41A2}
// *********************************************************************//
  Iwsfev1 = interface(IDispatch)
    ['{E0A95BBC-E328-4AA6-84E2-405C10AD41A2}']
    procedure AgregaFactura(Concepto: Integer; DocTipo: Integer; DocNro: Double; Cbtedesde: Double; 
                            Cbtehasta: Double; const CbteFch: WideString; Imptotal: Double; 
                            ImpTotalConc: Double; ImpNeto: Double; ImpOpEx: Double; 
                            const FechaServDesde: WideString; const FechaServHasta: WideString; 
                            const FechaVencPago: WideString; const MonId: WideString; 
                            MonCotiz: Double); safecall;
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString): OLE_CANCELBOOL; safecall;
    function Autorizar(ptoVenta: Integer; CbteTipo: TipoComprobante): OLE_CANCELBOOL; safecall;
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDesc: WideString; safecall;
    procedure Reset; safecall;
    function Get_URL: WideString; safecall;
    procedure Set_URL(const Value: WideString); safecall;
    function Get_CUIT: Double; safecall;
    procedure Set_CUIT(Value: Double); safecall;
    function Get_AutorizarRespCount: Integer; safecall;
    function AutorizarRespuesta(Indice: Integer; out Cae: WideString; out Vencimiento: WideString; 
                                out Resultado: WideString; out Reproceso: WideString): OLE_CANCELBOOL; safecall;
    function RecuperaLastCMP(PtoVta: Integer; TipoComp: Integer; out cmp: Double): OLE_CANCELBOOL; safecall;
    function RecuperaQTYRequest(qty: Integer): OLE_CANCELBOOL; safecall;
    function CmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                          out Cae: WideString; out Vencimiento: WideString): OLE_CANCELBOOL; safecall;
    function Dummy(out appserver: WideString; out authserver: WideString; out dbserver: WideString): OLE_CANCELBOOL; safecall;
    function CAEASolicitar(Periodo: Integer; Orden: Integer; out Cae: WideString; 
                           out FchVigDesde: WideString; out FchVigHasta: WideString; 
                           out FchTopeInf: WideString; out FchProceso: WideString): OLE_CANCELBOOL; safecall;
    function AutorizarRespuestaObs(Indice: Integer): WideString; safecall;
    function CAEAConsultar(Periodo: Integer; Orden: Integer; out Cae: WideString; 
                           out FchVigDesde: WideString; out FchVigHasta: WideString; 
                           out FchTopeInf: WideString; out FchProceso: WideString): OLE_CANCELBOOL; safecall;
    function CAEASinMovimientoInformar(PtoVta: Integer; const CAEA: WideString; 
                                       out Resultado: WideString): OLE_CANCELBOOL; safecall;
    function CAEASinMovimientoConsultar(PtoVta: Integer; const CAEA: WideString; 
                                        out Resultado: WideString): OLE_CANCELBOOL; safecall;
    function ParamGetCotizacion(const MonId: WideString; out MonCotiz: Double; 
                                out FchCotiz: WideString): OLE_CANCELBOOL; safecall;
    function ParamGetTiposConcepto(out Resultado: WideString): OLE_CANCELBOOL; safecall;
    procedure AgregaTributo(Id: Integer; const Desc: WideString; BaseImp: Double; Alic: Double; 
                            Importe: Double); safecall;
    procedure AgregaIVA(Id: Integer; BaseImp: Double; Importe: Double); safecall;
    procedure AgregaCompAsoc(Tipo: Integer; PtoVta: Integer; Nro: Double); safecall;
    procedure AgregaOpcional(const Id: WideString; const Valor: WideString); safecall;
    function ParamGetTiposMonedas(out Resultado: WideString): OLE_CANCELBOOL; safecall;
    function Get_XMLRequest: WideString; safecall;
    function Get_XMLResponse: WideString; safecall;
    function Get_Token: WideString; safecall;
    procedure Set_Token(const Value: WideString); safecall;
    function Get_Sign: WideString; safecall;
    procedure Set_Sign(const Value: WideString); safecall;
    function SFRecuperaLastCMP(PtoVta: Integer; TipoComp: Integer): OLE_CANCELBOOL; safecall;
    function Get_SFLastCMP: Double; safecall;
    function Get_SFCAE(Indice: Integer): WideString; safecall;
    function Get_SFVencimiento(Indice: Integer): WideString; safecall;
    function Get_SFResultado(Indice: Integer): WideString; safecall;
    function SFCmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double): OLE_CANCELBOOL; safecall;
    function Get_SFCmpConsultarCAE: WideString; safecall;
    function Get_SFCmpConsultarVencimiento: WideString; safecall;
    function CAEAInformar(ptoVenta: Integer; CbteTipo: Integer; const Cae: WideString): OLE_CANCELBOOL; safecall;
    function AutorizarRespuestaObsCode(Indice: Integer): WideString; safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDesc: WideString read Get_ErrorDesc;
    property URL: WideString read Get_URL write Set_URL;
    property CUIT: Double read Get_CUIT write Set_CUIT;
    property AutorizarRespCount: Integer read Get_AutorizarRespCount;
    property XMLRequest: WideString read Get_XMLRequest;
    property XMLResponse: WideString read Get_XMLResponse;
    property Token: WideString read Get_Token write Set_Token;
    property Sign: WideString read Get_Sign write Set_Sign;
    property SFLastCMP: Double read Get_SFLastCMP;
    property SFCAE[Indice: Integer]: WideString read Get_SFCAE;
    property SFVencimiento[Indice: Integer]: WideString read Get_SFVencimiento;
    property SFResultado[Indice: Integer]: WideString read Get_SFResultado;
    property SFCmpConsultarCAE: WideString read Get_SFCmpConsultarCAE;
    property SFCmpConsultarVencimiento: WideString read Get_SFCmpConsultarVencimiento;
  end;

// *********************************************************************//
// DispIntf:  Iwsfev1Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E0A95BBC-E328-4AA6-84E2-405C10AD41A2}
// *********************************************************************//
  Iwsfev1Disp = dispinterface
    ['{E0A95BBC-E328-4AA6-84E2-405C10AD41A2}']
    procedure AgregaFactura(Concepto: Integer; DocTipo: Integer; DocNro: Double; Cbtedesde: Double; 
                            Cbtehasta: Double; const CbteFch: WideString; Imptotal: Double; 
                            ImpTotalConc: Double; ImpNeto: Double; ImpOpEx: Double; 
                            const FechaServDesde: WideString; const FechaServHasta: WideString; 
                            const FechaVencPago: WideString; const MonId: WideString; 
                            MonCotiz: Double); dispid 201;
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString): OLE_CANCELBOOL; dispid 202;
    function Autorizar(ptoVenta: Integer; CbteTipo: TipoComprobante): OLE_CANCELBOOL; dispid 203;
    property ErrorCode: Integer readonly dispid 204;
    property ErrorDesc: WideString readonly dispid 205;
    procedure Reset; dispid 206;
    property URL: WideString dispid 207;
    property CUIT: Double dispid 208;
    property AutorizarRespCount: Integer readonly dispid 209;
    function AutorizarRespuesta(Indice: Integer; out Cae: WideString; out Vencimiento: WideString; 
                                out Resultado: WideString; out Reproceso: WideString): OLE_CANCELBOOL; dispid 210;
    function RecuperaLastCMP(PtoVta: Integer; TipoComp: Integer; out cmp: Double): OLE_CANCELBOOL; dispid 211;
    function RecuperaQTYRequest(qty: Integer): OLE_CANCELBOOL; dispid 212;
    function CmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                          out Cae: WideString; out Vencimiento: WideString): OLE_CANCELBOOL; dispid 213;
    function Dummy(out appserver: WideString; out authserver: WideString; out dbserver: WideString): OLE_CANCELBOOL; dispid 214;
    function CAEASolicitar(Periodo: Integer; Orden: Integer; out Cae: WideString; 
                           out FchVigDesde: WideString; out FchVigHasta: WideString; 
                           out FchTopeInf: WideString; out FchProceso: WideString): OLE_CANCELBOOL; dispid 215;
    function AutorizarRespuestaObs(Indice: Integer): WideString; dispid 216;
    function CAEAConsultar(Periodo: Integer; Orden: Integer; out Cae: WideString; 
                           out FchVigDesde: WideString; out FchVigHasta: WideString; 
                           out FchTopeInf: WideString; out FchProceso: WideString): OLE_CANCELBOOL; dispid 217;
    function CAEASinMovimientoInformar(PtoVta: Integer; const CAEA: WideString; 
                                       out Resultado: WideString): OLE_CANCELBOOL; dispid 218;
    function CAEASinMovimientoConsultar(PtoVta: Integer; const CAEA: WideString; 
                                        out Resultado: WideString): OLE_CANCELBOOL; dispid 219;
    function ParamGetCotizacion(const MonId: WideString; out MonCotiz: Double; 
                                out FchCotiz: WideString): OLE_CANCELBOOL; dispid 220;
    function ParamGetTiposConcepto(out Resultado: WideString): OLE_CANCELBOOL; dispid 221;
    procedure AgregaTributo(Id: Integer; const Desc: WideString; BaseImp: Double; Alic: Double; 
                            Importe: Double); dispid 222;
    procedure AgregaIVA(Id: Integer; BaseImp: Double; Importe: Double); dispid 223;
    procedure AgregaCompAsoc(Tipo: Integer; PtoVta: Integer; Nro: Double); dispid 224;
    procedure AgregaOpcional(const Id: WideString; const Valor: WideString); dispid 225;
    function ParamGetTiposMonedas(out Resultado: WideString): OLE_CANCELBOOL; dispid 226;
    property XMLRequest: WideString readonly dispid 227;
    property XMLResponse: WideString readonly dispid 228;
    property Token: WideString dispid 229;
    property Sign: WideString dispid 230;
    function SFRecuperaLastCMP(PtoVta: Integer; TipoComp: Integer): OLE_CANCELBOOL; dispid 231;
    property SFLastCMP: Double readonly dispid 232;
    property SFCAE[Indice: Integer]: WideString readonly dispid 233;
    property SFVencimiento[Indice: Integer]: WideString readonly dispid 234;
    property SFResultado[Indice: Integer]: WideString readonly dispid 235;
    function SFCmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double): OLE_CANCELBOOL; dispid 236;
    property SFCmpConsultarCAE: WideString readonly dispid 237;
    property SFCmpConsultarVencimiento: WideString readonly dispid 238;
    function CAEAInformar(ptoVenta: Integer; CbteTipo: Integer; const Cae: WideString): OLE_CANCELBOOL; dispid 239;
    function AutorizarRespuestaObsCode(Indice: Integer): WideString; dispid 240;
  end;

// *********************************************************************//
// Interface: Iwsbfev1
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A5C9683D-3D72-4392-AD49-A4DFB83D8C63}
// *********************************************************************//
  Iwsbfev1 = interface(IDispatch)
    ['{A5C9683D-3D72-4392-AD49-A4DFB83D8C63}']
    procedure AgregaFactura(Id: Double; tipo_doc: Integer; nro_doc: Double; Zona: Integer; 
                            Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                            Imp_total: Double; imp_tot_conc: Double; imp_neto: Double; 
                            impto_liq: Double; impto_liq_rni: Double; imp_op_ex: Double; 
                            Imp_perc: Double; Imp_iibb: Double; Imp_perc_mun: Double; 
                            Imp_internos: Double; const Imp_moneda_Id: WideString; 
                            Imp_moneda_ctz: Double; const Fecha_cbte: WideString); safecall;
    procedure AgregaOpcional(const Id: WideString; const Valor: WideString); safecall;
    procedure AgregaItem(const Pro_codigo_ncm: WideString; const Pro_codigo_sec: WideString; 
                         const Pro_ds: WideString; Pro_qty: Double; Pro_umed: Integer; 
                         Pro_precio_uni: Double; Imp_bonif: Double; Imp_total: Double; 
                         Iva_id: Integer); safecall;
    function Autorizar: OLE_CANCELBOOL; safecall;
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString): OLE_CANCELBOOL; safecall;
    function Get_CUIT: Double; safecall;
    procedure Set_CUIT(Value: Double); safecall;
    function Get_URL: WideString; safecall;
    procedure Set_URL(const Value: WideString); safecall;
    function Get_Token: WideString; safecall;
    procedure Set_Token(const Value: WideString); safecall;
    function Get_Sign: WideString; safecall;
    procedure Set_Sign(const Value: WideString); safecall;
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDesc: WideString; safecall;
    procedure Reset; safecall;
    function RecuperaLastCMP(Pto_venta: Integer; Tipo_cbte: Integer; out Cbte_nro: Double; 
                             out Cbte_fecha: WideString): OLE_CANCELBOOL; safecall;
    function SFRecuperaLastCMP(Pto_venta: Integer; Tipo_cbte: Integer): OLE_CANCELBOOL; safecall;
    function Get_SFLastCMP: Double; safecall;
    function Get_SFLastFecha: WideString; safecall;
    function RecuperaLastID(out Id: Double): OLE_CANCELBOOL; safecall;
    function SFRecuperaLastID: OLE_CANCELBOOL; safecall;
    function Get_SFLastId: Double; safecall;
    function AutorizarRespuesta(out Cae: WideString; out Vencimiento: WideString; 
                                out Resultado: WideString; out Reproceso: WideString): OLE_CANCELBOOL; safecall;
    function Get_SFCAE: WideString; safecall;
    function Get_SFVencimiento: WideString; safecall;
    function Get_SFResultado: WideString; safecall;
    function Get_SFReproceso: WideString; safecall;
    function AutorizarRespuestaObs: WideString; safecall;
    function CmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                          out Cae: WideString; out Vencimiento: WideString): OLE_CANCELBOOL; safecall;
    function SFCmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; Cbte_nro: Double): OLE_CANCELBOOL; safecall;
    function Get_SFCmpConsultarCAE: WideString; safecall;
    function Get_SFCmpConsultarVencimiento: WideString; safecall;
    function Get_XMLRequest: WideString; safecall;
    function Get_XMLResponse: WideString; safecall;
    property CUIT: Double read Get_CUIT write Set_CUIT;
    property URL: WideString read Get_URL write Set_URL;
    property Token: WideString read Get_Token write Set_Token;
    property Sign: WideString read Get_Sign write Set_Sign;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDesc: WideString read Get_ErrorDesc;
    property SFLastCMP: Double read Get_SFLastCMP;
    property SFLastFecha: WideString read Get_SFLastFecha;
    property SFLastId: Double read Get_SFLastId;
    property SFCAE: WideString read Get_SFCAE;
    property SFVencimiento: WideString read Get_SFVencimiento;
    property SFResultado: WideString read Get_SFResultado;
    property SFReproceso: WideString read Get_SFReproceso;
    property SFCmpConsultarCAE: WideString read Get_SFCmpConsultarCAE;
    property SFCmpConsultarVencimiento: WideString read Get_SFCmpConsultarVencimiento;
    property XMLRequest: WideString read Get_XMLRequest;
    property XMLResponse: WideString read Get_XMLResponse;
  end;

// *********************************************************************//
// DispIntf:  Iwsbfev1Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A5C9683D-3D72-4392-AD49-A4DFB83D8C63}
// *********************************************************************//
  Iwsbfev1Disp = dispinterface
    ['{A5C9683D-3D72-4392-AD49-A4DFB83D8C63}']
    procedure AgregaFactura(Id: Double; tipo_doc: Integer; nro_doc: Double; Zona: Integer; 
                            Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                            Imp_total: Double; imp_tot_conc: Double; imp_neto: Double; 
                            impto_liq: Double; impto_liq_rni: Double; imp_op_ex: Double; 
                            Imp_perc: Double; Imp_iibb: Double; Imp_perc_mun: Double; 
                            Imp_internos: Double; const Imp_moneda_Id: WideString; 
                            Imp_moneda_ctz: Double; const Fecha_cbte: WideString); dispid 201;
    procedure AgregaOpcional(const Id: WideString; const Valor: WideString); dispid 202;
    procedure AgregaItem(const Pro_codigo_ncm: WideString; const Pro_codigo_sec: WideString; 
                         const Pro_ds: WideString; Pro_qty: Double; Pro_umed: Integer; 
                         Pro_precio_uni: Double; Imp_bonif: Double; Imp_total: Double; 
                         Iva_id: Integer); dispid 203;
    function Autorizar: OLE_CANCELBOOL; dispid 204;
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString): OLE_CANCELBOOL; dispid 205;
    property CUIT: Double dispid 206;
    property URL: WideString dispid 207;
    property Token: WideString dispid 208;
    property Sign: WideString dispid 209;
    property ErrorCode: Integer readonly dispid 210;
    property ErrorDesc: WideString readonly dispid 211;
    procedure Reset; dispid 212;
    function RecuperaLastCMP(Pto_venta: Integer; Tipo_cbte: Integer; out Cbte_nro: Double; 
                             out Cbte_fecha: WideString): OLE_CANCELBOOL; dispid 213;
    function SFRecuperaLastCMP(Pto_venta: Integer; Tipo_cbte: Integer): OLE_CANCELBOOL; dispid 214;
    property SFLastCMP: Double readonly dispid 215;
    property SFLastFecha: WideString readonly dispid 216;
    function RecuperaLastID(out Id: Double): OLE_CANCELBOOL; dispid 217;
    function SFRecuperaLastID: OLE_CANCELBOOL; dispid 219;
    property SFLastId: Double readonly dispid 218;
    function AutorizarRespuesta(out Cae: WideString; out Vencimiento: WideString; 
                                out Resultado: WideString; out Reproceso: WideString): OLE_CANCELBOOL; dispid 220;
    property SFCAE: WideString readonly dispid 222;
    property SFVencimiento: WideString readonly dispid 223;
    property SFResultado: WideString readonly dispid 224;
    property SFReproceso: WideString readonly dispid 225;
    function AutorizarRespuestaObs: WideString; dispid 226;
    function CmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                          out Cae: WideString; out Vencimiento: WideString): OLE_CANCELBOOL; dispid 227;
    function SFCmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; Cbte_nro: Double): OLE_CANCELBOOL; dispid 228;
    property SFCmpConsultarCAE: WideString readonly dispid 229;
    property SFCmpConsultarVencimiento: WideString readonly dispid 230;
    property XMLRequest: WideString readonly dispid 231;
    property XMLResponse: WideString readonly dispid 232;
  end;

// *********************************************************************//
// Interface: Iwsmtxca
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C297BD2B-A528-446B-BF55-FAF195383E0E}
// *********************************************************************//
  Iwsmtxca = interface(IDispatch)
    ['{C297BD2B-A528-446B-BF55-FAF195383E0E}']
    procedure AgregaFactura(codigoTipoComprobante: Integer; numeroPuntoVenta: Integer; 
                            numeroComprobante: Double; const fechaEmision: WideString; 
                            codigoTipoDocumento: Integer; numeroDocumento: Double; 
                            importeGravado: Double; importeNoGravado: Double; 
                            importeExento: Double; importeSubtotal: Double; 
                            importeOtrosTributos: Double; importeTotal: Double; 
                            const codigoMoneda: WideString; cotizacionMoneda: Double; 
                            const observaciones: WideString; codigoConcepto: Integer; 
                            const fechaServicioDesde: WideString; 
                            const fechaServicioHasta: WideString; 
                            const fechaVencimientoPago: WideString); safecall;
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString): OLE_CANCELBOOL; safecall;
    procedure AgregaTributo(Id: Integer; const Desc: WideString; BaseImp: Double; Importe: Double); safecall;
    procedure AgregaIVA(codigo: Integer; Importe: Double); safecall;
    procedure AgregaCompAsoc(Tipo: Integer; PtoVta: Integer; Nro: Double); safecall;
    procedure AgregaItem(unidadesMtx: Integer; const codigoMtx: WideString; 
                         const codigo: WideString; const descripcion: WideString; cantidad: Double; 
                         codigoUnidadMedida: Integer; precioUnitario: Double; 
                         importeBonificacion: Double; codigoCondicionIVA: Integer; 
                         importeIVA: Double; importeItem: Double); safecall;
    function Autorizar: OLE_CANCELBOOL; safecall;
    function AutorizarRespuesta(out Cae: WideString; out Vencimiento: WideString; 
                                out Resultado: WideString): OLE_CANCELBOOL; safecall;
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDesc: WideString; safecall;
    function Get_URL: WideString; safecall;
    procedure Set_URL(const Value: WideString); safecall;
    function Get_CUIT: Double; safecall;
    procedure Set_CUIT(Value: Double); safecall;
    function RecuperaLastCMP(PtoVta: Integer; TipoComp: Integer; out cmp: Double): OLE_CANCELBOOL; safecall;
    function AutorizarRespuestaObs: WideString; safecall;
    function Get_Token: WideString; safecall;
    procedure Set_Token(const Value: WideString); safecall;
    function Get_Sign: WideString; safecall;
    procedure Set_Sign(const Value: WideString); safecall;
    function SFCmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double): OLE_CANCELBOOL; safecall;
    function Get_SFCmpConsultarCAE: WideString; safecall;
    function Get_SFCmpConsultarVencimiento: WideString; safecall;
    function SFRecuperaLastCMP(PtoVta: Integer; TipoComp: Integer): OLE_CANCELBOOL; safecall;
    function Get_SFLastCMP: Double; safecall;
    function Get_SFCAE: WideString; safecall;
    function Get_SFVencimiento: WideString; safecall;
    function Get_SFResultado: WideString; safecall;
    function CmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                          out Cae: WideString; out Vencimiento: WideString): OLE_CANCELBOOL; safecall;
    function Get_XMLRequest: WideString; safecall;
    function Get_XMLResponse: WideString; safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDesc: WideString read Get_ErrorDesc;
    property URL: WideString read Get_URL write Set_URL;
    property CUIT: Double read Get_CUIT write Set_CUIT;
    property Token: WideString read Get_Token write Set_Token;
    property Sign: WideString read Get_Sign write Set_Sign;
    property SFCmpConsultarCAE: WideString read Get_SFCmpConsultarCAE;
    property SFCmpConsultarVencimiento: WideString read Get_SFCmpConsultarVencimiento;
    property SFLastCMP: Double read Get_SFLastCMP;
    property SFCAE: WideString read Get_SFCAE;
    property SFVencimiento: WideString read Get_SFVencimiento;
    property SFResultado: WideString read Get_SFResultado;
    property XMLRequest: WideString read Get_XMLRequest;
    property XMLResponse: WideString read Get_XMLResponse;
  end;

// *********************************************************************//
// DispIntf:  IwsmtxcaDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C297BD2B-A528-446B-BF55-FAF195383E0E}
// *********************************************************************//
  IwsmtxcaDisp = dispinterface
    ['{C297BD2B-A528-446B-BF55-FAF195383E0E}']
    procedure AgregaFactura(codigoTipoComprobante: Integer; numeroPuntoVenta: Integer; 
                            numeroComprobante: Double; const fechaEmision: WideString; 
                            codigoTipoDocumento: Integer; numeroDocumento: Double; 
                            importeGravado: Double; importeNoGravado: Double; 
                            importeExento: Double; importeSubtotal: Double; 
                            importeOtrosTributos: Double; importeTotal: Double; 
                            const codigoMoneda: WideString; cotizacionMoneda: Double; 
                            const observaciones: WideString; codigoConcepto: Integer; 
                            const fechaServicioDesde: WideString; 
                            const fechaServicioHasta: WideString; 
                            const fechaVencimientoPago: WideString); dispid 101;
    function login(const Certificado: WideString; const ClavePrivada: WideString; 
                   const URL: WideString): OLE_CANCELBOOL; dispid 102;
    procedure AgregaTributo(Id: Integer; const Desc: WideString; BaseImp: Double; Importe: Double); dispid 208;
    procedure AgregaIVA(codigo: Integer; Importe: Double); dispid 209;
    procedure AgregaCompAsoc(Tipo: Integer; PtoVta: Integer; Nro: Double); dispid 210;
    procedure AgregaItem(unidadesMtx: Integer; const codigoMtx: WideString; 
                         const codigo: WideString; const descripcion: WideString; cantidad: Double; 
                         codigoUnidadMedida: Integer; precioUnitario: Double; 
                         importeBonificacion: Double; codigoCondicionIVA: Integer; 
                         importeIVA: Double; importeItem: Double); dispid 201;
    function Autorizar: OLE_CANCELBOOL; dispid 103;
    function AutorizarRespuesta(out Cae: WideString; out Vencimiento: WideString; 
                                out Resultado: WideString): OLE_CANCELBOOL; dispid 110;
    property ErrorCode: Integer readonly dispid 104;
    property ErrorDesc: WideString readonly dispid 105;
    property URL: WideString dispid 107;
    property CUIT: Double dispid 108;
    function RecuperaLastCMP(PtoVta: Integer; TipoComp: Integer; out cmp: Double): OLE_CANCELBOOL; dispid 112;
    function AutorizarRespuestaObs: WideString; dispid 202;
    property Token: WideString dispid 203;
    property Sign: WideString dispid 204;
    function SFCmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double): OLE_CANCELBOOL; dispid 218;
    property SFCmpConsultarCAE: WideString readonly dispid 219;
    property SFCmpConsultarVencimiento: WideString readonly dispid 220;
    function SFRecuperaLastCMP(PtoVta: Integer; TipoComp: Integer): OLE_CANCELBOOL; dispid 221;
    property SFLastCMP: Double readonly dispid 222;
    property SFCAE: WideString readonly dispid 223;
    property SFVencimiento: WideString readonly dispid 224;
    property SFResultado: WideString readonly dispid 225;
    function CmpConsultar(Tipo_cbte: Integer; Punto_vta: Integer; cbt_nro: Double; 
                          out Cae: WideString; out Vencimiento: WideString): OLE_CANCELBOOL; dispid 228;
    property XMLRequest: WideString readonly dispid 229;
    property XMLResponse: WideString readonly dispid 230;
  end;

// *********************************************************************//
// The Class Cowsaa provides a Create and CreateRemote method to          
// create instances of the default interface Iwsaa exposed by              
// the CoClass wsaa. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Cowsaa = class
    class function Create: Iwsaa;
    class function CreateRemote(const MachineName: string): Iwsaa;
  end;

// *********************************************************************//
// The Class Cowsfexv1 provides a Create and CreateRemote method to          
// create instances of the default interface Iwsfexv1 exposed by              
// the CoClass wsfexv1. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Cowsfexv1 = class
    class function Create: Iwsfexv1;
    class function CreateRemote(const MachineName: string): Iwsfexv1;
  end;

// *********************************************************************//
// The Class Cowsfev1 provides a Create and CreateRemote method to          
// create instances of the default interface Iwsfev1 exposed by              
// the CoClass wsfev1. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Cowsfev1 = class
    class function Create: Iwsfev1;
    class function CreateRemote(const MachineName: string): Iwsfev1;
  end;

// *********************************************************************//
// The Class Cowsbfev1 provides a Create and CreateRemote method to          
// create instances of the default interface Iwsbfev1 exposed by              
// the CoClass wsbfev1. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Cowsbfev1 = class
    class function Create: Iwsbfev1;
    class function CreateRemote(const MachineName: string): Iwsbfev1;
  end;

// *********************************************************************//
// The Class Cowsmtxca provides a Create and CreateRemote method to          
// create instances of the default interface Iwsmtxca exposed by              
// the CoClass wsmtxca. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  Cowsmtxca = class
    class function Create: Iwsmtxca;
    class function CreateRemote(const MachineName: string): Iwsmtxca;
  end;

implementation

uses ComObj;

class function Cowsaa.Create: Iwsaa;
begin
  Result := CreateComObject(CLASS_wsaa) as Iwsaa;
end;

class function Cowsaa.CreateRemote(const MachineName: string): Iwsaa;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_wsaa) as Iwsaa;
end;

class function Cowsfexv1.Create: Iwsfexv1;
begin
  Result := CreateComObject(CLASS_wsfexv1) as Iwsfexv1;
end;

class function Cowsfexv1.CreateRemote(const MachineName: string): Iwsfexv1;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_wsfexv1) as Iwsfexv1;
end;

class function Cowsfev1.Create: Iwsfev1;
begin
  Result := CreateComObject(CLASS_wsfev1) as Iwsfev1;
end;

class function Cowsfev1.CreateRemote(const MachineName: string): Iwsfev1;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_wsfev1) as Iwsfev1;
end;

class function Cowsbfev1.Create: Iwsbfev1;
begin
  Result := CreateComObject(CLASS_wsbfev1) as Iwsbfev1;
end;

class function Cowsbfev1.CreateRemote(const MachineName: string): Iwsbfev1;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_wsbfev1) as Iwsbfev1;
end;

class function Cowsmtxca.Create: Iwsmtxca;
begin
  Result := CreateComObject(CLASS_wsmtxca) as Iwsmtxca;
end;

class function Cowsmtxca.CreateRemote(const MachineName: string): Iwsmtxca;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_wsmtxca) as Iwsmtxca;
end;

end.
