# lwu3_idw

Bash script and template/sample data to rasterize scattered points using `IDW` algorithm.

## Prerequisites

* `gdal`>=2.2.3


## Usage

### Input data.

입력 파일을 헤더 `lon,lat,value` 를 포함한 `.csv` 형식으로 준비합니다.

* 샘플 데이터 [data.csv](data.csv) 내용.
```bash
lon,lat,value
128.5,38.2,10
127.0,37.0,20
129.5,36.2,30
127.5,35.2,40
126.5,33.2,50
```

### 명령 실행.

명령어 형식 은 `bash run <resolution> <left> <bottom> <right> <top> <output_file_path>` 입니다.

#### 사용예 1

`평택(좌하:127,37)~춘천(우상:128,38)`의 영역을 해상도 `0.01°`(약 `1km` 해상도) 로 출력합니다.

```bash
bash run 0.01 127 37 128 38 output.tiff
```

#### 사용예 2

`남한 전체` 영역을 해상도 `0.001°`(약 `100m` 해상도) 로 출력합니다.

```bash
export resolution=0.001
export left=124.4
export bottom=33.0
export right=131.9
export top=39.0
export output=output.tiff
bash run $resolution $left $bottom $right $top $output
```

출력 결과

![result.png](capture1.png)
