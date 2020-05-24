#### Удаление всех образов
- Список: docker images -a
- Удаление: docker rmi $(docker images -a -q), docker rmi $(docker images -q) -f

#### Удаление всех закрытых контейнеров
- Список: docker ps -a -f status=exited
- Удаление: docker rm $(docker ps -a -f status=exited -q)

#### Остановка и удаление всех контейнеров
- Список: docker ps -a
- Удаление:
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

#### Получения доступа к логам контейнера
- docker logs -f   (-f follow)

#### Запуск всех остановленных контейнеров
docker start $(docker ps -a -q -f status=exited)

###
If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:
``` sudo usermod -aG docker ${USER} ```

To apply the new group membership, log out of the server and back in, or type the following:
``` su - ${USER} ```
You will be prompted to enter your user’s password to continue.

Confirm that your user is now added to the docker group by typing:

`` id -nG ``
