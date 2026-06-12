CREATE EXTERNAL TABLE IF NOT EXISTS cap_dataproducts.t_atm_loc (
  atm_id     BIGINT        COMMENT 'Unique identifier for each ATM',
  au_num      STRING        COMMENT 'ATM Authorization number',
  site_city_nm       STRING        COMMENT 'ATM site city name',
  site_st_cd           STRING        COMMENT 'ATM Site state code',
  site_pstl_cd           STRING        COMMENT 'ATM Site Postal code',
  eff_dt             Date           COMMENT 'Effective Date',
  expir_dt          Date COMMENT 'Expiration Date',
  atm_stat_nm       BOOLEAN       COMMENT 'ATM Status',
  CAP_SOR_CD      TIMESTAMP     COMMENT 'Audit - Source Record creation',
  CAP_DELTA_CD      TIMESTAMP     COMMENT 'Audit',
  CAP_CRTE_BY_ID	BIGINT	COMMENT 'Audit',
  CAP_CRTE_DTTM	TIMESTAMP	COMMENT 'Audit',
  CAP_ERR_FLG_IND	BIGINT	COMMENT 'Audit',
  CAP_ERR_TXT	STRING	COMMENT 'Audit',
  CAP_RUN_ID	STRING	COMMENT 'Audit',
  CAP_BUS_EFF_DT	TIMESTAMP	COMMENT 'Audit'

)
COMMENT 'ATM master table containing ATM profile and location data'
PARTITIONED BY (
  expir_dt              Date        COMMENT 'Partition date in YYYY-MM-DD format'
)
STORED AS PARQUET
LOCATION '/user/hive/warehouse/cap_dataproducts/t_atm_loc'
TBLPROPERTIES (
  'parquet.compression' = 'SNAPPY',
  'creator'             = 'data_engineering',
  'created_date'        = '2024-01-01'
);