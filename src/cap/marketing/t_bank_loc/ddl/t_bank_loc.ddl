CREATE EXTERNAL TABLE IF NOT EXISTS cap_dataproducts.t_bank_loc (
  bank_id     BIGINT        COMMENT 'Unique identifier for each bank',
  au_num      STRING        COMMENT 'Bank Authorization number',
  bank_site_city_nm       STRING        COMMENT 'Bank site city name',
  bank_site_st_cd           STRING        COMMENT 'Bank Site state code',
  bank_site_pstl_cd           STRING        COMMENT 'Bank Site Postal code',
  eff_dt             Date           COMMENT 'Effective Date',
  expir_dt          Date COMMENT 'Expiration Date',
  bank_stat_nm       BOOLEAN       COMMENT 'Bank Status',
  CAP_SOR_CD      TIMESTAMP     COMMENT 'Audit - Source Record creation',
  CAP_DELTA_CD      TIMESTAMP     COMMENT 'Audit',
  CAP_CRTE_BY_ID	BIGINT	COMMENT 'Audit',
  CAP_CRTE_DTTM	TIMESTAMP	COMMENT 'Audit',
  CAP_ERR_FLG_IND	BIGINT	COMMENT 'Audit',
  CAP_ERR_TXT	STRING	COMMENT 'Audit',
  CAP_RUN_ID	STRING	COMMENT 'Audit',
  CAP_BUS_EFF_DT	TIMESTAMP	COMMENT 'Audit'

)
COMMENT 'Bank master table containing Bank profile data'
PARTITIONED BY (
  expir_dt              Date        COMMENT 'Partition date in YYYY-MM-DD format'
)
STORED AS PARQUET
LOCATION '/user/hive/warehouse/cap_dataproducts/t_bank_loc'
TBLPROPERTIES (
  'parquet.compression' = 'SNAPPY',
  'creator'             = 'data_engineering',
  'created_date'        = '2024-01-01'
);