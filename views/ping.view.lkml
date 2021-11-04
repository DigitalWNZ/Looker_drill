# The name of this view in Looker is "Ping"
view: ping {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `aftership.ping`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average" in Explore.

  dimension: average {
    type: number
    sql: ${TABLE}.average ;;
  }

  dimension: clientip {
    type: string
    sql: ${TABLE}.clientip ;;
  }

  dimension: lost {
    type: number
    sql: ${TABLE}.lost ;;
  }

  dimension: max {
    type: number
    sql: ${TABLE}.max ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time ;;
    drill_fields: [detail*]
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_average {
    type: sum
    hidden: yes
    sql: ${average} ;;
  }

  measure: average_average {
    type: average
    hidden: yes
    sql: ${average} ;;
  }

  measure: total_lost {
    type: sum
    hidden: yes
    sql: ${lost} ;;
  }

  measure: average_lost {
    type: average
    hidden: yes
    sql: ${lost} ;;
  }

  measure: total_max {
    type: sum
    hidden: yes
    sql: ${max} ;;
  }

  measure: average_max {
    type: average
    hidden: yes
    sql: ${max} ;;
  }

  measure: total_total {
    type: sum
    hidden: yes
    sql: ${total} ;;
  }

  measure: average_total {
    type: average
    hidden: yes
    sql: ${total} ;;
  }

  set: detail {
    fields: [platform, clientip]
  }
}
