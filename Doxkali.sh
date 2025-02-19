#!/bin/bash

# URL файла indexxx.html.
url="https://raw.githubusercontent.com/mogd-Kali/inddxxx/refs/heads/main/indexxx.html"

# Локальный путь для сохранения файла.
local_file="/tmp/indexxx.html"

# Проверяет, установлен ли wget. Если нет, то устанавливает его.
if ! command -v wget &> /dev/null; then
  echo "wget не установлен. Попытка установки..."
  sudo apt update
  if [ $? -ne 0 ]; then
    echo "Не удалось выполнить apt update. Убедитесь, что у вас есть root-права и подключение к Интернету."
    exit 1
  fi
  sudo apt install -y wget
  if [ $? -ne 0 ]; then
    echo "Не удалось установить wget. Убедитесь, что у вас есть root-права и что репозитории настроены правильно."
    exit 1
  fi
  echo "wget установлен успешно."
else
  echo "wget уже установлен."
fi

# Скачивает файл.
echo "Скачивание indexxx.html..."
wget -q "$url" -O "$local_file"
if [ $? -ne 0 ]; then
  echo "Не удалось скачать indexxx.html. Проверьте URL и подключение к Интернету."
  exit 1
fi

# Запускает простой HTTP-сервер на localhost.
echo "Запуск простого HTTP-сервера..."
cd /tmp
python3 -m http.server 8000 &
if [ $? -ne 0 ]; then
  echo "Не удалось запустить HTTP-сервер. Убедитесь, что установлен Python 3."
  exit 1
fi

# Запускает файл indexxx.html в браузере, указывая localhost.
echo "Запуск indexxx.html в браузере через localhost..."
xdg-open "http://localhost:8000/indexxx.html"
if [ $? -ne 0 ]; then
  echo "Не удалось открыть indexxx.html в браузере. Убедитесь, что установлен браузер."
  exit 1
fi

echo "Скрипт завершен."
