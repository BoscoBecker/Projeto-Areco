
/*********************** R E A D M E ************************************\


Agradeço Primeiramente pela oportunidade e descupas pelos imprevistos...

* Sistema gerenciador de Banco de Dados

Optei por usar como sistema gerenciador de banco de dados o SQL SERVER 2012 Express.
O mesmo pode ser baixado no seguinte link :
https://www.microsoft.com/pt-br/download/confirmation.aspx?id=29062&6B49FDFB-8E5B-4B07-BC31-15695C5A2143=1
arquivo chamado de "SQLEXPRWT_x86_PTB.exe" com o Front-end e tudo para se gerenciar um SGBD.

Usuário:sa
Senha:cidadao2018

String de conexão ADO
Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Pwd=cidadao2018;Initial Catalog=dbARECO;Data Source=localhost;Use Procedure for Prepare=1;
Auto Translate=True;Packet Size=4096;Workstation ID=localhost;Initial File Name="";Use Encryption for Data=False;
Tag with column collation when possible=False;MARS Connection=False;DataTypeCompatibility=0;Trust Server Certificate=False;
Application Intent=READWRITE;

* Foi realizado um Bakcup da Base de dados só restaurar, está na raiz do projeto
chamada de "DB", compactado.
		 

* Funcionamento das Telas

Explicando o funcionamento dos cadastros de todas as telas...		 

Botão Atualizar, Apenas atualiza o grid da tela.	
	 
Botão Novo, apenas faz a limpeza dos edits caso você tenha acabado de salvar um registro.

Botão Alterar, altera os registros da seguinte forma: Basta selecionar o resgistro no grid
e informar os valores nos Edits e depois clicar em alterar,ele subsitiruira os registros.

Botão deletar, basta selecionar o registro no grid.	 

Botão Imprimir, Imprime o relatório.

* Relatórios 

Foi usado o Report Builder baixado do seguinte link:
http://www.digital-metaphors.com/download/demo/server/rbServ16d.exe
Criei apenas relatórios simples de listagem devido ao tempo....

* IDE 

Projeto realizado em: 
Embarcadero® RAD Studio XE2 Version 16.0.4316.44803 
Copyright © 2011 Embarcadero Technologies, Inc. All Rights Reserved.


* Testes DUNIT

Foi executado o Teste/Teste Case com as Telas de cadastros que contem os CRUDs
a pasta com o teste e os resultados se encontra em "Testes Dunit".

PS:Na analise apenas foi sugerido usar os enventos dos botões for exemplo no 
botão Salvar ele sugeriu "btnSalvarClick" por Ex.

* Maquina usada para o desenvolvimento

Processador: AMD 1.0 Ghz
Memoria RAM : 6.0 GB
OS WIndows 10 Pro 64 Bits

@boscobecker Feito com <3	 
		 
		 
		 
/********************** R E A D M E ****************************************\		 