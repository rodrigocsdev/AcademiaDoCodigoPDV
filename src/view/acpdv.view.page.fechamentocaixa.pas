unit acpdv.view.page.fechamentocaixa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls, acpdv.model.caixa, acpdv.model.enum,
  acpdv.view.componente.listatipopgfechamento;

type
  TPageFechamentoCaixa = class(TForm)
    pnlContainer: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    ComboBox1: TComboBox;
    Panel8: TPanel;
    Edit1: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Shape2: TShape;
    Shape3: TShape;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel12: TPanel;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    FProc: TProc<TCaixa>;
    FIndex: Integer;
    FLista: TComponentListaFechamentoCaixa;
    procedure Responsive;
    procedure RemoveIntemLista(Sender: TObject);
  public
    class function New(AOwner: TComponent): TPageFechamentoCaixa;
    function Embed(Value: TWinControl): TPageFechamentoCaixa;
    function Informacoes(Value: TProc<TCaixa>): TPageFechamentoCaixa;
  end;

implementation

{$R *.dfm}
{ TForm1 }

function TPageFechamentoCaixa.Embed(Value: TWinControl): TPageFechamentoCaixa;
begin
  Result := Self;
  Self.Parent := Value;
end;

procedure TPageFechamentoCaixa.FormCreate(Sender: TObject);
var
  i: TTipoPagamento;
begin
  Responsive;
  ComboBox1.Items.Clear;
  for I := Low(TTipoPagamento) to High(TTipoPagamento) do
    ComboBox1.Items.Add(I.ToString);
end;

procedure TPageFechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

procedure TPageFechamentoCaixa.FormResize(Sender: TObject);
begin
  Responsive;
end;

procedure TPageFechamentoCaixa.FormShow(Sender: TObject);
begin
  Responsive;
end;

function TPageFechamentoCaixa.Informacoes(Value: TProc<TCaixa>): TPageFechamentoCaixa;
begin
  Result := Self;
  FProc := Value;
end;

class function TPageFechamentoCaixa.New(AOwner: TComponent): TPageFechamentoCaixa;
begin
  Result := Self.Create(AOwner);
end;

procedure TPageFechamentoCaixa.RemoveIntemLista(Sender: TObject);
begin
  ListBox1.DeleteSelected;
  FLista.DisposeOf;
  Dec(FIndex);
end;

procedure TPageFechamentoCaixa.Responsive;
begin
  pnlContainer.Margins.Left := Round((Self.Width - pnlContainer.Width) / 2);
  pnlContainer.Margins.Right := Round((Self.Width - pnlContainer.Width) / 2);
  pnlContainer.Margins.Top := Round((Self.Height - pnlContainer.Height) / 2);
  pnlContainer.Margins.Bottom := Round((Self.Height - pnlContainer.Height) / 2);
  pnlContainer.Align := alClient;
end;

procedure TPageFechamentoCaixa.SpeedButton1Click(Sender: TObject);
begin
  inc(FIndex);
  FLista := TComponentListaFechamentoCaixa.New(Self)
    .TipoPagamento(ComboBox1.Text)
    .Valor(Edit1.Text)
    .Embed(ListBox1)
    .Nome('Frame' + FIndex.ToString)
    .Click(RemoveIntemLista)
    .Alinhamento(alTop);
end;

procedure TPageFechamentoCaixa.SpeedButton2Click(Sender: TObject);
var
  lCaixa: TCaixa;
  lTurno: TTurno;
  lData: TDateTime;
begin
  lData := Now;
  lCaixa := TCaixa.New;
  try
    lCaixa.Aberto := False;
    lCaixa.DataHoraFechamento := lData;
    FProc(lCaixa);
  finally
    lcaixa.DisposeOf;
    Self.Close;
  end;
end;

procedure TPageFechamentoCaixa.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

end.
