/*==============================================================*/
/* Database name:  COPAGRESS                                    */
/* DBMS name:      MySQL 3.23                                   */
/* Created on:     23/2/2017 14:50:06                           */
/*==============================================================*/


drop index I00EMPRESA on TEMPRESA;

drop index I01EMPRESA on TEMPRESA;

drop index I00MODULO on TMODULO;

drop index I00MUNICIPIO on TMUNICIPIO;

drop index I01UF on TMUNICIPIO;

drop index I00OPERACAO on TOPERACAO;

drop index I01MODULO on TOPERACAO;

drop index I00PERFIL on TPERFIL;

drop index I00UF on TUF;

drop index I02UF on TUF;

drop index I01USUARIO on TUSUARIO;

drop index I02USUARIO on TUSUARIO;

drop table if exists TCARTAO_EMPRESA;

drop table if exists TEMPRESA;

drop table if exists TENDERECO;

drop table if exists TFORMA_PAGAMENTO;

drop table if exists TLICENCA;

drop table if exists TLICENCA_EMPRESA;

drop table if exists TMODULO;

drop table if exists TMUNICIPIO;

drop table if exists TOPERACAO;

drop table if exists TOPERACAO_PERFIL;

drop table if exists TOPERADORA_CARTAO;

drop table if exists TPAGAMENTO_LICENCA;

drop table if exists TPERFIL;

drop table if exists TUF;

drop table if exists TUSUARIO;

/*==============================================================*/
/* Table: TCARTAO_EMPRESA                                       */
/*==============================================================*/
create table if not exists TCARTAO_EMPRESA
(
   AOID_CARTAO_EMPRESA            int(11)                        not null,
   AOID_EMPRESA                   int(11)                        not null,
   AOID_OPERADORA_CARTAO          int(1)                         not null,
   ANUM_CARTAO                    varchar(16)                    not null,
   ATXT_MES_ANO_VALIDADE          varchar(4)                     not null,
   ABOL_PADRAO                    int(1)                         not null,
   primary key (AOID_CARTAO_EMPRESA),
   unique (ANUM_CARTAO)
);

/*==============================================================*/
/* Table: TEMPRESA                                              */
/*==============================================================*/
create table if not exists TEMPRESA
(
   AOID_EMPRESA                   int(11)                        not null,
   AOID_ENDERECO                  int(11),
   AOID_FORMA_PAGAMENTO           int(11)                        not null,
   ANUM_CNPJ                      varchar(15)                    not null,
   ANOM_RAZAO_SOCIAL              varchar(70)                    not null,
   ABOL_ATIVA                     int(1)                         not null,
   primary key (AOID_EMPRESA),
   unique (ANUM_CNPJ)
);

/*==============================================================*/
/* Index: I00EMPRESA                                            */
/*==============================================================*/
create index I00EMPRESA on TEMPRESA
(
   ANUM_CNPJ
);

/*==============================================================*/
/* Index: I01EMPRESA                                            */
/*==============================================================*/
create unique index I01EMPRESA on TEMPRESA
(
   ANUM_CNPJ
);

/*==============================================================*/
/* Table: TENDERECO                                             */
/*==============================================================*/
create table if not exists TENDERECO
(
   AOID_ENDERECO                  int(11)                        not null,
   AOID_MUNICIPIO                 INT(11),
   ANOM_LOGRADOURO                varchar(70)                    not null,
   ANUM_IMOVEL                    int(5),
   ANUM_CEP                       int(8),
   ATXT_COMPLEMENTO               varchar(70),
   ANOM_BAIRRO                    varchar(70),
   ANUM_TEL_FIXO                  varchar(15),
   primary key (AOID_ENDERECO)
);

/*==============================================================*/
/* Table: TFORMA_PAGAMENTO                                      */
/*==============================================================*/
create table if not exists TFORMA_PAGAMENTO
(
   AOID_FORMA_PAGAMENTO           int(11)                        not null,
   ADES_FORMA_PAGAMENTO           varchar(70)                    not null,
   primary key (AOID_FORMA_PAGAMENTO),
   unique (ADES_FORMA_PAGAMENTO)
);

/*==============================================================*/
/* Table: TLICENCA                                              */
/*==============================================================*/
create table if not exists TLICENCA
(
   AOID_LICENCA                   int(11)                        not null,
   ADES_LICENCA                   varchar(70)                    not null,
   ANUM_DIAS                      int(5)                         not null,
   AVAL_LICENCA                   decimal(15,2)                  not null,
   primary key (AOID_LICENCA)
);

/*==============================================================*/
/* Table: TLICENCA_EMPRESA                                      */
/*==============================================================*/
create table if not exists TLICENCA_EMPRESA
(
   AOID_LICENCA_EMPRESA           int(11)                        not null,
   AOID_TIPO_LICENCA              int(11)                        not null,
   AOID_EMPRESA                   int(11)                        not null,
   ADAT_INICIO_VIGENCIA           date,
   ADAT_FIM_VIGENCIA              date,
   ABOL_LICENCIADO                int(1)                         not null default 0,
   primary key (AOID_LICENCA_EMPRESA)
);

/*==============================================================*/
/* Table: TMODULO                                               */
/*==============================================================*/
create table if not exists TMODULO
(
   AOID_MODULO                    INT(11)                        not null AUTO_INCREMENT,
   ANOM_MODULO                    VARCHAR(70)                    not null,
   primary key (AOID_MODULO)
)
type = InnoDB;

/*==============================================================*/
/* Index: I00MODULO                                             */
/*==============================================================*/
create unique index I00MODULO on TMODULO
(
   ANOM_MODULO
);

