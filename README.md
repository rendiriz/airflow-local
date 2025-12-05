# Airflow di Komputer Lokal

## Cara menambahkan _repository_ ini menjadi Git Submodule ke _repository project_ kita

```sh
git submodule add https://github.com/rendiriz/airflow-local.git airflow/local
```

## Cara Menggunakan Airflow

1. Pastikan [Docker Desktop](https://www.docker.com/products/docker-desktop/) sudah berjalan pada komputer.
2. Pastikan lokasi _folder_ pada _terminal_ sudah ada di `{root_repo}/airflow/local/` dan sudah ada _file_ `{root_repo}/airflow/dags/{dag_nama_file}.py`.
3. Jalankan perintah Docker Compose berikut ini di _terminal_ komputer:

    ```shell
    docker compose build  # Only at first time
    docker compose up airflow-init  # Only at first time
    docker compose up -d
    ```

    > Referensi dari [sini](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html).

4. Isi _username_ dan _password_ dengan `airflow` untuk _login_ lalu akses Airflow di [http://localhost:8080/](http://localhost:8080/).

    > _File_ `{root_repo}/airflow/dags/{dag_nama_file}.py` dapat diubah saat _service_ Airflow masih berjalan.

5. Buat _file_ `{root_repo}/airflow/local/.env` berdasarkan [`.env.template`](.env.template).

6. Apabila Airflow sudah tidak digunakan, jalankan perintah Docker Compose berikut ini di _terminal_ komputer untuk menghentikannya:

    ```shell
    docker compose down -v --remove-orphans
    ```