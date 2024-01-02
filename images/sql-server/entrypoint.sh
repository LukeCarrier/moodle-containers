#!/bin/bash

SA_USER="${SA_USER:-sa}"
export SA_PASSWORD="${SA_PASSWORD:-Pa\$\$w0rd}"
SQL_LOGIN_TIMEOUT_SECS="${SQL_LOGIN_TIMEOUT_SECS:-1}"
SQL_QUERY_TIMEOUT_SECS="${SQL_QUERY_TIMEOUT_SECS:-10}"
SQL_HOST="${SQL_HOST:-localhost}"
SQL_ERROR_SEVERITY_LEVEL="${SQL_ERROR_SEVERITY_LEVEL:-1}"
SQL_LIVENESS_QUERY="${SQL_LIVENESS_QUERY:-select name from sys.databases where state_desc != 'ONLINE'}"
SQL_LIVENESS_EXPECT="${SQL_LIVENESS_EXPECT:-0 rows affected}"

RETRY_DELAY_SECS="${RETRY_DELAY_SECS:-5}"
MAX_ATTEMPTS="${MAX_ATTEMPTS:-100}"

STARTUP_SQL=/startup.sql

# Enable job control
set -m

# Launch SQL Server backgrounded
/opt/mssql/bin/sqlservr &
sql_server_pid=$!

# Query the server
sql_server_query() {
  local switch="$1"
  local query="$2"

  /opt/mssql-tools/bin/sqlcmd \
      -l "$SQL_LOGIN_TIMEOUT_SECS" \
      -t "$SQL_QUERY_TIMEOUT_SECS" \
      -V "$SQL_ERROR_SEVERITY_LEVEL" \
      -S "$SQL_HOST" \
      -U "$SA_USER" -P "$SA_PASSWORD" \
      "$switch" "$query"
}

# Wait for it to be available
sql_server_try_ready() {
  sql_server_query -Q "$SQL_LIVENESS_QUERY" 2>/dev/null \
      | grep --quiet "$SQL_LIVENESS_EXPECT"
}

echo "${0}: Waiting for all SQL Server databases to be ready..."
attempts=0
is_ready=1
while (( is_ready != 0 )) && (( attempts < $MAX_ATTEMPTS )); do
  sleep "$RETRY_DELAY_SECS"
  sql_server_try_ready
  is_ready=$?
  (( attempts++ ))
  echo "${0}: Attempt ${attempts} of ${MAX_ATTEMPTS}; ready=${is_ready}"
done

if (( is_ready != 0 )); then
  echo "${0}: gave up waiting after ${MAX_ATTEMPTS} attempts; aborting"
  kill $sql_server_pid
  echo "${0}: waiting for SQL Server to stop"
  while kill -0 $sql_server_pid 2>/dev/null; do
    sleep "$RETRY_DELAY_SECS"
    echo "${0}: still waiting for SQL Server to stop"
  done
  exit 1
fi

echo "${0}: Running startup script"
sql_server_query -i "$STARTUP_SQL"

echo "${0}: Done; returning SQL Server to the foreground"
fg