/*==============================================================*/
/* Table: TMUNICIPIO                                            */
/*==============================================================*/
create table if not exists TMUNICIPIO
(
   AOID_MUNICIPIO                 INT(11)                        not null AUTO_INCREMENT,
   AOID_UF                        int(11)                        not null,
   ANOM_MUNICIPIO                 VARCHAR(70)                    not null,
   ACOD_MUNICIPIO                 VARCHAR(3)                     not null,
   primary key (AOID_MUNICIPIO),
   unique (ACOD_MUNICIPIO)
)
type = InnoDB;

/*==============================================================*/
/* Index: I00MUNICIPIO                                          */
/*==============================================================*/
create unique index I00MUNICIPIO on TMUNICIPIO
(
   ACOD_MUNICIPIO,
   AOID_UF
);

/*==============================================================*/
/* Index: I01UF                                                 */
/*==============================================================*/
create index I01UF on TMUNICIPIO
(
   AOID_UF
);

/*==============================================================*/
/* Table: TOPERACAO                                             */
/*==============================================================*/
create table if not exists TOPERACAO
(
   AOID_OPERACAO                  INT(11)                        not null AUTO_INCREMENT,
   AOID_MODULO                    INT(11)                        not null,
   ANOM_OPERACAO                  VARCHAR(70)                    not null,
   ADES_OPERACAO                  VARCHAR(70)                    not null,
   primary key (AOID_OPERACAO)
)
type = InnoDB;

/*==============================================================*/
/* Index: I00OPERACAO                                           */
/*==============================================================*/
create unique index I00OPERACAO on TOPERACAO
(
   ANOM_OPERACAO,
   AOID_MODULO
);

/*==============================================================*/
/* Index: I01MODULO                                             */
/*==============================================================*/
create index I01MODULO on TOPERACAO
(
   AOID_MODULO
);

/*==============================================================*/
/* Table: TOPERACAO_PERFIL                                      */
/*==============================================================*/
create table if not exists TOPERACAO_PERFIL
(
   AOID_OPERACAO_PERFIL           int(11)                        not null,
   AOID_PERFIL                    int(11)                        not null,
   AOID_OPERACAO                  INT(11)                        not null,
   primary key (AOID_OPERACAO_PERFIL)
);

/*==============================================================*/
/* Table: TOPERADORA_CARTAO                                     */
/*==============================================================*/
create table if not exists TOPERADORA_CARTAO
(
   AOID_OPERADORA_CARTAO          int(11)                        not null,
   ANOM_OPERADORA_CARTAO          varchar(70)                    not null,
   primary key (AOID_OPERADORA_CARTAO),
   unique (ANOM_OPERADORA_CARTAO)
);

/*==============================================================*/
/* Table: TPAGAMENTO_LICENCA                                    */
/*==============================================================*/
create table if not exists TPAGAMENTO_LICENCA
(
   AOID_PAGAMENTO_LICENCA         int(11)                        not null,
   AOID_EMPRESA                   int(11)                        not null,
   AOID_FORMA_PAGAMENTO           int(11)                        not null,
   AOID_USUARIO                   int(11)                        not null,
   AOID_LICENCA_EMPRESA           int(11)                        not null,
   ADAT_VENCIMENTO                date                           not null,
   ADAT_PAGAMENTO                 date,
   AVAL_PAGAMENTO                 decimal(15,2)                  not null,
   ANUM_PROTOCOLO                 varchar(70),
   primary key (AOID_PAGAMENTO_LICENCA)
);

/*==============================================================*/
/* Table: TPERFIL                                               */
/*==============================================================*/
create table if not exists TPERFIL
(
   AOID_PERFIL                    int(11)                        not null,
   ANOM_PERFIL                    varchar(70)                    not null,
   primary key (AOID_PERFIL),
   unique (ANOM_PERFIL)
);

/*==============================================================*/
/* Index: I00PERFIL                                             */
/*==============================================================*/
create unique index I00PERFIL on TPERFIL
(
   ANOM_PERFIL
);

/*==============================================================*/
/* Table: TUF                                                   */
/*==============================================================*/
create table if not exists TUF
(
   AOID_UF                        int(11)                        not null AUTO_INCREMENT,
   ACOD_SIGLA                     CHAR(2)                        not null,
   ANOM_UF                        VARCHAR(70)                    not null,
   primary key (AOID_UF)
)
type = InnoDB;

/*==============================================================*/
/* Index: I00UF                                                 */
/*==============================================================*/
create unique index I00UF on TUF
(
   ACOD_SIGLA
);

/*==============================================================*/
/* Index: I02UF                                                 */
/*==============================================================*/
create unique index I02UF on TUF
(
   ANOM_UF
);

/*==============================================================*/
/* Table: TUSUARIO                                              */
/*==============================================================*/
create table if not exists TUSUARIO
(
   AOID_USUARIO                   int(11)                        not null,
   AOID_PERFIL                    int(11)                        not null,
   ANUM_CPF                       varchar(11),
   ATXT_EMAIL                     varchar(70)                    not null,
   ANOM_USUARIO                   varchar(70)                    not null,
   ASEN_LOGIN                     varchar(15)                    not null,
   ANUM_TEL_FIXO                  varchar(15),
   ANUM_TEL_MOVEL                 varchar(15),
   ABOL_ATIVO                     int(1)                         not null,
   ADAT_CADASTRO                  date                           not null,
   ADAT_BLOQUEIO                  date,
   primary key (AOID_USUARIO)
);

/*==============================================================*/
/* Index: I01USUARIO                                            */
/*==============================================================*/
create unique index I01USUARIO on TUSUARIO
(
   ANUM_CPF
);

/*==============================================================*/
/* Index: I02USUARIO                                            */
/*==============================================================*/
create unique index I02USUARIO on TUSUARIO
(
   ATXT_EMAIL
);

