program ACPDV;

{$R *.dres}

uses
  Vcl.Forms,
  acpdv.view.principal in 'src\view\acpdv.view.principal.pas' {pageprincipal},
  acpdv.view.page.login in 'src\view\acpdv.view.page.login.pas' {PageLogin},
  acpdv.view.componente.Transparencia in 'src\view\componente\acpdv.view.componente.Transparencia.pas' {FundoTransparente},
  acpdv.view.page.pix in 'src\view\acpdv.view.page.pix.pas' {FramePix: TFrame},
  acpdv.view.page.dinheiro in 'src\view\acpdv.view.page.dinheiro.pas' {FrameDinheiro: TFrame},
  acpdv.view.page.cartao in 'src\view\acpdv.view.page.cartao.pas' {FrameCartao: TFrame},
  acpdv.view.page.identificarcliente in 'src\view\acpdv.view.page.identificarcliente.pas' {PageIdentificarCliente},
  acpdv.view.page.importarcliente in 'src\view\acpdv.view.page.importarcliente.pas' {PageImportarCliente},
  acpdv.view.page.fechamentocaixa in 'src\view\acpdv.view.page.fechamentocaixa.pas' {PageFechamentoCaixa},
  acpdv.view.abrircaixa in 'src\view\acpdv.view.abrircaixa.pas' {PageAbrirCaixa},
  acpdv.model.enum in 'src\model\acpdv.model.enum.pas',
  acpdv.utils in 'src\utils\acpdv.utils.pas',
  acpdv.utils.keyevent in 'src\utils\acpdv.utils.keyevent.pas',
  acpdv.utils.forms.interfaces in 'src\utils\acpdv.utils.forms.interfaces.pas',
  acpdv.utils.forms.impl.resourcesimages in 'src\utils\impl\acpdv.utils.forms.impl.resourcesimages.pas',
  acpdv.utils.forms.impl.gerenciadorform in 'src\utils\impl\acpdv.utils.forms.impl.gerenciadorform.pas',
  acpdv.utils.forms.impl.forms in 'src\utils\impl\acpdv.utils.forms.impl.forms.pas',
  acpdv.view.page.pagamento in 'src\view\acpdv.view.page.pagamento.pas' {PagePagamento},
  acpdv.view.loginsupervisor in 'src\view\acpdv.view.loginsupervisor.pas' {PagePermissaoSupervisor},
  acpdv.view.componente.listaitem in 'src\view\componente\acpdv.view.componente.listaitem.pas' {ComponenteListaItem: TFrame},
  acpdv.view.componente.mensagens in 'src\view\componente\acpdv.view.componente.mensagens.pas' {PageMensagens},
  acpdv.utils.trataexceptions in 'src\utils\acpdv.utils.trataexceptions.pas',
  acpdv.model.conexao in 'src\model\conexao\acpdv.model.conexao.pas' {Conexao: TDataModule},
  acpdv.model.dao.interfaces in 'src\model\dao\acpdv.model.dao.interfaces.pas',
  acpdv.model.conexao.configuracao in 'src\model\conexao\acpdv.model.conexao.configuracao.pas',
  acpdv.model.dao.adquirente in 'src\model\dao\acpdv.model.dao.adquirente.pas',
  acpdv.model.fechamentocaixa in 'src\model\acpdv.model.fechamentocaixa.pas',
  acpdv.Model.Entidade.CAIXA in 'src\model\entidades\acpdv.Model.Entidade.CAIXA.pas',
  acpdv.Model.dao.CAIXA in 'src\model\dao\acpdv.Model.dao.CAIXA.pas',
  acpdv.Model.Entidade.caixamovimento in 'src\model\entidades\acpdv.Model.Entidade.caixamovimento.pas',
  acpdv.Model.dao.CAIXA_MOVIMENTO in 'src\model\dao\acpdv.Model.dao.CAIXA_MOVIMENTO.pas',
  acpdv.Model.Entidade.CartaoBandeira in 'src\model\entidades\acpdv.Model.Entidade.CartaoBandeira.pas',
  acpdv.Model.dao.CartaoBandeira in 'src\model\dao\acpdv.Model.dao.CartaoBandeira.pas',
  acpdv.Model.Entidade.Cest in 'src\model\entidades\acpdv.Model.Entidade.Cest.pas',
  acpdv.Model.dao.cest in 'src\model\dao\acpdv.Model.dao.cest.pas',
  acpdv.Model.Entidade.Cfop in 'src\model\entidades\acpdv.Model.Entidade.Cfop.pas',
  acpdv.Model.dao.Cfop in 'src\model\dao\acpdv.Model.dao.Cfop.pas',
  acpdv.Model.Entidade.Cidade in 'src\model\entidades\acpdv.Model.Entidade.Cidade.pas',
  acpdv.Model.dao.Cidade in 'src\model\dao\acpdv.Model.dao.Cidade.pas',
  acpdv.Model.Entidade.CodigoAnp in 'src\model\entidades\acpdv.Model.Entidade.CodigoAnp.pas',
  acpdv.Model.Entidade.Configuracao in 'src\model\entidades\acpdv.Model.Entidade.Configuracao.pas',
  acpdv.Model.Entidade.CRT in 'src\model\entidades\acpdv.Model.Entidade.CRT.pas',
  acpdv.Model.Entidade.CST in 'src\model\entidades\acpdv.Model.Entidade.CST.pas',
  acpdv.Model.Entidade.Cstcofins in 'src\model\entidades\acpdv.Model.Entidade.Cstcofins.pas',
  acpdv.Model.Entidade.Cstipi in 'src\model\entidades\acpdv.Model.Entidade.Cstipi.pas',
  acpdv.Model.Entidade.Cstpis in 'src\model\entidades\acpdv.Model.Entidade.Cstpis.pas',
  acpdv.Model.Entidade.Empresa in 'src\model\entidades\acpdv.Model.Entidade.Empresa.pas',
  acpdv.Model.Entidade.FormaPagamento in 'src\model\entidades\acpdv.Model.Entidade.FormaPagamento.pas',
  acpdv.Model.Entidade.Ibpt in 'src\model\entidades\acpdv.Model.Entidade.Ibpt.pas',
  acpdv.Model.Entidade.MfePagamento in 'src\model\entidades\acpdv.Model.Entidade.MfePagamento.pas',
  acpdv.Model.Entidade.Nfe in 'src\model\entidades\acpdv.Model.Entidade.Nfe.pas',
  acpdv.Model.Entidade.NfeEvento in 'src\model\entidades\acpdv.Model.Entidade.NfeEvento.pas',
  acpdv.Model.Entidade.NfeInutilizacao in 'src\model\entidades\acpdv.Model.Entidade.NfeInutilizacao.pas',
  acpdv.Model.Entidade.NfeItem in 'src\model\entidades\acpdv.Model.Entidade.NfeItem.pas',
  acpdv.Model.Entidade.NfePagamento in 'src\model\entidades\acpdv.Model.Entidade.NfePagamento.pas',
  acpdv.Model.Entidade.Operador in 'src\model\entidades\acpdv.Model.Entidade.Operador.pas',
  acpdv.Model.Entidade.Origem in 'src\model\entidades\acpdv.Model.Entidade.Origem.pas',
  acpdv.Model.Entidade.Pessoa in 'src\model\entidades\acpdv.Model.Entidade.Pessoa.pas',
  acpdv.Model.Entidade.Pos in 'src\model\entidades\acpdv.Model.Entidade.Pos.pas',
  acpdv.Model.Entidade.Produto in 'src\model\entidades\acpdv.Model.Entidade.Produto.pas',
  acpdv.Model.Entidade.SuprimentoSangria in 'src\model\entidades\acpdv.Model.Entidade.SuprimentoSangria.pas',
  acpdv.Model.Entidade.Turno in 'src\model\entidades\acpdv.Model.Entidade.Turno.pas',
  acpdv.Model.Entidade.uf in 'src\model\entidades\acpdv.Model.Entidade.uf.pas',
  acpdv.Model.Entidade.Unidade in 'src\model\entidades\acpdv.Model.Entidade.Unidade.pas',
  acpdv.Model.dao.CodigoAnp in 'src\model\dao\acpdv.Model.dao.CodigoAnp.pas',
  acpdv.Model.dao.Configuracao in 'src\model\dao\acpdv.Model.dao.Configuracao.pas',
  acpdv.Model.dao.crt in 'src\model\dao\acpdv.Model.dao.crt.pas',
  acpdv.Model.dao.cst in 'src\model\dao\acpdv.Model.dao.cst.pas',
  acpdv.Model.dao.Cstcofins in 'src\model\dao\acpdv.Model.dao.Cstcofins.pas',
  acpdv.Model.dao.Cstipi in 'src\model\dao\acpdv.Model.dao.Cstipi.pas',
  acpdv.Model.dao.Cstpis in 'src\model\dao\acpdv.Model.dao.Cstpis.pas',
  acpdv.Model.dao.Empresa in 'src\model\dao\acpdv.Model.dao.Empresa.pas',
  acpdv.Model.dao.FormaPagamento in 'src\model\dao\acpdv.Model.dao.FormaPagamento.pas',
  acpdv.Model.dao.Ibpt in 'src\model\dao\acpdv.Model.dao.Ibpt.pas',
  acpdv.Model.dao.MfePagamento in 'src\model\dao\acpdv.Model.dao.MfePagamento.pas',
  acpdv.Model.dao.nfe in 'src\model\dao\acpdv.Model.dao.nfe.pas',
  acpdv.Model.dao.NfeEvento in 'src\model\dao\acpdv.Model.dao.NfeEvento.pas',
  acpdv.Model.dao.NfeInutilizacao in 'src\model\dao\acpdv.Model.dao.NfeInutilizacao.pas',
  acpdv.Model.dao.NfeItem in 'src\model\dao\acpdv.Model.dao.NfeItem.pas',
  acpdv.Model.dao.NfePagamento in 'src\model\dao\acpdv.Model.dao.NfePagamento.pas',
  acpdv.Model.dao.Operador in 'src\model\dao\acpdv.Model.dao.Operador.pas',
  acpdv.Model.dao.Origem in 'src\model\dao\acpdv.Model.dao.Origem.pas',
  acpdv.Model.dao.pessoa in 'src\model\dao\acpdv.Model.dao.pessoa.pas',
  acpdv.Model.dao.pos in 'src\model\dao\acpdv.Model.dao.pos.pas',
  acpdv.Model.dao.produto in 'src\model\dao\acpdv.Model.dao.produto.pas',
  acpdv.Model.dao.SuprimentoSangria in 'src\model\dao\acpdv.Model.dao.SuprimentoSangria.pas',
  acpdv.Model.dao.turno in 'src\model\dao\acpdv.Model.dao.turno.pas',
  acpdv.Model.dao.UF in 'src\model\dao\acpdv.Model.dao.UF.pas',
  acpdv.Model.dao.unidade in 'src\model\dao\acpdv.Model.dao.unidade.pas',
  acpdv.model.caixa in 'src\model\acpdv.model.caixa.pas',
  acpdv.model.core.entityoperador in 'src\model\core\acpdv.model.core.entityoperador.pas' {EntityOperador: TDataModule},
  acpdv.controller in 'src\controller\acpdv.controller.pas',
  acpdv.view.componente.listatipopgfechamento in 'src\view\componente\acpdv.view.componente.listatipopgfechamento.pas' {ComponentListaFechamentoCaixa: TFrame},
  acpdv.model.entidade.adquirente in 'src\model\entidades\acpdv.model.entidade.adquirente.pas';

{$R *.res}

begin
 Application.Initialize;
 // ReportMemoryLeaksOnShutdown := True;   // esta a��o mostra se tem memoryleak no projeto, se tem vazamento de memoria, ou seja, objetos que precisam ser destruidos
 Application.MainFormOnTaskbar := True;
 Application.CreateForm(Tpageprincipal, pageprincipal);
  Application.Run;

end.
