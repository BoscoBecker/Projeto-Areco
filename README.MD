# Projeto de software simples(CRUD) usando Delphi+POO

## Caracteristicas

* Utilizar Delphi XE2 +
* Persistir os dados em um banco de dados de sua preferência.
* Permitir que o usuário inclua, atualize e delete registros.
* Os cadastros deverão ser efetuado em formulários e os mesmos devem ser exibidos de maneira modal (ShowModal).
* Listar os itens na tela inicial da aplicação (Apenas as informações comuns)
* O formulário deverá ser estilizado sem bibliotecas ou componentes terceiros.


# SQL Server 2012 Express

O "SQL Server 2012 Express" está [disponível](https://www.microsoft.com/pt-br/download/confirmation.aspx?id=29062&6B49FDFB-8E5B-4B07-BC31-15695C5A2143=1)
no site da [Microsoft](https://www.microsoft.com/pt-br/)
versão **```Microsoft SQL Server 2012 - 11.0.2100.60```**

# Report Builder (Gerador de relatório )

O Report Builder está [disponível](http://www.digital-metaphors.com/download/demo/server/rbServ16d.exe)
no site da [Metaphors](http://www.digital-metaphors.com/) 
versão **```19.02```**

* Criados Relatórios simples

#Informações de acesso a base de dados.

* Usuário:sa
* Senha:cidadao2018
* String de conexão ADO, caso precise.

*Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Pwd=cidadao2018;Initial Catalog=dbARECO;Data Source=localhost;Use Procedure for Prepare=1;
Auto Translate=True;Packet Size=4096;Workstation ID=localhost;Initial File Name="";Use Encryption for Data=False;
Tag with column collation when possible=False;MARS Connection=False;DataTypeCompatibility=0;Trust Server Certificate=False;
Application Intent=READWRITE;

## Foi realizado um Bakcup da Base de dados, só restaurar, está na raiz do projeto pasta chamada de "DB", compactado.	 
		 
		 
# Funcionamento das Telas

Explicando o funcionamento dos cadastros de todas as telas...		 

*Botão Atualizar, Apenas atualiza o grid da tela.	
	 
*Botão Novo, apenas faz a limpeza dos edits caso você tenha acabado de salvar um registro.

*Botão Alterar, altera os registros da seguinte forma: Basta selecionar o resgistro no grid
e informar os valores nos Edits e depois clicar em alterar,ele subsitiruira os registros.

*Botão deletar, basta selecionar o registro no grid.	 

*Botão Imprimir, Imprime o relatório.


# IDE de Desenvolvimento

Projeto realizado em: 
Embarcadero® RAD Studio XE2 Version 16.0.4316.44803 
Copyright © 2011 Embarcadero Technologies, Inc. All Rights Reserved.


# Testes DUNIT

*Foi executado o Teste/Teste Case com as Telas de cadastros que contem os CRUDs
a pasta com o teste e os resultados se encontra em "Testes Dunit".

PS:Na analise apenas foi sugerido usar os enventos dos botões for exemplo no 
botão Salvar ele sugeriu "btnSalvarClick" por Ex:

```pascal
procedure TestTFrmCategoria.TestbtnSalvarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmCategoria.btnSalvarClick(Sender);
  // TODO: Validate method results
end;
```

# Maquina usada para o desenvolvimento

* Processador: AMD 1.0 Ghz
* Memoria RAM : 6.0 GB
* OS WIndows 10 Pro 64 Bits

* o arquivo .travis.yml e .coveralls.yml, são apenas marcação para o GitHub

# boscobecker Feito com <3	 
		 
		 
