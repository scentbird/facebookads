view: campaigns {
  sql_table_name: facebook_all_accounts.campaigns ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month, year]
    sql: ${TABLE}.start_time ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  #   - dimension: buying_type
  #     type: string
  #     sql: ${TABLE}.buying_type

  dimension: effective_status {
    type: string
    sql: ${TABLE}.effective_status ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}.objective ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
