- dashboard: drill_demo
  title: Drill_demo
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: limit_demo
    name: limit_demo
    model: vip_demo
    explore: flights
    type: looker_line
    fields: [flights.date, flights.count]
    sorts: [flights.count desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Airline: flights.airline
      Departure State: flights.departure_state
    row: 0
    col: 0
    width: 24
    height: 7
  - title: pivot_sample
    name: pivot_sample
    model: vip_demo
    explore: flights
    type: looker_line
    fields: [flights.date, flights.average_arrival_actual]
    sorts: [flights.average_arrival_actual desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Airline: flights.airline
      Departure State: flights.departure_state
    row: 7
    col: 0
    width: 24
    height: 6
  - title: vis
    name: vis
    model: vip_demo
    explore: flights
    type: looker_line
    fields: [flights.date, flights.count_for_viz]
    sorts: [flights.count_for_viz desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Airline: flights.airline
      Departure State: flights.departure_state
    row: 13
    col: 0
    width: 24
    height: 6
  - title: scatter
    name: scatter
    model: vip_demo
    explore: flights
    type: looker_line
    fields: [flights.date, flights.count_for_scatter]
    sorts: [flights.count_for_scatter desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Airline: flights.airline
      Departure State: flights.departure_state
    row: 19
    col: 0
    width: 24
    height: 8
  - title: stack
    name: stack
    model: vip_demo
    explore: flights
    type: looker_line
    fields: [flights.date, flights.count_for_stack]
    sorts: [flights.count_for_stack desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Airline: flights.airline
      Departure State: flights.departure_state
    row: 27
    col: 0
    width: 24
    height: 8
  filters:
  - name: Airline
    title: Airline
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: vip_demo
    explore: flights
    listens_to_filters: []
    field: flights.airline
  - name: Departure State
    title: Departure State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: vip_demo
    explore: flights
    listens_to_filters: []
    field: flights.departure_state
