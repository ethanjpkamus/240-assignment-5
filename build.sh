#Name: Ethan Kamus
#email: ethanjpkamus@csu.fullerton.edu

rm *.o
rm *.out
rm *.lis

echo "Assemble hypotenuse.asm"
nasm -f elf64 -l hypotenuse.lis -o hypotenuse.o hypotenuse.asm

echo "Compile main.cpp"
g++ -c -Wall -m64 -std=c++14 -o main.o -fno-pie -no-pie main.cpp

echo "Link all object files"
g++ -m64 -std=c++14 -fno-pie -no-pie main.o hypotenuse.o -o myprog.out

echo "Now the program will run"
./myprog.out
