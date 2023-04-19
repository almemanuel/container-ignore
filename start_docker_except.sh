if [ $# -eq 0 ]; then
        echo "Uso: $0 [nome_da_pas1] [nome_da_pasta2] ..."
        exit 1
fi

IGNORE_LIST="$@"

for dir in */; do
        dir=${dir%*/}
    if [[ "$IGNORE_LIST" != *"$dir"* ]]; then
        cd "$dir" && docker-compose up -d --remove-orphans --build  && cd ..
    fi
done