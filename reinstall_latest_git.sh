# remove git
sudo yum remove git -y

# detect newest git version
GIT_VERSION=$(curl -sL https://github.com/git/git/releases | sed -nre 's:\s*<a href="/git/git/releases/tag/v(.+)">:\1:p' | sort -dr | head -n 1)

# install depends
sudo yum install -y tar gcc-c++ curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker

# download source archive
curl -OL https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz
tar -zxf v${GIT_VERSION}.tar.gz

# compile and install
cd git-${GIT_VERSION}
make configure
./configure --prefix=/usr/local
make all
sudo make install

# cleanup
cd ../
rm -rf git-${GIT_VERSION}/ v${GIT_VERSION}.tar.gz
unset GIT_VERSION
