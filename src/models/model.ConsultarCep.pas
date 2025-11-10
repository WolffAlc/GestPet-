unit model.ConsultarCep;

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  REST.Client, REST.Types;

type
  TViaCep = class
  private
    FCEP: string;
    FLogradouro: string;
    FComplemento: string;
    FBairro: string;
    FLocalidade: string;
    FUf: string;
    FIBGE: string;
    FDDD: string;
  public
    function ConsultarCEP(const ACep: string): Boolean;

    property CEP: string read FCEP;
    property Logradouro: string read FLogradouro;
    property Complemento: string read FComplemento;
    property Bairro: string read FBairro;
    property Localidade: string read FLocalidade;
    property Uf: string read FUf;
    property IBGE: string read FIBGE;
    property DDD: string read FDDD;
  end;

implementation

{ TViaCep }

function TViaCep.ConsultarCEP(const ACep: string): Boolean;
var
  RestClient: TRESTClient;
  RestRequest: TRESTRequest;
  RestResponse: TRESTResponse;
  JsonObj: TJSONObject;
begin
  Result := False;
  RestClient := TRESTClient.Create(nil);
  RestRequest := TRESTRequest.Create(nil);
  RestResponse := TRESTResponse.Create(nil);
  try
    RestClient.BaseURL := Format('https://viacep.com.br/ws/%s/json/', [ACep]);
    RestRequest.Client := RestClient;
    RestRequest.Response := RestResponse;
    RestRequest.Method := rmGET;
    RestRequest.Execute;

    if RestResponse.StatusCode = 200 then
    begin
      JsonObj := TJSONObject.ParseJSONValue(RestResponse.Content) as TJSONObject;
      try
        if Assigned(JsonObj) and (not JsonObj.GetValue<Boolean>('erro', False)) then
        begin
          FCEP := JsonObj.GetValue<string>('cep', '');
          FLogradouro := JsonObj.GetValue<string>('logradouro', '');
          FComplemento := JsonObj.GetValue<string>('complemento', '');
          FBairro := JsonObj.GetValue<string>('bairro', '');
          FLocalidade := JsonObj.GetValue<string>('localidade', '');
          FUf := JsonObj.GetValue<string>('uf', '');
          FIBGE := JsonObj.GetValue<string>('ibge', '');
          FDDD := JsonObj.GetValue<string>('ddd', '');
          Result := True;
        end;
      finally
        JsonObj.Free;
      end;
    end;
  finally
    RestClient.Free;
    RestRequest.Free;
    RestResponse.Free;
  end;
end;

end.
