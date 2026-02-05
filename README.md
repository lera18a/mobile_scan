# mobile_scan

По нажатию Scan сканирует штрихкод (камера) и запрашивает из внешнего API (мок) информацию о товаре: картинка, название, наличие по размерам.

## Репозиторий содержит 2 режима (2 ветки)
- `main` — **Mock Scanner**: по нажатию Scan штрихкод берётся из заранее заданного списка по кругу (без камеры)
- `feature/real-device` — **Camera Scanner**: используется камера устройства через пакет mobile_scanner

## Штрихкоды для теста
В корне проекта в папке `assets/` хранятся изображения штрихкодов — можно открыть их на экране компьютера/второго телефона и проверить кнопку **Scan**.

---
## Общая настройка (для обеих веток)
### 1) Mock API (Node.js)
Папка: `mock_api/`
#### Установка:
```bash
cd mock_api
npm install
```
#### Запуск:(важно запускать из папки mock_api/):
```
npm start
```
или 
```
node server.js
```

### 2) Flutter зависимости:
```
flutter pub get
```
### 3) В проекте используется json_serializable, сгенерировать файлы:

```
dart run build_runner build --delete-conflicting-outputs
```
---
### Режим с камерой тестировался на iPhone 11
-------
## Ветка main (Mock Scanner)
------
### Как работает
- Нажимаем Scan
- Штрихкод берётся из списка codes в main.dart (по кругу)
- Далее запрос в mock API и отрисовка товара
### Запуск
1) Запусти mock API (см. выше)
2) Запусти Flutter:
`flutter run`
### Host
iOS Simulator: http://localhost:3000
## Ветка feature/real-device (Camera Scanner)
____
### Как работает
- Нажимаем Scan
- Открывается экран камеры (CameraScan)
- После распознавания экран закрывается и возвращает barcode
- BLoC делает запрос в mock API и отрисовывает товар
### Запуск на реальном устройстве:
1) Запусти mock API (см. выше)
2) Узнай IP Mac:
`ipconfig getifaddr en0`
3) В lib/main.dart укажи:
`const ip = '<YOUR_MAC_IP>'`;
### Host:
```
const host = 'http://<YOUR_MAC_IP>:3000'; 
```

## Переключаться между ветками 
```
git checkout main 
```
или

```
git checkout feature/real-device
```