view: adcreative {
  sql_table_name: facebook_all_accounts.adcreative ;;

    dimension: actor_id {
      type: string
      sql: ${TABLE}.actor_id;;
    }

    dimension: call_to_action_type {
      type: string
      sql: ${TABLE}.call_to_action_type;;
    }

    dimension: id {
      type: string
      sql: ${TABLE}.id;;
    }

    dimension: image_hash {
      type: string
      sql: ${TABLE}.image_hash;;
    }

    dimension: image_url {
      type: string
      sql: ${TABLE}.image_url;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name;;
    }

    dimension: object_story_id {
      type: string
      sql: ${TABLE}.object_story_id;;
    }


    dimension: object_url {
      type: string
      sql: ${TABLE}.object_url;;
    }

    dimension: title {
      type: string
      sql: ${TABLE}.title;;
    }

    dimension: body {
      type: string
      sql: ${TABLE}.body;;
    }

    dimension: link_og_id {
      type: string
      sql: ${TABLE}.link_og_id;;
    }

    dimension: account_id {
      type: string
      sql: ${TABLE}.account_id;;
    }

    dimension: status {
      type: string
      sql: ${TABLE}.status;;
    }

    dimension: effective_instagram_story_id {
      type: string
      sql: ${TABLE}.effective_instagram_story_id;;
    }

    dimension: effective_object_story_id {
      type: string
      sql: ${TABLE}.effective_object_story_id;;
    }

    dimension: object_type {
      type: string
      sql: ${TABLE}.object_type;;
    }

    dimension: thumbnail_url {
      type: string
      sql: ${TABLE}.thumbnail_url;;
    }

    dimension: instagram_actor_id {
      type: string
      sql: ${TABLE}.instagram_actor_id;;
    }

    dimension: instagram_permalink_url {
      type: string
      sql: ${TABLE}.instagram_permalink_url;;
  }
}
