sudo apt-get install \
    git \
    gcc-10 \
    g++-10 \
    cmake \
    ninja-build \
    build-essential \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libeigen3-dev \
    libflann-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgtest-dev \
    libsqlite3-dev \
    libglew-dev \
    qtbase5-dev \
    libcgal-qt5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libceres-dev

git clone https://github.com/colmap/colmap.git && cd colmap  && git checkout 3.8
cd colmap 
mkdir build && cd build 
CC=/usr/bin/gcc-10 CXX=/usr/bin/g++-10 CUDAHOSTCXX=/usr/bin/g++-10 cmake .. -DCUDA_ENABLED=ON -DCMAKE_CUDA_ARCHITECTURES="all-major" -GNinja
ninja 
ninja install