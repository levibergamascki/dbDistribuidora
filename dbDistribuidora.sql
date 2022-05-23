create database dbDistribuidora;
use dbDistribuidora;

-- entrada (compra)
create table tbCompra(
idCompra int primary key auto_increment,
quantidadeCompra int not null,
valorCompra float(6,2),
idproduto int primary key auto_increment,
foreign key(idproduto) references tbProduto(idproduto),
idfornecedor int primary key auto_increment,
foreign key (idfornecedor) references tbFornecedor(idfornecedor)
);

-- saída (venda)
create table tbVenda(
idVenda int primary key auto_increment,
quantidadeVenda int not null,
valorVenda float(6,2),
idproduto int primary key auto_increment,
foreign key(idproduto) references tbProduto(idproduto),
IdCliente int primary key auto_increment,
foreign key (idcliente) references tbcliente(idcliente)
);

-- cliente
create table tbCliente(
nomeCliente varchar(30) not null,
Endereco varchar(50) not null,
cep int not null,
telefone int not null,
email varchar(50) not null,
IdCliente int primary key auto_increment
);
create table tbClientePfisica(
cpf bigint not null,
sexoCliente char(1) not null,
IdCliente int primary key auto_increment,
FOREIGN KEY (IdCliente) references tbCliente(IdCliente)
);
create table tbClientePjuridica(
cnpj bigint not null,
IdCliente int primary key auto_increment,
FOREIGN KEY (IdCliente) references tbCliente(IdCliente)
);
-- produto
create table tbProduto(
idProduto int primary key auto_increment,
nomeProduto varchar(50) not null,
valorunitario float(6,2) not null,
estoqueProduto int not null
);

-- fornecedor
create table tbFornecedor(
idfornecedor int primary key auto_increment
-- quantidade
-- tipo
-- valor 
-- 
);
-- NotaFiscal
create table tbNotaFiscal(
registroNfiscal date,
idVenda int primary key auto_increment,
/*Razão Social
CNPJ
DDD
Telefone
Endereço
Número
Bairro
Estado
Cidade
CEP
E-Mail
Inscrição Estadual*/
foreign key (idVenda) references tbVenda(idvenda)
)
