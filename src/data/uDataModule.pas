unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDm1 = class(TDataModule)
    conexaoBanco: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    tbCliente: TFDTable;
    tbClienteCODCLIENTE: TIntegerField;
    tbClienteNOME: TStringField;
    tbClienteCPFCNPJ: TStringField;
    tbClienteRG: TStringField;
    tbClienteTIPOPESSOA: TStringField;
    tbClienteEMAIL: TStringField;
    tbClienteDTNASCIMENTO: TDateField;
    tbClienteDTCADASTRO: TDateField;
    tbClienteTELEFONE1: TStringField;
    tbClienteTELEFONE2: TStringField;
    tbClienteCEP: TStringField;
    tbClienteESTADO: TStringField;
    tbClienteCIDADE: TStringField;
    tbClienteBAIRRO: TStringField;
    tbClienteENDERECO: TStringField;
    tbClienteNUMENDERECO: TStringField;
    tbClienteCOMPLEMENTO: TStringField;
    tbClienteOBSERVACOES: TStringField;
    tbClienteFOTO: TBlobField;
    tbClienteWHATSAPP: TStringField;
    dsCliente: TDataSource;
    procedure tbClienteAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm1: TDm1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDm1.tbClienteAfterInsert(DataSet: TDataSet);
begin
   dm1.tbClienteDTCADASTRO.Value := Now();
end;

end.
