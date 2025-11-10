program GestPetPlus;

uses
  Vcl.Forms,
  form.telaPrincipal in 'src\forms\form.telaPrincipal.pas' {formPrincipal},
  form.cadCliente in 'src\forms\form.cadCliente.pas' {cadCliente},
  form.cadPet in 'src\forms\form.cadPet.pas' {cadPet},
  uDataModule in 'src\data\uDataModule.pas' {Dm1: TDataModule},
  model.ConsultarCep in 'src\models\model.ConsultarCep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TcadCliente, cadCliente);
  Application.CreateForm(TcadPet, cadPet);
  Application.CreateForm(TDm1, Dm1);
  Application.Run;
end.
