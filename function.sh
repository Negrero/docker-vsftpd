
#Esta función crea un subdirectorio que es propiedad del 
#usuario no root bajo la vía de acceso de montaje de volumen compartido.
create_data_dir() {
  MY_USER=${MY_USER:-"myguest"}
  echo ${MY_USER:-"myguest"}
  echo "param $1"
  echo "param $MY_USER"
}

create_data_dir /skdjfhk/mierda masmierda