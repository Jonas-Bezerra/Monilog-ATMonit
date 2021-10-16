create database atmonit;

use atmonit;

create table endereco_terminal(
	id_endereco int primary key auto_increment,
    logradouro varchar(60),
    cidade varchar(35) not null,
    estado varchar(25) not null,
    bairro varchar(35) not null
);

create table empresa(
	id_empresa int primary key auto_increment,
    nome varchar(50) not null,
    cnpj char(14) not null
);

create table funcionario(
	id_funcionario int primary key auto_increment,
    nome varchar(100) not null,
    cargo enum("Administrador", "Gerente de Suporte", "Operação") not null,
    login varchar(50) unique not null,
    senha varchar(250) not null,
    fk_empresa int not null,
    foreign key(fk_empresa) references empresa(id_empresa)
);

create table terminal(
	id_terminal int primary key auto_increment,
    processador varchar(50),
    ram varchar(15),
    armazenamento varchar(15),
    modelo_cpu varchar(50),
    hostname varchar(50),
    fk_endereco int not null,
    foreign key(fk_endereco) references endereco_terminal(id_endereco),
    fk_empresa int not null,
    foreign key(fk_empresa) references empresa(id_empresa)
);

create table historico_uso(
	id_historico_uso int primary key auto_increment,
    tempo_uso time,
    tempo_desuso time,
    frequencia_media_uso double,
    porcentagem_uso_dia double,
    porcentagem_uso_semana double,
    porcentagem_uso_mes double,
    fk_terminal int not null,
    foreign key(fk_terminal) references terminal(id_terminal)
);

create table registro_componentes(
	id_registro_componentes int primary key auto_increment,
    nome_componente varchar(50) not null, 
    porcentagem_uso double,
    data_hora datetime default current_timestamp,
    frequencia double,
    temperatura double,
    fk_terminal int,
    foreign key(fk_terminal) references terminal (id_terminal)
);

create table registro_atividade(
	id_registro_atividade int primary key auto_increment,
    terminal_ativo boolean,
    hora_atividade datetime,
    fk_terminal int,
    foreign key(fk_terminal) references terminal (id_terminal)
);

use atmonit;
select * from empresa;

select * from endereco_terminal;

select * from funcionario;

select * from terminal;
 
select * from registro_componentes;
select * from funcionario as f join empresa as e on f.fk_empresa = e.id_empresa where e.nome = 'Banco24Horas' and f.login = 'abnin' and f.senha = '123';

select * from funcionario;
select * from empresa;

desc registro_componentes;


insert into registro_componentes (nome_componente, porcentagem_uso, frequencia, fk_terminal) values (?, ?, ?, ?, ?);

alter table registro_componentes modify data_hora datetime default current_timestamp;

