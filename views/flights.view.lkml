# The name of this view in Looker is "Flights"
view: flights {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `allen-first.airline.flights`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Airline" in Explore.

  dimension: airline {
    type: string
    sql: ${TABLE}.airline ;;
    #  remember to upper case the first char
    link: {
      label: "{{value}} Analytics Dashboard"
      url: "/dashboards-next/10?&Airline={{value | encode_uri}}&Departure%20State=HI"
    }
    # html:<a href="/dashboards-next/10?&Airline={{value}}&Departure%20State=HI">{{value}}</a>  ;;
  }

  dimension: airline_filter {
    type: string
    sql: ${TABLE}.airline ;;
    #  remember to upper case the first char
    link: {
      label: "{{value}} Analytics Dashboard"
      url: "/dashboards-next/10?&Airline={{value | url_encode}}&Departure%20State={{_filters['flights.departure_state'] | url_encode}}"
    }
    # html:<a href="/dashboards-next/10?&Airline={{value}}&Departure%20State=HI">{{value}}</a>  ;;
  }

  dimension: airline_look {
    type: string
    sql: ${TABLE}.airline ;;
    #  remember to upper case the first char
    link: {
      label: "{{value}} look"
      url: "/looks/8?&&f[flights.airline]={{ value }}&f[flights.departure_state]={{ _filters['flights.departure_state'] | url_encode }}"
    }
    # html:<a href="/dashboards-next/10?&Airline={{value}}&Departure%20State=HI">{{value}}</a>  ;;
  }

  dimension: airline1 {
    type: string
    sql: ${TABLE}.airline ;;
    #  remember to upper case the first char
    #.  for html, the {{value}} in <a...></a> is to show value in explore, has nothing to do with filter
    # link: {
    #   label: "{{value}} Analytics Dashboard"
    #   url: "/dashboards-next/10?&Airline={{value | encode_uri}}&Departure%20State=HI"
    # }
    html:<a href="/dashboards-next/10?&Airline={{value}}&Departure%20State=HI">{{value}}</a>  ;;
  }

  dimension: airline_explore {
    type: string
    sql: ${TABLE}.airline ;;
    html: <a href="/explore/vip_demo/flights?fields=flights.airline,flights.count,flights.departure_state&f[flights.airline]={{ value }}&pivots=flights.departure_state">{{ value }}</a> ;;
  }

  dimension: airline_code {
    type: string
    sql: ${TABLE}.airline_code ;;
  }

  dimension: arrival_actual {
    type: number
    sql: ${TABLE}.arrival_actual ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: arrival_airport {
    type: string
    sql: ${TABLE}.arrival_airport ;;
  }

  dimension: arrival_delay {
    type: number
    sql: ${TABLE}.arrival_delay ;;
  }

  dimension: arrival_lat {
    type: number
    sql: ${TABLE}.arrival_lat ;;
  }

  dimension: arrival_lon {
    type: number
    sql: ${TABLE}.arrival_lon ;;
  }

  dimension: arrival_schedule {
    type: number
    sql: ${TABLE}.arrival_schedule ;;
  }

  dimension: arrival_state {
    type: string
    sql: ${TABLE}.arrival_state ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
    drill_fields: [airline]
  }

  dimension: departure_actual {
    type: number
    sql: ${TABLE}.departure_actual ;;
  }

  dimension: departure_airport {
    type: string
    sql: ${TABLE}.departure_airport ;;
  }

  dimension: departure_delay {
    type: number
    sql: ${TABLE}.departure_delay ;;
  }

  dimension: departure_lat {
    type: number
    sql: ${TABLE}.departure_lat ;;
  }

  dimension: departure_lon {
    type: number
    sql: ${TABLE}.departure_lon ;;
  }

  dimension: departure_schedule {
    type: number
    sql: ${TABLE}.departure_schedule ;;
  }

  dimension: departure_state {
    type: string
    sql: ${TABLE}.departure_state ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    # link: {
    #   label: "Explore Top 20 Results"
    #   url: "{{ link }}&limit=20"
    # }
    # link: {
    #   label: "Explore Top 20 Results by airline desc"
    #   url: "{{ link }}&sorts=flights.airline+desc&limit=20"
    # }
    link: {
      label: "Explore Top 20 Results by airline asc"
      url: "{{ link }}&sorts=flights.airline&limit=20"
    }

  }

  measure: count_for_viz{
    type: count
    # drill from chart and table data may leads to different chart
    drill_fields: [airline,total_arrival_actual]
  }

  measure: count_for_custom{
    type: count
    # drill from chart and table data may leads to different chart
    drill_fields: [airline,departure_state,total_arrival_actual]
    link: {
      label: "See as custom viz (heatmap)"
      url: "
      {% assign vis_config = '{
      \"minColor\" : \"#d6d6d6\",
      \"maxColor\" : \"#9a33e3\",
      \"dataLabels\" : false,
      \"custom_color_enabled\" : false,
      \"custom_color\" : \"forestgreen\",
      \"show_single_value_title\": true,
      \"show_comparison\" : false,
      \"comparison_type\" : \"value\",
      \"comparison_reverse_colors\": false,
      \"show_comparison_label\" : true,
      \"show_view_names\" : true,
      \"show_row_numbers\" : true,
      \"truncate_column_names\" : false,
      \"hide_totals\" : false,
      \"hide_row_totals\" : false,
      \"table_theme\" : \"editable\",
      \"limit_displayed_rows\" : false,
      \"enable_conditional_formatting\": false,
      \"conditional_formatting_include_totals\": false,
      \"conditional_formatting_include_nulls\": false,
      \"type\" : \"highcharts_heatmap\",
      \"stacking\" : \"\",
      \"show_value_labels\" : false,
      \"label_density\" : 250,
      \"legend_position\" : \"center\",
      \"x_axis_gridlines\" : false,
      \"y_axis_gridlines\" : true,
      \"y_axis_combined\" : true,
      \"show_y_axis_labels\" : true,
      \"show_y_axis_ticks\" : true,
      \"y_axis_tick_density\" : \"default\",
      \"y_axis_tick_density_custom\": 5,
      \"show_x_axis_label\" : true,
      \"show_x_axis_ticks\" : true,
      \"x_axis_scale\" : \"auto\",
      \"y_axis_scale_mode\" : \"linear\",
      \"ordering\" : \"none\",
      \"show_null_labels\" : false,
      \"show_totals_labels\" : false,
      \"show_silhouette\" : false,
      \"totals_color\" : \"#808080\",
      \"series_types\" : {},
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&sorts=flights.airline+asc,flights.departure_state+asc&toggle=dat,pik,vis&limit=5000"
    }
  }

  measure: count_for_stack{
    type: count
    # drill from chart and table data may leads to different chart
    drill_fields: [total_arrival_actual,airline,departure_state]
    link: {
      label: "Show as stacked line"
      url: "
      {% assign vis_config = '{
      \"stacking\" : \"normal\",
      \"legend_position\" : \"right\",
      \"x_axis_gridlines\" : false,
      \"y_axis_gridlines\" : true,
      \"show_view_names\" : false,
      \"y_axis_combined\" : true,
      \"show_y_axis_labels\" : true,
      \"show_y_axis_ticks\" : true,
      \"y_axis_tick_density\" : \"default\",
      \"show_x_axis_label\" : true,
      \"show_x_axis_ticks\" : true,
      \"show_null_points\" : false,
      \"interpolation\" : \"monotone\",
      \"type\" : \"looker_line\",
      \"colors\": [
      \"#5245ed\",
      \"#ff8f95\",
      \"#1ea8df\",
      \"#353b49\",
      \"#49cec1\",
      \"#b3a0dd\"
      ],
      \"x_axis_label\" : \"Month Number\"
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&sorts=flights.airline+asc,flights.departure_state+asc&pivots=flights.departure_state&toggle=dat,pik,vis&limit=500&column_limit=15"
    } # NOTE the &pivots=
  }


  measure: count_for_scatter{
    type: count
    # drill from chart and table data may leads to different chart
    drill_fields: [airline,total_arrival_actual]
    link: {
      label: "Show as scatter plot"
      url: "
      {% assign vis_config = '{
      \"stacking\" : \"\",
      \"show_value_labels\" : false,
      \"label_density\" : 25,
      \"legend_position\" : \"center\",
      \"x_axis_gridlines\" : true,
      \"y_axis_gridlines\" : true,
      \"show_view_names\" : false,
      \"limit_displayed_rows\" : false,
      \"y_axis_combined\" : true,
      \"show_y_axis_labels\" : true,
      \"show_y_axis_ticks\" : true,
      \"y_axis_tick_density\" : \"default\",
      \"y_axis_tick_density_custom\": 5,
      \"show_x_axis_label\" : false,
      \"show_x_axis_ticks\" : true,
      \"x_axis_scale\" : \"auto\",
      \"y_axis_scale_mode\" : \"linear\",
      \"show_null_points\" : true,
      \"point_style\" : \"circle\",
      \"ordering\" : \"none\",
      \"show_null_labels\" : false,
      \"show_totals_labels\" : false,
      \"show_silhouette\" : false,
      \"totals_color\" : \"#808080\",
      \"type\" : \"looker_scatter\",
      \"interpolation\" : \"linear\",
      \"series_types\" : {},
      \"colors\": [
      \"palette: Santa Cruz\"
      ],
      \"series_colors\" : {},
      \"x_axis_datetime_tick_count\": null,
      \"trend_lines\": [
      {
      \"color\" : \"#000000\",
      \"label_position\" : \"left\",
      \"period\" : 30,
      \"regression_type\" : \"average\",
      \"series_index\" : 1,
      \"show_label\" : true,
      \"label_type\" : \"string\",
      \"label\" : \"30 day moving average\"
      }
      ]
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }

  measure: total_arrival_actual {
    type: sum
    sql: ${arrival_actual} ;;
  }

  measure: average_arrival_actual {
    type: average
    sql: ${arrival_actual} ;;
    # To use pivot, measure has to be defined.
    drill_fields: [airline, departure_airport,arrival_airport,total_arrival_actual]
    link: {
      label: "total arrival by airline"
      url: "{{link}}&pivots=flights.airline"
    }
  }

  set: detail {
    fields: [airline, departure_airport,arrival_airport]
  }
}
