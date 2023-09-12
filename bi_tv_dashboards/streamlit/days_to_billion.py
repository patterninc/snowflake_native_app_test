# Import python packages
import streamlit as st
from snowflake.snowpark.context import get_active_session

# Write directly to the app
st.title("Days to $2 Billion")

# Get the current credentials
session = get_active_session()

tableName = 'code_schema.REPORT__DAYS_TO_BILLION__VELOCITY__VIEW'
queried_data = session.table(tableName)

days = queried_data.select(queried_data["DAYS"])

hours = queried_data.select(queried_data["HOURS"])

minutes = queried_data.select(queried_data["MINUTES"])

# Display the Pandas data frame as a Streamlit data frame.
st.text(f'{days} DAYS   {hours} HOURS   {minutes} MINUTES')