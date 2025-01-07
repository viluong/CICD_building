# Usage: ./wait-for.sh <host> <port> [timeout]

host="$1"
port="$2"
timeout="${3:-30}"  # Default timeout is 30 seconds

echo "Waiting for $host:$port..."

while ! nc -z "$host" "$port"; do
  sleep 1
  timeout=$((timeout - 1))
  if [ "$timeout" -le 0 ]; then
    echo "Timeout waiting for $host:$port"
    exit 1
  fi
done

echo "$host:$port is ready!"