# lwu3_idw

## Usage


### 1. pull docker image
docker image를 pull 받거, 직접 빌드합니다. 편의상 docker image를 pull 하도록 합니다.

```bash
docker pull epinet/lwu3_idw
```

### 2. prepare data directory 

[./data/](./data) 디렉토리를 적당한 위치에 복사하거나 git clone 으로 프로젝트 전체를 복사합다. 편의상 git clone 로 프로젝트 전체를 복사하도록 합니다.

```bash
cd ~
git clone https://github.com/dogbull/lwu3_idw.git
cd lwu3_idw
```

입력 파일을 헤더 `lon,lat,value` 를 포함한 `.csv` 형식으로 준비합니다. 입력 파일의 위치는 [./data/](./data) 입니다.

* 샘플 데이터 [./data/data.csv](./data/data.csv) 내용.
```bash
lon,lat,value
128.5,38.2,20
127.0,37.0,-20
129.5,36.2,-10
127.5,35.2,15
126.5,33.2,30
```


###  3. run

```bash
cd ~/lwu3_idw/
docker run -it --rm -v $(pwd)/data/:/data epinet/lwu3_idw run
```
./data/ 디렉토리에 output.tiff, output.png 파일이 생성됩니다.

### 출력 결과

![capture2.png](capture2.png)
