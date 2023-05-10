unit acpdv.model.core.entityoperador;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  System.Classes,
  System.TypInfo,
  System.DateUtils,
  Data.DB,
  acpdv.model.dao.Operador,
  acpdv.model.dao.CAIXA,
  acpdv.model.dao.turno,
  Datasnap.DBClient, acpdv.Model.dao.CAIXA_MOVIMENTO,
  acpdv.Model.Entidade.caixamovimento;

type
  TTipoTurno = (MANHA, TARDE, NOITE);

  TTipoTurnoHelper = record helper for TTipoTurno
    function ToString: String;
    function ToEnum(Value: String): TTipoTurno;
    function ToTurno(Value: TDateTime): TTipoTurno;
  end;

  TEntityOperador = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FLista: TDictionary<String, String>;
    FOperador: String;
    FDataSet: TDataSet;

    FCaixaMovemento: TCaixaMovimento;

    procedure PreecheLista(Value: TDictionary<String, Variant>);
  public
    class function New: TEntityOperador;
    function ValidarOperador(aUsuario, aSenha: String): Boolean;
    function NumeroCaixaTurno(aOperador, aCaixa: String)
      : TDictionary<String, Variant>;
    function VerificaCaixaAberto: Boolean;
    function AbrirCaixa(Value: TDictionary<String, Variant>): TEntityOperador;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TEntityOperador }

function TEntityOperador.AbrirCaixa(
  Value: TDictionary<String, Variant>): TEntityOperador;
var
  lDao: TDAOCaixaMovimento;
begin
  Result := Self;
  lDao:= TDAOCaixaMovimento.New;

  Value['idoperador'];

  FCaixaMovemento :=
    TCaixaMovimento.New
      .SetIdOperador(Value['idoperador'])
      .SetIdCaixa(Value['idcaixa'])
      .SetIdTurno(Value['idturno']);

  lDao.Inserir(FCaixaMovemento);
  PreecheLista(Value);
end;

procedure TEntityOperador.DataModuleCreate(Sender: TObject);
begin
  FLista := TDictionary<String, String>.Create;
end;

procedure TEntityOperador.DataModuleDestroy(Sender: TObject);
begin
  FLista.Free;
end;

class function TEntityOperador.New: TEntityOperador;
begin
  Result := Self.Create(nil);
end;

function TEntityOperador.NumeroCaixaTurno(aOperador, aCaixa: String)
  : TDictionary<String, Variant>;
var
  lDataSetCaixa, lDataSetTurno, lDataSetOperador: TDataSet;
  lTipo: TTipoTurno;
  i: integer;
begin
  Result := TDictionary<String, Variant>.Create;

  lDataSetCaixa := TDAOCaixa.New.FindWhere('nome', UpperCase(aCaixa)).DataSet;
  lDataSetTurno := TDAOTurno.New.FindWhere('nome',
    lTipo.ToTurno(Now).ToString).DataSet;
  lDataSetOperador := TDAOOperador.New.FindWhere('nome',
    UpperCase(aOperador)).DataSet;

  Result.Add('idoperador', lDataSetOperador.FieldByName('id').AsString);
  Result.Add('nomeoperador', lDataSetOperador.FieldByName('nome').AsString);
  Result.Add('senhaoperador', lDataSetOperador.FieldByName('senha').AsString);

  Result.Add('idcaixa', lDataSetCaixa.FieldByName('id').AsString);
  Result.Add('nomecaixa', lDataSetCaixa.FieldByName('nome').AsString);
  Result.Add('idturno', lDataSetTurno.FieldByName('id').AsString);
  Result.Add('nometurno', lDataSetTurno.FieldByName('nome').AsString);
  PreecheLista(Result);
end;

procedure TEntityOperador.PreecheLista(Value: TDictionary<String, VAriant>);
var
  lKey: String;
begin
  for lKey in Value.Keys do
    FLista.Add(lKey, Value[lKey]);
end;

function TEntityOperador.ValidarOperador(aUsuario, aSenha: String): Boolean;
var
  lDataSet: TDataSet;
  lFieldNome, lFieldsenha: TField;
begin
  Result := False;

  FDataSet := TDAOOperador.New.Listar.DataSet;

  lFieldNome := FDataSet.FindField('NOME');
  lFieldsenha := FDataSet.FindField('SENHA');

  if lFieldNome.AsString.Equals(UpperCase(aUsuario)) and
    lFieldsenha.AsString.Equals(aSenha) then
    Result := True;
end;

function TEntityOperador.VerificaCaixaAberto: Boolean;
var
  lDataSet: TDataSet;
  lFechamento, lAbertura: TField;
  lDao: TDAOCaixaMovimento;
begin
  Result := False;
  lDao:= TDAOCaixaMovimento.New;

  lDataSet := lDao.FindWhere('id_caixa', FLista['idcaixa']).DataSet;

  if not lDataSet.IsEmpty then
  begin
    lFechamento := lDataSet.FindField('data_fechamento');
    lAbertura := lDataSet.FindField('data_abertura');

    if (YearOf(lFechamento.AsDateTime) <= 1900) and (YearOf(lAbertura.AsDateTime) > 1900) then
      Result := True;
  end;
end;

{ TTipoTurnoHelper }

function TTipoTurnoHelper.ToEnum(Value: String): TTipoTurno;
begin
  Result := TTipoTurno(GetEnumValue(TypeInfo(TTipoTurno), UpperCase(Value)));
end;

function TTipoTurnoHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTipoTurno), integer(Self));
end;

function TTipoTurnoHelper.ToTurno(Value: TDateTime): TTipoTurno;
begin
  if ((HourOf(Value) >= 6) and (HourOf(Value) <= 11)) then
    Result := MANHA;

  if ((HourOf(Value) >= 12) and (HourOf(Value) <= 17)) then
    Result := TARDE;

  if ((HourOf(Value) >= 18) and (HourOf(Value) <= 23)) then
    Result := NOITE;
end;

end.
