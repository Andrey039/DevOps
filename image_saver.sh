#!/bin/bash

# Путь к файлу с образами Docker
file="images.txt"

# Путь к каталогу для сохранения архивов
output_dir="./images"

# Создаем каталог для архивов, если он не существует
mkdir -p "$output_dir"

# Проверяем, существует ли файл
if [ ! -f "$file" ]; then
    echo "Файл $file не найден!"
    exit 1
fi

# Читаем и выводим список образов с номерами
echo "Список образов Docker:"
i=1
while read -r line; do
    echo "$i $line"
    i=$((i+1))
done < "$file"

# Запрос у пользователя номеров образов для сохранения
read -p "Введите номера образов для сохранения (через запятую) или 0 для сохранения всех: " input

# Функция для загрузки и архивации образа Docker
archive_image() {
    echo "Загружаем образ $1..."
    docker pull "$1"
    if [ $? -eq 0 ]; then
        image_name=$(echo $1 | sed 's/[:/]/_/g') # Заменяем ':' и '/' на '_'
        docker save "$1" | gzip > "${output_dir}/${image_name}.tar.gz"
        echo "Образ $1 сохранен в ${output_dir}/${image_name}.tar.gz"
    else
        echo "Ошибка при загрузке образа $1."
    fi
}

# Обработка ввода пользователя
if [ "$input" = "0" ]; then
    # Скачиваем и сохраняем все образы
    while read -r line; do
        archive_image "$line"
    done < "$file"
else
    # Скачиваем и сохраняем выбранные образы
    IFS=',' read -ra selected <<< "$input"
    for num in "${selected[@]}"; do
        image=$(sed -n "${num}p" "$file")
        if [ -n "$image" ]; then
            archive_image "$image"
        else
            echo "Номер $num не найден в списке."
        fi
    done
fi

# Спрашиваем пользователя о необходимости архивировать весь каталог
read -p "Хотите ли вы архивировать весь каталог с архивами образов? (y/n): " archive_dir_choice

if [ "$archive_dir_choice" = "y" ] || [ "$archive_dir_choice" = "Y" ]; then
    tar -czf images_backup.tar.gz -C "$output_dir" .
    echo "Каталог $output_dir архивирован в images_backup.tar.gz"
fi

