#### Удаление всех образов
- Список: docker images -a
- Удаление: docker rmi $(docker images -a -q)

#### Удаление всех закрытых контейнеров
- Список: docker ps -a -f status=exited
- Удаление: docker rm $(docker ps -a -f status=exited -q)

#### Остановка и удаление всех контейнеров
- Список: docker ps -a
- Удаление:
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

#### Получения доступа к логам контейнера
- docker logs -f   (-f follow)
123
cxvxbxbdf
