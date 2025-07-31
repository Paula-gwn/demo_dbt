-- models/analytics/profit_by_brand.sql

{{ config(materialized='table') }}

SELECT
    TRUCK_BRAND_NAME,
    MENU_TYPE,
    SUM(PROFIT_USD) AS TOTAL_PROFIT,
    COUNT(*) AS ITEM_COUNT,
    AVG(PROFIT_USD) AS AVG_PROFIT_PER_ITEM
FROM {{ ref('stg_menu') }}
GROUP BY TRUCK_BRAND_NAME, MENU_TYPE
