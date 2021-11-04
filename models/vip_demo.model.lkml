# Define the database connection to be used for this model.
connection: "bq_test"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: vip_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: vip_demo_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Vip Demo"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: ping {
}

explore: flights{
}

# explore: ping {
#   sql_always_where: ${ping.clientip} is not null;;
#   join: ip_by_country {
#     type: inner
#     sql_on: ${ping.clientip} between ${ip_by_country.start_ip} and ${ip_by_country.end_ip} ;;
#     relationship: many_to_one
#   }
# }
