#docker build -t blendhair:v0 . for build environment of HairNet_DataSetGeneration
FROM ubuntu:16.04

# 解决报错：The following signatures couldn't be verified because the public key is not available: NO_PUBKEY A4B469963BF863CC
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
#更换为阿里源
# RUN echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal universe\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal-updates universe\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal multiverse\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal-updates multiverse\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal-security universe\n\
# deb http://mirrors.aliyun.com/ubuntu/ focal-security multiverse\n"\ > /etc/apt/sources.list
RUN apt-get update && apt-get install -y libglu1-mesa freeglut3 libgomp1 git libglew-dev libglfw3-dev libgl1-mesa-dev libfftw3-dev cmake build-essential libopencv-dev libglm-dev wget && git clone https://github.com/papagina/HairNet_DataSetGeneration
WORKDIR /HairNet_DataSetGeneration
VOLUME ["/HairNet_DataSetGeneration"]
# 映射 /data/HairStrand/hairstyles 到 /HairNet_DataSetGeneration/hairstyles; /HairNet_DataSetGeneration/blend_hairs/ 到 /data/HairStrand/blend_hairs
# ./HairMix_run HairClasses/ hairstyles/ cstrands/ blend_hairs/ 1 32 # 混合发型
# cd Hair_generate_convdata_and_imgs/build && ./Hair_generate_convdata_and_imgs ../../blend_hairs/ ../../blend_hairs_convdata/ ../../roots1024/map_roots1024.data ../../blend_hairs_imgs/ 4  # 生成训练图像
# ./Hair_Orient2D/build/Orient2D 1 test_imgs/  # 人脸图像生成方向图
# CMD ["./HairMix_run", "HairClasses/", "hairstyles/", "cstrands/", "blend_hairs/", "1", "32"]
# eee3cde57c63 for /Hair_generate/HairMix_run save to sftp://yangxinhang@10.10.52.151/data/HairStrand/blend_hairs
# 2e36c960e818 /hairnet/Hair_generate_convdata_and_imgs to sftp://yangxinhang@10.10.52.151/data/HairStrand/train_data/conv and sftp://yangxinhang@10.10.52.151/data/HairStrand/train_data/imgs

# conda activate neuconw && python src/main.py --mode train --path /data/HairStrand/train_data1 /data/HairStrand/train_data1(no body)
