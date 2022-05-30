
create database dbdistribuidora; 
 use dbdistribuidora; 
  
 create table tbestado( 
         estadoUF char(2) not null, 
         UFID int primary key auto_increment
 ); 
  
 create table tbcidade( 
	 idcidade int primary key auto_increment, 
     cidade varchar(50), 
     UFID int auto_increment, 
     foreign key (UFId) references tbestado(UFId) 
 ); 
  
 create table tblog( 
     logradouro varchar(100) not null, 
     bairro varchar(50), 
     cep int primary key, 
     idcidade int, 
     foreign key (idcidade) references tbcidade(idcidade) 
 ); 
  
 create table tbendereco( 
         IDendereco int primary key auto_increment, 
     compEndereco varchar(50), 
     cep numeric(8), 
     foreign key (cep) references tblog(cep) 
 ); 
  
 create table tbpessoa( 
         idCli int primary key auto_increment, 
     nomeCli varchar(200) not null, 
     telPessoa int not null, 
         numLog numeric(6) not null, 
     IDendereco int, 
     foreign key (IDendereco) references tbendereco(IDendereco) 
 ); 
  
 create table tbclientePJ( 
         cnpj numeric(14) not null primary key, 
     IE numeric(11) not null, 
     idCli int, 
     foreign key (idCli) references tbpessoa(idCli) 
 ); 
  
 CREATE TABLE tbclientePF ( 
     cpf numeric(11) NOT NULL PRIMARY KEY, 
     dataNasc DATE not null, 
     rg numeric(9) not null,
     rgdig char(1) not null,
	sexoCli char(1), 
     idCli INT, 
     FOREIGN KEY (idCli) 
         REFERENCES tbpessoa (idCli) 
 ); 
  
 ---------- 
 create table tbfornecedor( 
         codFornecedor numeric(10) auto_increment primary key, 
     cnpj numeric(14) not null unique, 
     nomeFornecedor varchar(200) not null, 
     tel int
 ); 
  
 create table tbproduto( 
	 codigoBarras numeric(14) primary key unique, 
     nomeProd varchar(200) not null, 
     valorUnit decimal(7,2) not null, 
     qtd int 
 ); 
  
 create table tbprodutoComprado ( 
		CodigoBarras bigint not null,
		NotaFiscal int primary key,
        valoritem decimal(7,2) not null,
        qtd int not null,
        foreign key (CodigoBarras) references tbproduto(codigobarras)
		
 ); 
  
 create table tbcompra( 
         NotaFiscal int primary key not null, 
     dataCompra date not null, 
     valorTotal decimal(7,2) not null, 
     qtdTotal int not null, 
     codFornecedor int , 
     codigoBarras bigint, 
     foreign key (NotaFiscal) references tbprodutocomprado(NotaFiscal),
     foreign key (codFornecedor) references tbfornecedor(codFornecedor), 
     foreign key (codigoBarras) references tbproduto(codigoBarras) 
 ); 
  
 create table tbestoque( 
         idestoque int auto_increment primary key, 
         qtd int, 
     valorItem decimal(7,2), 
     codigoBarras bigint, 
     foreign key (codigoBarras) references tbproduto(codigoBarras) 
 ); 
  
 ---------------------------- 
  
 create table tbNF( 
         NF int primary key, 
     totalNota decimal(7,2) not null, 
     dataEmissao date not null, 
     codigoBarras bigint, 
     foreign key (codigoBarras) references tbproduto(codigoBarras) 
 ); 
  
 create table tbvenda( 
         numeroVenda int primary key, 
     dataVenda datetime, 
     totalVenda decimal(7,2) not null, 
     NF int, 
     idCli int not null, 
     foreign key (NF) references tbNF(NF), 
     foreign key (idCli) references tbpessoa(idCli) 
 );
create table tbItemVenda(
numeroVenda int primary key,
CodigoBarras numeric(14),
ValorItem decimal(7,2) not null,
qtd int not null,
foreign key (numeroVenda) references tbvenda(numeroVenda),
foreign key (CodigoBarras) references tbproduto(codigoBarras)
)
