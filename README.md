## Домашняя работа 2 по Flutter
#### Хамид Карим БПИ214

Разработку проводил на Google Pixel 3a. Пакеты используют "hw1", но я не думаю что это критично, я просто использую код, написанный в дз 1 и переименовывать проект не вижу смысла(надеюсь, это не наказуемо🙃).

Реализовано сохранение  избранное при нажатии на иконку звездочки. При повторном нажатии, запись удаляется из избранного. Данное сохранение происходит и в `SharedPreferences`, что дает возможность не терять данные при перезаходах в приложение(Хотя это я вообще не понимаю, ведь всегда используется backend для сохранения и подгрузки. Можно говорить про кеширование конечно, но кеширование происходит со стороны сервера для корректного отображения информации, а кеш в приложении скорее всего будет отображать недостоверную информацию).

Для того, чтобы запустить проект, нужно по `.env.example` сделать .env файл в корне и прописать свой api ключ.

Также, добавил отдельно стили, чтобы было удобно использовать их стандартизировано(я не нашел как можно например padding установить через тему в main)

Еще, я сделал так, чтобы во время загрузки был прямоугольник под размер картинки, чтобы лента не скакала.
