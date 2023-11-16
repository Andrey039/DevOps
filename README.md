## Информация по DevOps
Поиск 10 больших файлов
find ./ -type f -exec du -h {} + | sort -rh | head -n 10

Вывод размера директорий в директории
du -h --max-depth=1 /var/lib/docker/
