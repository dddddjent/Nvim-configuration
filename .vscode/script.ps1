param(
        [Parameter()]
        [String]$param
     )

if ($param -eq "f1")
{
    cmake -B build -S . `
        -G Ninja `
        -DCMAKE_BUILD_TYPE=Debug `
        -DCMAKE_EXPORT_COMPILE_COMMANDS=on
}
if ($param -eq "f2")
{
    cmake --build build
}
if ($param -eq "f3")
{
    ./build/src/foo
}
if ($param -eq "f4")
{
    python main.py
}
