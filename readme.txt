測試環境
docker run -p 18088:8080 --add-host="cjas.local:10.144.226.122" --name cjas-dev-api -v /home/cjas/cjas-api/CJAS:/usr/src/app -d cjas/api python manage.py runserver 0.0.0.0:8080

上線環境
docker run -d -p 18088:80 --add-host="cjas.local:10.144.226.122" --name cjas-prod-api -v /home/cjas/cjas-api/CJAS:/usr/src/app cjas/api /usr/sbin/apache2ctl -D FOREGROUND

gitlab下載後如果有缺外部模組，請執行
pip install -r /path/to/requirement.txt