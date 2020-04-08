view: ad_insights {
  sql_table_name: facebook_all_accounts.ads_insights;;
  # API documentation: https://developers.facebook.com/docs/marketing-api/insights/fields/v2.6

  ## STANDARD FIELDS

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${campaigns.name} ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost_per_total_action {
    type: number
    sql: ${TABLE}.cost_per_total_action ;;
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}.cpc ;;
  }

  dimension: cpm {
    type: number
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpp {
    type: number
    sql: ${TABLE}.cpp ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: date_start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_stop ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
    value_format_name: usd
  }

  dimension: actions {
    type: number
    sql: scnt_sum_for_key_in_array(${TABLE}.actions, 'value')  ;;
  }

  dimension: lading_page_views {
    type: number
    sql: scnt_sum_for_key_in_array_for_markers(${TABLE}.actions, 'action_type', 'landing_page_view', 'value')  ;;
  }

  dimension: website_purchases {
    type: number
    sql: scnt_sum_for_key_in_array_for_markers(${TABLE}.actions, 'action_type', 'offsite_conversion.fb_pixel_purchase', 'value');;
  }

  dimension: website_purchase_values {
    type: number
    sql: scnt_sum_for_key_in_array_for_markers(${TABLE}.action_values, 'action_type', 'offsite_conversion.fb_pixel_purchase', 'value')  ;;
  }

  dimension: mobile_app_purchases {
    type: number
    sql: scnt_sum_for_key_in_array_for_markers(${TABLE}.actions, 'action_type', 'app_custom_event.fb_mobile_purchase', 'value')  ;;
  }

  dimension: mobile_app_installations {
    type: number
    sql: scnt_sum_for_key_in_array_for_markers(${TABLE}.actions, 'action_type', 'app_custom_event.fb_mobile_activate_app', 'value')  ;;
  }


  dimension: mobile_app_registrations {
    type: number
    sql: scnt_sum_for_key_in_array_for_markers(${TABLE}.actions, 'action_type', 'app_custom_event.fb_mobile_complete_registration', 'value')  ;;
  }



  dimension: website_ceckout_initiated {
    type: number
    sql: scnt_sum_for_key_in_array_for_markers(${TABLE}.actions, 'action_type', 'offsite_conversion.fb_pixel_initiate_checkout', 'value')  ;;
  }


  dimension: website_complete_registration {
    type: number
    sql: scnt_sum_for_key_in_array_for_markers(${TABLE}.actions, 'action_type', 'offsite_conversion.fb_pixel_complete_registration', 'value')  ;;
  }



  dimension: outbound_clicks {
    type: number
    sql: scnt_sum_for_key_in_array(${TABLE}.outbound_clicks, 'value') ;;
  }

  dimension: unique_outbound_clicks {
    type: number
    sql: scnt_sum_for_key_in_array(${TABLE}.unique_outbound_clicks, 'value') ;;
  }

  ## AGGREGATED MEASURES

  measure: count {
    type: count
  }

  measure: total_website_purchases {
    type: sum
    sql: ${website_purchases} ;;
    drill_fields: [detail*]
  }


  measure: total_lading_page_views {
    type: sum
    sql: ${lading_page_views} ;;
    drill_fields: [detail*]
  }


  measure: total_mobile_app_purchases {
    type: sum
    sql: ${mobile_app_purchases} ;;
    drill_fields: [detail*]
  }

  measure: total_mobile_app_installations {
    type: sum
    sql: ${mobile_app_installations} ;;
    drill_fields: [detail*]
  }

  measure: total_mobile_app_registrations {
    type: sum
    sql: ${mobile_app_registrations} ;;
    drill_fields: [detail*]
  }

  measure: total_website_ceckout_initiated {
    type: sum
    sql: ${website_ceckout_initiated} ;;
    drill_fields: [detail*]
  }

  measure: total_unique_outbound_clicks {
    type: sum
    sql: ${unique_outbound_clicks} ;;
    drill_fields: [detail*]
  }

  measure: total_outbound_clicks {
    type: sum
    sql: ${outbound_clicks} ;;
    drill_fields: [detail*]
  }

  measure: total_actions {
    type: sum
    sql: ${actions} ;;
    drill_fields: [detail*]
  }

  measure: total_reach {
    type: sum
    sql: ${reach} ;;
    drill_fields: [detail*]
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    drill_fields: [detail*]
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
    drill_fields: [detail*]
  }


  measure: cost_per_purchase {
    type: number
    sql: ${total_spend}/NULLIF(${total_website_purchases},0) ;;
    drill_fields: [detail*]
    value_format_name: usd
  }

  measure: cost_per_mobile_app_installation {
    type: number
    sql: ${total_spend}/NULLIF(${total_mobile_app_installations},0) ;;
    drill_fields: [detail*]
    value_format_name: usd
  }


  measure: cost_per_mobile_app_purchase {
    type: number
    sql: ${total_spend}/NULLIF(${total_mobile_app_purchases},0) ;;
    drill_fields: [detail*]
    value_format_name: usd
  }

  measure: cost_per_website_ceckout_initiated {
    type: number
    sql: ${total_spend}/NULLIF(${total_website_ceckout_initiated},0) ;;
    drill_fields: [detail*]
    value_format_name: usd
  }

  measure: cost_per_inline_link_click {
    type: number
    sql: ${total_spend}/NULLIF(${total_inline_link_clicks},0) ;;
    drill_fields: [detail*]
    value_format_name: usd
  }

  measure: total_inline_link_clicks {
    type: sum
    sql: ${TABLE}.inline_link_clicks ;;
  }

  #### NOTE: you will need to use the frequency column that appears in your dataset.

  measure: avg_frequency {
    description: "the average number of times your ad was served to each person"
    type: average
    sql: ${frequency} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  #### NOTE: you will need to use the cpm column that appears in your dataset.

  measure: avg_cpm {
    description: "The average cost you've paid to have 1,000 impressions on your ad."
    type: average
    sql: ${cpm} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  #### NOTE: you will need to use the cpp column that appears in your dataset.

  measure: avg_cpp {
    description: "The average cost you've paid to have your ad served to 1,000 unique people."
    type: average
    sql: ${cpp} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  #### NOTE: you will need to use the spend column that appears in your dataset.

  measure: total_spend {
    type: sum
    sql: ${spend} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: ROAS {
    type: number
    sql: ${total_website_purchase_value}/NULLIF(${total_spend},0) ;;
    value_format_name: decimal_2
  }

  measure: total_website_purchase_value {
    type: sum
    sql: ${website_purchase_values} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: avg_ctr {
    type: number
    sql: ${total_clicks}/nullif(${total_impressions},0);;
    value_format_name: percent_2
    drill_fields: [detail*]
  }

  measure: avg_cpc {
    type: number
    sql: ${total_spend}/nullif(${total_clicks},0) ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  # #### NOTE: you will need to use the ctr column that appears in your dataset.

  # measure: avg_ctr {
  #   type: average
  #   sql: ${TABLE}.ctr ;;
  # }

  # #### NOTE: you will need to use the cpc column that appears in your dataset.

  # measure: avg_cpc {
  #   type: average
  #   sql: ${TABLE}.cpc ;;
  #   value_format_name: usd
  # }

  #### NOTE: you will need to use the inline link click ctr column that appears in your dataset.

  measure: avg_inline_link_click_ctr {
    type: average
    sql: ${TABLE}.inline_link_click_ctr ;;
  }

  #### NOTE: you will need to use the cost per inline link click column that appears in your dataset.

  measure: avg_cost_per_inline_link_click {
    type: average
    sql: ${TABLE}.cost_per_inline_link_click ;;
    value_format_name: usd
  }

  set: detail {
    fields: [campaign_id, campaign_name, total_clicks, total_spend, total_impressions, total_reach, avg_frequency]
  }
}
