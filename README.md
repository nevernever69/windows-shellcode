# windows32bit-shellcode
### Here you can find shellcode written in x86 assembly for windows

## compile and link 
```bash
  nasm -f win32 {filename.asm}
  ld -m i386pe {filename.obj} -o {filename.exe}
```

### Note

- reverse.asm
    - change code for ip and port, by changing the instruction(for help read the comments in the code)



