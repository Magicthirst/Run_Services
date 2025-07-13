# Run_Services

Этот репозиторий содержит файлы для запуска микросервисов проекта Magicthirst.

Используются:
- Docker
  - Docker CLI
  - Docker Desktop
  - Docker Compose
- Руки (TODO вырезать)
- Git Bash (для Windows)

## Запуск

1. Чтобы создать Docker-image для каждого сервиса, необходимо запустить скрипт из файла [cli_build_image.sh.txt](cli_build_image.sh.txt).
1. Далее необходимо настроить volume'ы:
   1. В Docker Desktop создать volume'ы volume_service_hosts_py и volume_service_auth_py
   1. Запаковать в .tar импортировать в volume_service_hosts_py и volume_service_auth_py файлы из 
   соответствующих папок [Volume_Service_Hosts_Py](Volume_Service_Hosts_Py) и [Volume_Service_Auth_Py](Volume_Service_Auth_Py)
1. Далее необходимо всё запустить:
   - Выполнить `docker compose up -d`
   - Не использовать [cli_run_images.sh](cli_run_images.sh)

## TODO

1. Убрать необходимость ручками собирать образы
1. Убрать необходимость ручками создавать и заполнять volume'ы
1. Радоваться, что собирать все проекты вместе ручками не надо благодаря [docker-compose.yaml](docker-compose.yaml)
