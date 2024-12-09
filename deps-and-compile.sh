cd  root/
# could work. i don't know
# apt-get install libeigen3-dev

apt-get install liblog4cxx-dev

apt-get install libboost-all-dev

# Makefile refers to this lib as just opencv. Just creating symlink to actual .pc file
ln -s /usr/local/lib/pkgconfig/opencv-2.4.13.4.pc /usr/local/lib/pkgconfig/opencv.pc

git clone -b 3.2 https://gitlab.com/libeigen/eigen.git
cd /root/eigen/

git clone https://github.com/PRHLT/pageDistanceBasedContourGenerator

mv /root/eigen/Eigen/ /root/pageDistanceBasedContourGenerator/

cd /root/pageDistanceBasedContourGenerator/

make all

# ./extract_lines --help
# ./extract_lines -i 156730303.jpg -p 156730303.xml -o output.xml -w 4 -x -1
# cat output.xml 
