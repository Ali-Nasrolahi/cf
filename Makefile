CC=gcc
CXX=g++

CFLAGS += -Wall -g3 -pthread -Iinc
CXXFLAGS += -Wall -g3 -pthread -Iinc

srcs := $(shell find \( -name "*.cpp" -o -name "*.c" \))

#all: $(srcs:%.cpp=%) $(srcs:%.c=%)

all: cmake_build

cmake_build:
	cmake -Bbuild
	cmake --build build -j 10

clean:
	rm -f *.o *.bin
	find * -type f -executable -delete
	cmake --build build --target clean

%: %.o
	$(CXX) $^ -o $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

pre:
	$(CXX) -E cf.cpp

format:
	clang-format -i --style=file \
		$(shell find . ! -path "./build/*" \( -name '*.h' -o -name '*.hpp' -o -name '*.tcc' -o -name '*.c' -o -name '*.cpp' \))

new: clean
	sed -i "s/@date.*/@date $(shell date +%F)./g" inc/common.hpp cf.cpp

save:
ifeq ($(NAME),)
	cp cf.cpp saves/cf-$(shell date '+%Y%m%d').cpp
else
	cp cf.cpp saves/$(NAME).cpp
endif

load: clean
ifneq ($(NAME),)
	cp saves/$(NAME).cpp cf.cpp
endif
